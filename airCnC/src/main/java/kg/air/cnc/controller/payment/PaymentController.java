package kg.air.cnc.controller.payment;

import java.util.ArrayList;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.service.cupon.CuponServiceImpl;
import kg.air.cnc.service.payment.PaymentService;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import java.util.HashMap;

@Controller
public class PaymentController {

    @Autowired
    PaymentService paymentService;
    @Autowired
    CuponServiceImpl cuponService;

    @RequestMapping(value = "/payment.do", method = RequestMethod.POST)
    public ModelAndView reservationConfirm(HttpSession session, HttpServletRequest httpServletRequest, ModelAndView mav){
        session = httpServletRequest.getSession();
        ReservationHouseDetailVO reservationHouseDetailVO =  (ReservationHouseDetailVO)session.getAttribute("house_detail");
        reservationHouseDetailVO.setHouse_price_default(12345);
        String id = (String)session.getAttribute("login_session");
        if(id == null){
            mav.setViewName("login");
            return mav;
        }
        ArrayList<String> restrictList = reservationHouseDetailVO.getRestricList();
        ArrayList<String> convinList = reservationHouseDetailVO.getConvinList();;
        int totalDay = paymentService.calculatePay(httpServletRequest.getParameter("checkin"), httpServletRequest.getParameter("checkout"));
        mav.addObject("cuponList", cuponService.getCuponList(id));
        mav.addObject("house", reservationHouseDetailVO );
        mav.addObject("peopleNum", httpServletRequest.getParameter("number") );
        mav.addObject("checkin",  httpServletRequest.getParameter("checkin"));
        mav.addObject("checkout", httpServletRequest.getParameter("checkout"));
        mav.addObject("totalDay", totalDay);
        mav.addObject("restrictList", restrictList);
        mav.addObject("convinList",convinList);
        mav.setViewName("payment");
        return mav;
    }

    @RequestMapping(value = "/paymentfinal.do", method = RequestMethod.POST)
    public ModelAndView test(HttpServletRequest httpServletRequest, ModelAndView mav) {
        int price = Integer.parseInt(httpServletRequest.getParameter("totalPrice"));
        HttpSession session = httpServletRequest.getSession();
        String customer_id = (String) session.getAttribute("login_session");
        System.out.println("session에서 받아온 customer_id : " + customer_id);
        CustomerVO customerVO = paymentService.getCustomerInfo(customer_id); // 커스터머 정보 추출
        ReservationHouseDetailVO houseInfo = (ReservationHouseDetailVO) session.getAttribute("house_detail");
        System.out.println("request에서 받아온 쿠폰 정보 : "+httpServletRequest.getParameter("cuponNum"));
        mav.addObject("customerInfo", customerVO);
        mav.addObject("totalPrice", price);
        mav.addObject("house", houseInfo);
        mav.addObject("checkin",  httpServletRequest.getParameter("checkin"));
        mav.addObject("checkout", httpServletRequest.getParameter("checkout"));
        mav.addObject("cuponNum", httpServletRequest.getParameter("cuponNum"));
        mav.setViewName("paymentfinal");
        return mav;
    }

    @RequestMapping(value = "paymentcomplete.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    @ResponseBody
    public ModelAndView paycomplete(ModelAndView mav,HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody HashMap<String, Object> request) {
    	paymentService.insertReservation(request);
        cuponService.useCupon((String)request.get("cuponNum"));
        /* 거래내역 조회 token 가져오기
        imp_uid = 거래고유 번호
        JSONObject json = new JSONObject();
        String imp_key = "";
        String imp_secret = "";
        try {
            imp_key = URLEncoder.encode("9441029206289751", "UTF-8");
            imp_secret = URLEncoder.encode("mKTVEbRAEhMJuL1xripr3WCqgESNpwILhCGVOywtPick3eRvxgWBcy1tcTgCpZoGB5CpD9Str5NvjE1R", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        json.put("imp_key", imp_key);
        json.put("imp_secret", imp_secret);
        String token = "";
        try {
            token = i_mportGetToken.getToken(httpServletRequest, httpServletResponse, json, "https://api.iamport.kr/users/getToken");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("token : " + token);
        token = 엑세스 토큰
        */
        return mav;
    }

}
