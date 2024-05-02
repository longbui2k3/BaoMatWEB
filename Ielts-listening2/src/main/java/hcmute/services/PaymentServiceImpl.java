package hcmute.services;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import hcmute.DAO.IPaymentDAO;
import hcmute.DAO.PaymentDAOImpl;
import hcmute.entity.PayDetail;
import hcmute.entity.Payment;

public class PaymentServiceImpl implements IPaymentService {
	PaymentDAOImpl payAbs = new PaymentDAOImpl();
	IPaymentDAO payDAO = new PaymentDAOImpl();

	@Override
	public void insert(Payment payment) {
		payAbs.insert(payment);

	}

	@Override
	public Payment findByDatebuyAndUserId(String dateBuy, String userId) {
		// TODO Auto-generated method stub
		return payDAO.findByDatebuyAndUserId(dateBuy, userId);
	}

	@Override
	public List<Payment> findAll() {
		// TODO Auto-generated method stub
		return payAbs.findAll();
	}

	@Override
	public Payment findById(Object id) {
		// TODO Auto-generated method stub
		return payAbs.findById(id);
	}

	@Override
	public List<Payment> findcoursesByIDuser(String userId) {
		return payDAO.findcoursesByIDuser(userId);
	}

}
