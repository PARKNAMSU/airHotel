package kg.air.cnc.dao.payment;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.ReservationVO;

public interface PaymentDAO {
    CustomerVO getCustomerInfo(String customer_id);
    void insertReservation(ReservationVO reservationVO);
}
