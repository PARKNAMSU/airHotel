package kg.air.cnc.controller.payment;

import kg.air.cnc.service.payment.PaymentService;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
public class PaymentController {

    @Autowired
    PaymentService paymentService;

    @RequestMapping(value = "/payment.do", method = RequestMethod.POST)
    public ModelAndView reservationConfirm(HttpSession session, HttpServletRequest httpServletRequest, ModelAndView mav){
        //남수페이지에서 결제하기 누르면 session 에 house 정보를 담은채로 여기로 옴.
        System.out.println("check");
        session = httpServletRequest.getSession();
        ReservationHouseDetailVO reservationHouseDetailVO =  (ReservationHouseDetailVO)session.getAttribute("house");
        reservationHouseDetailVO.setHouse_price_default(12345);
        ArrayList<String> restrictList = reservationHouseDetailVO.getRestricList();
        ArrayList<String> convinList = reservationHouseDetailVO.getConvinList();
        int totalDay = paymentService.calculatePay(httpServletRequest.getParameter("checkin"), httpServletRequest.getParameter("checkout"));
        mav.addObject("house", reservationHouseDetailVO );
        mav.addObject("peopleNum", httpServletRequest.getParameter("number") );
        mav.addObject("checkin",httpServletRequest.getParameter("checkin"));
        mav.addObject("checkout", httpServletRequest.getParameter("checkout"));
        mav.addObject("totalDay", totalDay);
        mav.addObject("restrictList", restrictList);
        mav.addObject("convinList",convinList);
        mav.setViewName("payment");
        return mav;
    }

    @RequestMapping(value = "/paymentfinal.do", method = RequestMethod.POST)
    public ModelAndView test(HttpServletRequest httpServletRequest, ModelAndView mav){
        int price = Integer.parseInt(httpServletRequest.getParameter("totalPrice"));
        HttpSession session = httpServletRequest.getSession();
        ReservationHouseDetailVO houseInfo = (ReservationHouseDetailVO)session.getAttribute("house");
        mav.addObject("totalPrice", price);
        mav.addObject("house", houseInfo);
        mav.setViewName("paymentfinal");
        return mav;
    }
}
