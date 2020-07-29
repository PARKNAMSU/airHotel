package kg.air.cnc.controller.blame;

import kg.air.cnc.service.blame.BlameService;
import kg.air.cnc.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class BlameController {

    @Autowired
    BlameService blameService;

    @RequestMapping(value = "/blamelist.mdo", method = RequestMethod.GET)  // 신고당한 아이디 - 신고당한횟수 리스트
    public ModelAndView getBlameList(ModelAndView mav){
        mav.addObject("blamelist", blameService.getBlameList());
        mav.setViewName("blamelist");
        return mav;
    }

    @RequestMapping(value = "/blameinfo.mdo", method = RequestMethod.GET) // 신고당한 아이디의 신고내역 상세 보기
    public ModelAndView getBlameInfo(HttpServletRequest request, ModelAndView mav){
        String target_member_id = request.getParameter("target_member_id");
        mav.addObject("blameinfo", blameService.getBlameInfo(target_member_id));
        mav.setViewName("blameinfo");
        return mav;
    }

    @RequestMapping(value = "/blamejudge.mdo", method = RequestMethod.GET) // 신고당한 아이디 처리 페이지
    public ModelAndView judgeBlameTarget(HttpServletRequest request, HttpSession session, ModelAndView mav){
        String target_member_id = request.getParameter("target_member_id");
        CustomerVO customerVO = blameService.getBlameJudgeInfo(target_member_id);
        session.setAttribute("target_member_id", target_member_id);
        mav.addObject("blamejudgeinfo", customerVO);
        mav.setViewName("blamejudge");
        return mav;
    }

    @RequestMapping(value = "/blameWarnMessage.mdo", method = RequestMethod.POST)
    public ModelAndView sendWarnMessage(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        HashMap<String, String> warnMessageMap = new HashMap<>();
        String target_member_id = (String)session.getAttribute("target_member_id");
        warnMessageMap.put("to_id", target_member_id);
        warnMessageMap.put("message_content", request.getParameter("warn_message"));
        /*
        todo customer 에 대한 신고와 host 에 대한 신고의 분기가 필요할까? (blame 에 type 을 지정하는 방법 고려해보기 )
        todo customer 에 대한 정지와 host 에 대한 정지를 어떻게 처리할 것인지 생각해보기.
         */
        //admin 계정으로 target_member_id 에게 message 전송
        blameService.insertBlameWarnMessage(warnMessageMap);
        //customer_blame_warn 1증가
        blameService.increaseCustomerBlameWarn(target_member_id);
        // blame 에서 삭제
        blameService.deleteBlame(target_member_id);

        mav.setViewName("redirect:/blamelist.mdo");
        return mav;
    }

    //todo : 아이디 정지 먹이기

    //todo : 아이디 블랙리스트 추가하기
    @RequestMapping(value = "/addBlacklist.mdo", method = RequestMethod.GET)
    public ModelAndView addBlackList(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("target_member_id");
        System.out.println(id);
        /*
        todo : 블랙리스트 추가할 경우, member 에서 삭제되어야한다. host 에서 삭제되어야한다. (host 에서 삭제되기전에는 모든 예약이 환불 처리되어야한다. )
        todo : 호스트인경우, 해당 호스트가 가지고있던 숙소도 삭제 되어야한다? 메세지도 삭제되어야하고...
         */
        blameService.addBlackList(id);


        return mav;
    }

}
