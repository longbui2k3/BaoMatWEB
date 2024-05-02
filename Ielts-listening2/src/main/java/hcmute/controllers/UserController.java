package hcmute.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmute.entity.Account;
import hcmute.entity.Course;
import hcmute.entity.User;
import hcmute.services.AccountServiceImpl;
import hcmute.services.AdminKhoaHocServiceImpl;
import hcmute.services.IAccountServices;
import hcmute.services.IAdminKhoaHocService;
import hcmute.services.IUserService;
import hcmute.services.UserServiceImpl;

@WebServlet(urlPatterns = { "/user/home" })
public class UserController extends HttpServlet {


	private static final long serialVersionUID = 1L;
	IAccountServices accountService = new AccountServiceImpl();
	IUserService userService = new UserServiceImpl();
	IAdminKhoaHocService courseService = new AdminKhoaHocServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String url = req.getRequestURI().toString();

		if (url.contains("home")) {
			FindIncreaseRate(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/views/user/Home.jsp");
			rd.forward(req, resp);
		}
	}


	private void FindIncreaseRate(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<Course> list = courseService.FindCourseIncreaseRate();

			req.setAttribute("course", list);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}
	

}
