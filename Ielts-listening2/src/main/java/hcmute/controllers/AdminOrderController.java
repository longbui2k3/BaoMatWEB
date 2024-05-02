package hcmute.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmute.entity.PayDetail;
import hcmute.entity.Payment;
import hcmute.services.IPayDetailService;
import hcmute.services.IPaymentService;
import hcmute.services.PayDetailServiceImpl;
import hcmute.services.PaymentServiceImpl;
import hcmute.utils.Constants;

@WebServlet(urlPatterns = { "/admin/order", "/admin/od-detail" })
public class AdminOrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IPaymentService service = new PaymentServiceImpl();
	IPayDetailService detailservice = new PayDetailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("order")) {
			List<Payment> listorder = service.findAll();
			req.setAttribute("list", listorder);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_order.jsp");
			rd.forward(req, resp);
		} else if (url.contains("od-detail")) {
			String id = req.getParameter("id");
			Payment order = service.findById(id);
			String idpay = req.getParameter("id");
			List<PayDetail> lisl = detailservice.findPayDetailByIDPayment(idpay);
			
			req.setAttribute("folder", Constants.FOLDER_COURSE);
			req.setAttribute("list_oddetail", lisl);
			req.setAttribute("order", order);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/admin_orderDetail.jsp");
			rd.forward(req, resp);
		}
	}
}
