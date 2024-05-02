package hcmute.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hcmute.entity.Blog;
import hcmute.entity.User;
import hcmute.services.BlogServiceImpl;
import hcmute.services.IBlogService;
import hcmute.services.IUserService;
import hcmute.services.UserServiceImpl;
import hcmute.utils.*;

@MultipartConfig
@WebServlet(urlPatterns = { "/user/blogs-page", "/user/blogs", "/user/update-blog-status", "/user/add-blog",
		"/user/edit-blog", "/user/blog-content" })

public class UserBlogController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	IBlogService blogService = new BlogServiceImpl();
	IUserService uService = new UserServiceImpl();

	User user = new User();// session login
	Date currentDay = new Date(); // curren day

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("blogs-page")) {
			int page = Integer.parseInt(req.getParameter("page") == null ? "1" : req.getParameter("page"));
			String searchStr = req.getParameter("search") == null ? "" : req.getParameter("search");
			List<Blog> listBlog = blogService.findAll(searchStr);
			List<User> listUser = uService.findAll();
			int pagesize = 3 * 3;
			List<Blog> listBlogPage = blogService.findAll(page - 1, pagesize, searchStr);
			int pageNum = (int) (listBlog.size() / pagesize) + (listBlog.size() % pagesize == 0 ? 0 : 1);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("topicIMG", Constants.FOLDER_BLOG);
			req.setAttribute("avatarIMG", Constants.FOLDER_AVATAR);
			req.setAttribute("listBlog", listBlogPage);
			req.setAttribute("listUser", listUser);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/blogs_page.jsp");
			rd.forward(req, resp);

		} else if (url.contains("blog-content")) {

			String id = req.getParameter("id");
			Blog Blog = blogService.findOneById(id);
			req.setAttribute("listBlog", blogService.Find3blog(id));
			req.setAttribute("blog", Blog);
			req.setAttribute("folder", Constants.FOLDER_BLOG);
			req.setAttribute("id", req.getParameter("id"));
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/blog_content.jsp");
			rd.forward(req, resp);
		}

		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");

			if (url.contains("blogs")) {
				List<Blog> listBlog = blogService.findAll();
				List<User> listUser = uService.findAll();
				req.setAttribute("user", user);
				req.setAttribute("folder", Constants.FOLDER_AVATAR);
				req.setAttribute("listBlog", listBlog);
				req.setAttribute("listUser", listUser);
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/blog.jsp");
				rd.forward(req, resp);
			} else if (url.contains("update-blog-status")) {
				Blog b = blogService.findOneById(req.getParameter("id"));
				b.setStatus(Integer.parseInt(req.getParameter("status")));
				try {
					blogService.update(b);
					resp.sendRedirect(req.getContextPath() + "/user/blogs");
				} catch (Exception e) {
					req.setAttribute("e", e.getMessage());
					RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
					rd.forward(req, resp);
				}
			} else if (url.contains("add-blog")) {
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/addBlog.jsp");
				rd.forward(req, resp);
			} else if (url.contains("edit-blog")) {
				String id = req.getParameter("id");
				Blog oldBlog = blogService.findOneById(id);

				req.setAttribute("blog", oldBlog);
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/editBlog.jsp");
				rd.forward(req, resp);
			}
		} else {
			req.setAttribute("e", "Chưa đăng nhập !");
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
			rd.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		if (url.contains("add-blog")) {
			if (req.getPart("image").getSize() != 0) {
				Blog newBlog = new Blog();
				long millis = System.currentTimeMillis();
				Date date = new Date(millis);
				newBlog.setCreatedDate(date);
				String fileName = "" + System.currentTimeMillis();
				newBlog.setImage((UploadUtils.processUpload("image", req,
						Constants.DIR + "\\" + Constants.FOLDER_BLOG + "\\", fileName)));

				String title = req.getParameter("title");
				String content = req.getParameter("content");
				User user = (User) session.getAttribute("user");
				newBlog.setBlogId("ID");
				newBlog.setContent(content);
				newBlog.setStatus(0);
				newBlog.setTitle(title);
				newBlog.setUsers(user);

				try {
					blogService.insert(newBlog);
					resp.sendRedirect(req.getContextPath() + "/user/blogs");
				} catch (Exception e) {
					req.setAttribute("e", e.getMessage());
					RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
					rd.forward(req, resp);
				}

			}
		} else if (url.contains("edit-blog")) {
			String id = req.getParameter("id");
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			Blog newBlog = new Blog();
			Blog oldBlog = blogService.findOneById(id);

			newBlog.setTitle(title);
			newBlog.setContent(content);
			newBlog.setBlogId(id);
			newBlog.setCreatedDate(currentDay);
			newBlog.setStatus(oldBlog.getStatus());
			newBlog.setUsers(user);

			try {
				if (req.getPart("image").getSize() == 0) {
					newBlog.setImage(oldBlog.getImage());
				} else {// xoa anh cu
					if (oldBlog.getImage() != null) {
						DeleteImage.deleteImage(oldBlog.getImage(), Constants.FOLDER_BLOG);
					} // update anh moi
					String fileName = "" + System.currentTimeMillis();
					newBlog.setImage((UploadUtils.processUpload("image", req,
							Constants.DIR + "\\" + Constants.FOLDER_BLOG + "\\", fileName)));
				}

				blogService.update(newBlog);
				resp.sendRedirect(req.getContextPath() + "/user/blogs");
			} catch (Exception e) {
				req.setAttribute("e", e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
				rd.forward(req, resp);
			}

		}
	}
}
