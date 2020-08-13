package kg.air.cnc.service.payment;

import kg.air.cnc.common.UnixTimeStampConverter;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.dao.payment.PaymentDAO;
import kg.air.cnc.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Service("PaymentService")
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    UnixTimeStampConverter unixTimeStampConverter;

    public int calculatePay(String checkin, String checkout){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try{
            Date checkIn = format.parse(checkin);
            Date checkOut = format.parse(checkout);

            long calDate = checkIn.getTime() - checkOut.getTime();
            long calDateDay = calDate / (24*60*60*1000);
            calDateDay = Math.abs(calDateDay);
            return (int)calDateDay;

        } catch (ParseException e){
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public CustomerVO getCustomerInfo(String customer_id) {
        return paymentDAO.getCustomerInfo(customer_id);
    }

    @Override
    public void insertReservation(HashMap<String, Object> request) {
        String customer_id = (String)request.get("customer_id");
        String host_id = (String)request.get("host_id");
        int house_seq = Integer.parseInt((String)request.get("house_seq"));
        int paid_amount = (int)request.get("paid_amount");
        ReservationVO reservationVO = new ReservationVO();
        reservationVO.setReservation_customer_id(customer_id);
        reservationVO.setReservation_host_id(host_id);
        reservationVO.setReservation_house_seq(house_seq);
        reservationVO.setReservation_price(paid_amount);
        String form = (String)request.get("check_in");
        String form2 = (String)request.get("check_out");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date check_in = null;
        Date check_out = null;
        Date regDate = null;

        int period = calculatePay((String)request.get("check_in"), (String)request.get("check_out"));

        try {
             check_in = dateFormat.parse(form);
             check_out = dateFormat.parse(form2);
            Number regtime = (Number)request.get("paid_at");
            long time = regtime.longValue();
            String paid_at = time +"";
             regDate = dateFormat2.parse(unixTimeStampConverter.getTimestampToDate(paid_at));
            System.out.println("regDate : " + regDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        reservationVO.setReservation_check_in(check_in);
        reservationVO.setReservation_check_out(check_out);
        reservationVO.setReservation_period(period);
        reservationVO.setReservation_regdate(regDate);
        reservationVO.setCard_apply_num((String)request.get("apply_num"));
        reservationVO.setImp_uid((String)request.get("imp_uid"));

        paymentDAO.insertReservation(reservationVO);
    }
}
