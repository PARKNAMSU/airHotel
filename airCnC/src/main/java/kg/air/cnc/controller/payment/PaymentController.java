package kg.air.cnc.controller.payment;

import kg.air.cnc.vo.BlackUserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {

    @RequestMapping(value = "/paytest.mdo", method = RequestMethod.GET)
    public ModelAndView test(ModelAndView mav){
        mav.setViewName("paymenttest");
        return mav;
    }
}
