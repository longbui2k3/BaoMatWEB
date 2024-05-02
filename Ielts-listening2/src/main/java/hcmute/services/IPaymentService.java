package hcmute.services;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import hcmute.entity.PayDetail;
import hcmute.entity.Payment;

public interface IPaymentService {
	void insert(Payment payment);

	List<Payment> findAll();

	Payment findByDatebuyAndUserId(String dateBuy, String userId);

	Payment findById(Object id);

	List<Payment> findcoursesByIDuser(String userId);

}
