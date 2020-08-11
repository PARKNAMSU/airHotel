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

    @RequestMapping(value = "/payment.do", method = RequestMethod.GET)
    public ModelAndView reservationConfirm(HttpSession session, HttpServletRequest httpServletRequest, ModelAndView mav){
        //남수페이지에서 결제하기 누르면 session 에 house 정보를 담은채로 여기로 옴.
        session = httpServletRequest.getSession();
        ReservationHouseDetailVO reservationHouseDetailVO =  (ReservationHouseDetailVO)session.getAttribute("house");
        mav.setViewName("payment");
        return mav;
    }

    @RequestMapping(value = "/paytest.mdo", method = RequestMethod.GET)
    public ModelAndView test(ModelAndView mav){
        mav.setViewName("paymenttest");
        return mav;
    }
}
