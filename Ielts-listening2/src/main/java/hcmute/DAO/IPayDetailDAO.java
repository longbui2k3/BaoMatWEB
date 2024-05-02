package hcmute.DAO;

import java.util.List;

import hcmute.entity.PayDetail;

public interface IPayDetailDAO {

	List<PayDetail> findPayDetailByIDPayment(String idpay);

}
