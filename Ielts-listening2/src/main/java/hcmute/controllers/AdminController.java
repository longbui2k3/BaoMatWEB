package hcmute.controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmute.entity.Account;
import hcmute.services.AccountServiceImpl;
import hcmute.services.IAccountServices;

@WebServlet(urlPatterns = { "/admin/dashboard" })
public class AdminController extends HttpServlet {

	IAccountServices accountService = new AccountServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = req.getRequestURI().toString();
		if (url.contains("dashboard")) {
//			resp.sendRedirect(req.getContextPath() + "/admin/analytics");
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/analytics.jsp");
			rd.forward(req, resp);
		}
	}

	private static final long serialVersionUID = 1L;

}
