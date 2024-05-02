package hcmute.controllers;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmute.entity.Account;
import hcmute.entity.EnrrolLesson;
import hcmute.entity.User;
import hcmute.services.AccountServiceImpl;
import hcmute.services.IAccountServices;
import hcmute.services.IUserService;
import hcmute.services.UserServiceImpl;

@WebServlet(urlPatterns = { "/user/thongkediem", "/admin/thongkediem" })
public class ThongKeUserControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IUserService userService = new UserServiceImpl();
	IAccountServices accountService = new AccountServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();

		if(url.contains("user/thongkediem")) {
			String id = req.getParameter("userId");
			User user = findUserById(id);
			Account account = accountService.findByID(user.getAccount().getUserName());

			List<EnrrolLesson> enrrolLesson = userService.findAllEnrrolLessonByUserId(id);

			/*String[] day = { "Jan", "Feb", "March", "April", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };*/


			req.setAttribute("enrrolLesson", enrrolLesson);
			List<Double> score = userService.findAllScoreByUserId(id);

			double[] data = new double[score.size()];
			for (int i = 0; i < score.size(); i++) {
				data[i] = score.get(i);
			}
			
			List<String> nameTest = userService.findAllTestNamefromUserId(id);
			String[] day = new String[nameTest.size()];
			for (int i = 0; i < nameTest.size(); i++) {
				day[i] = nameTest.get(i);
			}

			// int[] data = {30, 32, 15, 25, 18, 28, 22, 32, 24, 34, 26, 38};
			// double[] data = {0, 8, 6.5, 5};
			Gson gson = new Gson();
			String jsonData = gson.toJson(data);
			String jsonDay = gson.toJson(day);
			req.setAttribute("jsonData", jsonData);
			req.setAttribute("currentUser", user);
			req.setAttribute("account", account);
			req.setAttribute("jsonDay", jsonDay);
			if (url.contains("thongkediem")) {
				RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_thongkediem.jsp");
				rd.forward(req, resp);
			}
		} else if(url.contains("admin/thongkediem")) {
			String id = req.getParameter("userId");
			User user = findUserById(id);
			Account account = accountService.findByID(user.getAccount().getUserName());

			List<EnrrolLesson> enrrolLesson = userService.findAllEnrrolLessonByUserId(id);

			/*String[] day = { "Jan", "Feb", "March", "April", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };*/


			req.setAttribute("enrrolLesson", enrrolLesson);
			List<Double> score = userService.findAllScoreByUserId(id);

			double[] data = new double[score.size()];
			for (int i = 0; i < score.size(); i++) {
				data[i] = score.get(i);
			}
			
			List<String> nameTest = userService.findAllTestNamefromUserId(id);
			String[] day = new String[nameTest.size()];
			for (int i = 0; i < nameTest.size(); i++) {
				day[i] = nameTest.get(i);
			}

			// int[] data = {30, 32, 15, 25, 18, 28, 22, 32, 24, 34, 26, 38};
			// double[] data = {0, 8, 6.5, 5};
			Gson gson = new Gson();
			String jsonData = gson.toJson(data);
			String jsonDay = gson.toJson(day);
			req.setAttribute("jsonData", jsonData);
			req.setAttribute("currentUser", user);
			req.setAttribute("account", account);
			req.setAttribute("jsonDay", jsonDay);
			if (url.contains("thongkediem")) {
				RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_thongkediem.jsp");
				rd.forward(req, resp);
			}
		}
	}

	private User findUserById(String id) {
		User user = userService.findUserByID(id);
		return user;
	}

}