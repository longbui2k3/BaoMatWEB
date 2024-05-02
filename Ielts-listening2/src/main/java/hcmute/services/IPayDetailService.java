package hcmute.services;

import java.util.List;

import hcmute.entity.PayDetail;

public interface IPayDetailService {
	void insert(PayDetail payDetail);

	List<PayDetail> findPayDetailByIDPayment(String idpay);
}
