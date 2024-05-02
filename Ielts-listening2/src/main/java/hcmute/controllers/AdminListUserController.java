package hcmute.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hcmute.entity.User;
import hcmute.entity.UserCourse;
import hcmute.services.AccountServiceImpl;
import hcmute.services.AdminListUserServiceImpl;
import hcmute.services.IAccountServices;
import hcmute.services.IAdminListUserService;
import hcmute.services.IUserService;
import hcmute.services.UserServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.DeleteImage;
import hcmute.utils.UploadUtils;

@WebServlet(urlPatterns = { "/admin/listUser", "/admin/capnhattaikhoan", "/admin/khoahoccuatoi" })
@MultipartConfig (fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*50)
public class AdminListUserController extends HttpServlet {
	IAccountServices accountService = new AccountServiceImpl();
	IAdminListUserService adminService = new AdminListUserServiceImpl();
	IUserService userService = new UserServiceImpl();

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		if (url.contains("admin/listUser")) {
			FindAll(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_listUser.jsp");
			rd.forward(req, resp);
		}else if(url.contains("admin/capnhattaikhoan")) {
			FindById(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_capnhattaikhoan.jsp");
			rd.forward(req, resp);
		} else if (url.contains("khoahoccuatoi")) {
			String userId = req.getParameter("userId");
			
			Long count = userService.countCourseByUserId(userId);
			User userCurrent = userService.findUserByID(userId);
			List<UserCourse> listUserCourse = userService.findAllUserCourseByUserId(userId);
			req.setAttribute("userCourse", listUserCourse);
			req.setAttribute("userId", userId);
			req.setAttribute("currentUser", userCurrent);
			req.setAttribute("count", count);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_khoahoc_user.jsp");
			rd.forward(req, resp);
		}
	}

	private void FindById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String userId = req.getParameter("userId");

			System.out.print("userId la: " + userId);
			User user = adminService.findUserById(userId);

			req.setAttribute("currentUser", user);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}


	}


	private void FindAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		try {
			List<User> users = adminService.findAllUser();

			req.setAttribute("currentUser", users);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if(url.contains("admin/capnhattaikhoan")) {
			System.out.println("lamm post");
			UpdateInfo(req, resp);
			/* resp.sendRedirect(req.getContextPath() + "/admin/listUser"); */

		}
	}

	private void UpdateInfo(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			String userId = req.getParameter("userId");
			User user = userService.findUserByID(userId);
			String name = req.getParameter("inputName").trim();
			String phoneNumber = req.getParameter("inputPhone").trim();

			String address = req.getParameter("inputAddress").trim();
			String dateOfBirth = req.getParameter("datePicker").trim();
			

			Integer currentNetworth = 0;
			

			if (req.getPart("inputImage").getSize() == 0) {
				user.setImage(user.getImage());
			} else { // xoa anh cu
				if (user.getImage() != null) {
					String fileImg = user.getImage();
					DeleteImage.deleteImage(user.getImage(), Constants.FOLDER_AVATAR);
				} // update anh moi
				String fileName = "" + System.currentTimeMillis();
				user.setImage(UploadUtils.processUpload("inputImage", req,
						Constants.DIR + "\\" + Constants.FOLDER_AVATAR + "\\", fileName));
			}

			if (dateOfBirth == "") {
				dateOfBirth = null;
			}

		
			if (phoneNumber.length() == 10 && phoneNumber.matches("[0-9]+")) {
				if (userService.findDuplicatePhone(phoneNumber, user.getUserId()) == false) {
					req.setAttribute("messError", "Số điện thoại đã được sử dụng!");
				}
			} else {
				req.setAttribute("messError", "Số điện thoại không hợp lệ!");
			}
			System.out.println("errrr " + req.getAttribute("messError"));
			if (req.getAttribute("messError") == null) {
				user.setName(name);
				user.setPhoneNumber(phoneNumber);
				user.setAddress(address);
				user.setDateOfBirth(dateOfBirth);
				user.setNetworth(currentNetworth);
				userService.update(user);
			}
			
			req.setAttribute("currentUser", user);
			req.setAttribute("message", "Cập nhật thành công!");
			System.out.println("lamm" + user.getName());
			resp.sendRedirect(req.getContextPath() + "/admin/capnhattaikhoan?userId=" + user.getUserId());

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}
	}
}
