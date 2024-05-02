package hcmute.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JPAConfig.JPAConfig;
import hcmute.DAO.IPayDetailDAO;
import hcmute.entity.Cart;
import hcmute.entity.CombineCart;
import hcmute.entity.Course;
import hcmute.entity.PayDetail;
import hcmute.entity.Payment;
import hcmute.entity.User;
import hcmute.entity.UserCourse;
import hcmute.services.CartServiceImpl;
import hcmute.services.CourseServiceImpl;
import hcmute.services.ICartService;
import hcmute.services.ICourseService;
import hcmute.services.IPayDetailService;
import hcmute.services.IPaymentService;
import hcmute.services.IUserCourseService;
import hcmute.services.IUserService;
import hcmute.services.PayDetailServiceImpl;
import hcmute.services.PaymentServiceImpl;
import hcmute.services.UserCourseServiceImpl;
import hcmute.services.UserServiceImpl;
import hcmute.utils.Constants;

@WebServlet(urlPatterns = { "/user/order", "/user/updateNetworth", "/user/confirmCheckout" })
public class UserOrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	User user = new User();
	String listCourseId = "";
	ICourseService courseService = new CourseServiceImpl();
	IUserCourseService userCourseService = new UserCourseServiceImpl();
	IPaymentService paymentService = new PaymentServiceImpl();
	IPayDetailService payDetailService = new PayDetailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		HttpSession session = req.getSession(false);
		user = (User) session.getAttribute("user");
		if (user != null) {
			if (url.contains("order")) {
				listCourseId = req.getParameter("listCourseId");
				if (listCourseId != null) {
					String[] courseIds = listCourseId.split("&");
					List<Course> courseList = new ArrayList<Course>();
					for (String courseId : courseIds) {
						if (!courseId.isEmpty()) {
							Course course = courseService.findById(courseId);
							courseList.add(course);
						}
					}
					req.setAttribute("folder", Constants.FOLDER_COURSE);
					req.setAttribute("networth", user.getNetworth());
					req.setAttribute("courseList", courseList);
					RequestDispatcher rd = req.getRequestDispatcher("/views/user/order.jsp");
					rd.forward(req, resp);
				}
			}

		} else {
			PrintWriter out = resp.getWriter();
			out.println("Chưa login");
			req.setAttribute("e", "Chưa đăng nhập");
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/error404.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		IUserService userService = new UserServiceImpl();
		ICartService cartService = new CartServiceImpl();
		if (url.contains("updateNetworth")) {
			String inputNetworth = req.getParameter("inputNetworth");
			int networth = Integer.parseInt(inputNetworth) + user.getNetworth();
			user.setNetworth(networth);
			userService.update(user);
			HttpSession session = req.getSession(false);
			session.setAttribute("user", user);
			resp.sendRedirect(req.getContextPath() + "/user/order?listCourseId=" + listCourseId.replaceAll("&", "%26"));
		} else if (url.contains("confirmCheckout")) {
			String[] courseIds = listCourseId.split("&");
			int totalCost = Integer.parseInt(req.getParameter("totalCost"));
			List<Course> courseList = new ArrayList<Course>();
			for (String courseId : courseIds) {
				Course course = courseService.findById(courseId);
				courseList.add(course);
			}

			LocalDateTime currentDateTime = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String formattedDateTime = currentDateTime.format(formatter);

			// Print the formatted date and time
			System.out.println("Formatted DateTime: " + formattedDateTime);

			Payment payment = new Payment();
			payment.setPaymentId("ID");
			payment.setUsers(user);
			payment.setCost(totalCost);
			payment.setDateBuy(formattedDateTime);
			paymentService.insert(payment);
			payment = paymentService.findByDatebuyAndUserId(formattedDateTime, user.getUserId());
			for (Course course : courseList) {
				UserCourse userCourse = new UserCourse();
				userCourse.setUsers(user);
				userCourse.setCourses(course);
				userCourse.setUser_courseId("ID");
				userCourse.setAcceptDay(null);
				userCourseService.insert(userCourse);

				userCourse = userCourseService.findByUserIdAndCourseId(user.getUserId(), course.getCourseId()).get(0);
				PayDetail payDetail = new PayDetail();
				payDetail.setPayDetailId("ID");
				payDetail.setPayment(payment);
				payDetail.setUserCourse(userCourse);
				payDetailService.insert(payDetail);
			}
			List<Cart> carts = cartService.findByUserId(user.getUserId());
			List<Cart> finalCarts = new ArrayList<Cart>();
			for (Cart cart : carts) {
				Course course = courseService.findById(cart.getCourse().getCourseId());
				List<UserCourse> listUc = userCourseService.findByUserIdAndCourseId(user.getUserId(),
						course.getCourseId());
				if (listUc.size() == 0) {
					cart.setBuy(false);
					finalCarts.add(cart);
				} else {
					cart.setBuy(true);
				}
				cartService.update(cart);
			}

			user.setNetworth(user.getNetworth() - totalCost);
			userService.update(user);
			HttpSession session = req.getSession(false);
			session.setAttribute("user", user);
			session.setAttribute("cart", finalCarts);
			resp.sendRedirect(req.getContextPath() + "/user/course");
		}
	}

}
