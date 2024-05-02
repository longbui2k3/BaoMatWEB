package hcmute.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hcmute.entity.Cart;
import hcmute.entity.Course;
import hcmute.entity.User;
import hcmute.entity.UserCourse;
import hcmute.services.CartServiceImpl;
import hcmute.services.CourseServiceImpl;
import hcmute.services.ICartService;
import hcmute.services.ICourseService;
import hcmute.services.IUserCourseService;
import hcmute.services.UserCourseServiceImpl;
import hcmute.utils.Constants;

@WebServlet(urlPatterns = { "/user/addToCart", "/user/mycart", "/user/deleteToCart" })
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		ICartService cartService = new CartServiceImpl();
		/*
		 * ICourseService courseService = new CourseServiceImpl(); IUserCourseService
		 * userCourseService = new UserCourseServiceImpl();
		 */
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			int countAddToCartByUser = 0;

			List<Cart> finalCarts = new ArrayList<Cart>();
			User user = (User) session.getAttribute("user");
			int networth = user.getNetworth() == null ? 0 : user.getNetworth();
			if (url.contains("mycart")) {

				

				// String userId = req.getParameter("userId") == null ? "" :
				// req.getParameter("userId");

				

				List<Cart> carts = cartService.findByUserId(user.getUserId());
//				PrintWriter out = resp.getWriter();
//				for (Cart cart : carts)
//					out.println(cart.getCartId());
				for (Cart cart2 : carts) {
					cartService.update(cart2);
					if (cart2.isBuy() == false)
						finalCarts.add(cart2);
				}
				countAddToCartByUser = finalCarts.size();

				session.setAttribute("cart", finalCarts);
				req.setAttribute("folder", Constants.FOLDER_COURSE);
				req.setAttribute("course", finalCarts);
				req.setAttribute("countAddToCartByUser", countAddToCartByUser);
				req.setAttribute("user", user);
				req.setAttribute("networth", networth);
				/*
				 * PrintWriter out = resp.getWriter(); out.print("err"+ finalCarts);
				 */

				req.getRequestDispatcher("/views/user/cart.jsp").forward(req, resp);
			}


			session.setAttribute("cart", finalCarts);
			req.setAttribute("course", finalCarts);
			req.setAttribute("countAddToCartByUser", countAddToCartByUser);
			req.setAttribute("user", user);
			req.setAttribute("networth", networth);
			/*
			 * PrintWriter out = resp.getWriter(); out.print("err"+ finalCarts);
			 */

			req.getRequestDispatcher("/views/user/cart.jsp").forward(req, resp);

		} else {
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
			rd.forward(req, resp);

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		ICourseService courseService = new CourseServiceImpl();
		ICartService cartService = new CartServiceImpl();
		IUserCourseService userCourseService = new UserCourseServiceImpl();
		HttpSession session = req.getSession(false);
		String prevUrl = req.getHeader("referer");
		String[] prev = prevUrl.split("/");
		String lastPrevUrl = prev[prev.length - 1];
		if (url.contains("addToCart")) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
				req.setAttribute("err", "Not Login");
				resp.sendRedirect(req.getContextPath() + "/user/" + lastPrevUrl);
			} else {
				String courseId = req.getParameter("courseId");
//				@SuppressWarnings("unchecked")
				List<Cart> carts = (List<Cart>) session.getAttribute("cart");
				int flag = 0;
				for (Cart cart : carts) {
					if (cart.getCourse().getCourseId().equals(courseId)) {
						flag = 1;
						break;
					}
				}
				List<UserCourse> usercourseList = userCourseService.findByUserIdAndCourseId(user.getUserId(), courseId);
				if (usercourseList.size() != 0)
					flag = 1;
				if (flag == 1) {
					System.out.println("Da mua");
					req.setAttribute("err", "Existed");
					resp.sendRedirect(req.getContextPath() + "/user/" + lastPrevUrl);
				} else {
					Course course = courseService.findById(courseId);
					Cart cart = new Cart();
					cart.setCourse(course);
					cart.setUsers(user);
					cart.setBuy(false);
					cart.setCartId("ID");
					cartService.insert(cart);
					List<Cart> cartsUpdated = cartService.findByUserId(user.getUserId());
					List<Cart> finalCarts = new ArrayList<Cart>();
					for (Cart cart2 : cartsUpdated) {
						if (cart2.isBuy() == false)
							finalCarts.add(cart2);
					}

					session.setAttribute("cart", finalCarts);
					resp.sendRedirect(req.getContextPath() + "/user/" + lastPrevUrl);
				}

			}

		} else if (url.contains("deleteToCart")) {

			String cartId = req.getParameter("cartId");
			cartService.delete(cartId);
			User user = (User) session.getAttribute("user");
			List<Cart> cartsUpdated = cartService.findByUserId(user.getUserId());
			List<Cart> finalCarts = new ArrayList<Cart>();
			for (Cart cart2 : cartsUpdated) {
				if (cart2.isBuy() == false)
					finalCarts.add(cart2);
			}

			session.setAttribute("cart", finalCarts);

			resp.sendRedirect(req.getContextPath() + "/user/" + lastPrevUrl);
		}
	}
}
