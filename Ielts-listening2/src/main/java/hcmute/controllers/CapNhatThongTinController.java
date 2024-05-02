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

import hcmute.entity.Account;
import hcmute.entity.PayDetail;
import hcmute.entity.Payment;
import hcmute.entity.User;
import hcmute.entity.UserCourse;
import hcmute.services.AccountServiceImpl;
import hcmute.services.IAccountServices;
import hcmute.services.IPayDetailService;
import hcmute.services.IPaymentService;
import hcmute.services.IUserService;
import hcmute.services.PayDetailServiceImpl;
import hcmute.services.PaymentServiceImpl;
import hcmute.services.UserServiceImpl;
import hcmute.utils.Constants;
import hcmute.utils.DeleteImage;
import hcmute.utils.UploadUtils;
import hcmute.utils.compositeId.PasswordEncryptor;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 50)
@WebServlet(urlPatterns = { "/user/capnhattaikhoan", "/user/capnhatmatkhau", "/user/khoahoccuatoi",  "/user/myorder", "/user/myoddetail" })
public class CapNhatThongTinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IPaymentService paymentService = new PaymentServiceImpl();
	IPayDetailService paydetail = new PayDetailServiceImpl();
	IUserService userService = new UserServiceImpl();
	IAccountServices accountService = new AccountServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		HttpSession session = req.getSession(false);
		
		// Set cứng ID để test chức năng

		if(url.contains("user")) {
			User user = (User) session.getAttribute("user");
			Account account = accountService.findByID(user.getAccount().getUserName());
			req.setAttribute("currentUser", user);
			req.setAttribute("account", account);
		}


		if (url.contains("capnhattaikhoan")) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_capnhattaikhoan.jsp");
			rd.forward(req, resp);
		} else if (url.contains("capnhatmatkhau")) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_capnhatmatkhau.jsp");
			rd.forward(req, resp);
		} else if (url.contains("user/khoahoccuatoi")) {
			String userId = req.getParameter("userId");
			System.out.print("userId la: " + userId);
			Long count = userService.countCourseByUserId(userId);
			User userCurrent = userService.findUserByID(userId);
			List<UserCourse> listUserCourse = userService.findAllUserCourseByUserId(userId);
			
			req.setAttribute("folder", Constants.FOLDER_COURSE);
			req.setAttribute("userCourse", listUserCourse);
			req.setAttribute("userId", userId);
			req.setAttribute("currentUser", userCurrent);
			req.setAttribute("count", count);
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_khoahoccuatoi.jsp");
			rd.forward(req, resp);
		}  else if(url.contains("myorder")) {
			String userId = req.getParameter("userId");
			List<Payment> listmyorder = paymentService.findcoursesByIDuser(userId);
			req.setAttribute("list", listmyorder);	
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/users_myorder.jsp");
			rd.forward(req, resp);
		} else if(url.contains("myoddetail")) {
			String idpay = req.getParameter("id");
			List<PayDetail> lisl = paydetail.findPayDetailByIDPayment(idpay);
			req.setAttribute("list_oddetail", lisl);
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/users_myorderDetail.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();

		if (url.contains("user/capnhattaikhoan")) {
			UpdateInfo(req, resp);
		} else if (url.contains("capnhatmatkhau")) {
			UpdatePass(req, resp);
		}
	}

	private void UpdatePass(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");

			// Set cứng ID để test chức năng
			User user = userService.findUserByID(req.getParameter("userId"));
			Account account = accountService.findByID(user.getAccount().getUserName());
			System.out.print(false);
			String oldPass = req.getParameter("currentpassword").trim();
			String newPass = req.getParameter("newpassword").trim();
			String confirmPass = req.getParameter("confirmpassword").trim();
			String accPass = PasswordEncryptor.decryptPassword(account.getPassWord()).trim();

			if (oldPass.equals(accPass)) {
				if (newPass.equals(confirmPass)) {
					account.setPassWord(PasswordEncryptor.encryptPassword(newPass));
				} else {
					req.setAttribute("messError", "Xác nhận mật khẩu mới không thành công!");
				}
			} else {
				req.setAttribute("messError", "Nhập mật khẩu cũ sai!");
			}

			accountService.update(account);

			req.setAttribute("account", account);
			req.setAttribute("message", "Cập nhật thành công!");

			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_capnhatmatkhau.jsp");
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}

	}

	private void UpdateInfo(HttpServletRequest req, HttpServletResponse resp) {
		// User user = new User();
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			HttpSession session = req.getSession(false);
			User user = (User) session.getAttribute("user");
			String name = req.getParameter("inputName").trim();
			String phoneNumber = req.getParameter("inputPhone").trim();

			String address = req.getParameter("inputAddress").trim();
			String dateOfBirth = req.getParameter("datePicker").trim();
			String networth = req.getParameter("inputNetworth").trim();

			Integer currentNetworth = 0;
			boolean check = networth.equals("");

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

			if (user.getNetworth() != null) {
				if (check == false) {
					currentNetworth = user.getNetworth() + Integer.parseInt(networth);
				} else {
					currentNetworth = user.getNetworth();
				}
			} else {
				if (check == false) {
					currentNetworth = Integer.parseInt(networth);
				}
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
			
			session.setAttribute("user", user);
			req.setAttribute("currentUser", user);
			req.setAttribute("message", "Cập nhật thành công!");
			RequestDispatcher rd = req.getRequestDispatcher("/views/capnhat/user_capnhattaikhoan.jsp");
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Eror: " + e.getMessage());
		}
	}

}
