package kg.air.cnc.service.payment;

import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service("PaymentService")
public class PaymentServiceImpl implements PaymentService {

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
}
