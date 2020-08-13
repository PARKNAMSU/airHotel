package kg.air.cnc.service.payment;


import kg.air.cnc.vo.CustomerVO;

import java.util.HashMap;

public interface PaymentService {
     int calculatePay(String checkin, String checkout);
     CustomerVO getCustomerInfo(String customer_id);
     void insertReservation(HashMap<String, Object>request);
}
