package hcmute.DAO;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import hcmute.entity.PayDetail;
import hcmute.entity.Payment;

public interface IPaymentDAO {
	Payment findByDatebuyAndUserId(String dateBuy, String userId);

	List<Payment> findcoursesByIDuser(String string);


}
