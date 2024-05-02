package hcmute.services;

import java.util.List;

import hcmute.DAO.IPayDetailDAO;
import hcmute.DAO.PayDetailDAOImpl;
import hcmute.entity.PayDetail;

public class PayDetailServiceImpl implements IPayDetailService {
	PayDetailDAOImpl payDetailAbs = new PayDetailDAOImpl();
	IPayDetailDAO payDAO = new PayDetailDAOImpl();
	@Override
	public void insert(PayDetail payDetail) {
		payDetailAbs.insert(payDetail);
	}

	@Override
	public List<PayDetail> findPayDetailByIDPayment(String idpay) {
		return payDAO.findPayDetailByIDPayment(idpay);
	}

}
