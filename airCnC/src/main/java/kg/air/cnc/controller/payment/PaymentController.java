package kg.air.cnc.controller.payment;

import kg.air.cnc.vo.ReservationHouseDetailVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class PaymentController {

    @RequestMapping(value = "/payment.mdo", method = RequestMethod.GET)
    public ModelAndView reservationConfirm(HttpSession session, HttpServletRequest httpServletRequest, ModelAndView mav){
        session = httpServletRequest.getSession();
        ReservationHouseDetailVO reservationHouseDetailVO =  (ReservationHouseDetailVO)session.getAttribute("house");


        return mav;
    }

    @RequestMapping(value = "/paytest.mdo", method = RequestMethod.GET)
    public ModelAndView test(ModelAndView mav){
        mav.setViewName("paymenttest");
        return mav;
    }
}
