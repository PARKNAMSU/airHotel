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

    @RequestMapping(value = "/payment.do", method = RequestMethod.POST)
    public ModelAndView reservationConfirm(HttpSession session, HttpServletRequest httpServletRequest, ModelAndView mav){
        //남수페이지에서 결제하기 누르면 session 에 house 정보를 담은채로 여기로 옴.
        System.out.println("check");
        session = httpServletRequest.getSession();
        ReservationHouseDetailVO reservationHouseDetailVO =  (ReservationHouseDetailVO)session.getAttribute("house");
        System.out.println("하우스 시퀀스 : " +  reservationHouseDetailVO.getHouse_seq());
        System.out.println("하우스 이름 : "  + reservationHouseDetailVO.getHouse_name());
        System.out.println("인원수 : " + httpServletRequest.getParameter("number"));
        System.out.println("체크인 날짜 : " + httpServletRequest.getParameter("checkin"));
        System.out.println("체크아웃 날짜 : " + httpServletRequest.getParameter("checkout"));
        mav.setViewName("payment");
        return mav;
    }

    @RequestMapping(value = "/paytest.mdo", method = RequestMethod.GET)
    public ModelAndView test(ModelAndView mav){
        mav.setViewName("paymenttest");
        return mav;
    }
}
