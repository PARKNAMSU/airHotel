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
        warnMessageMap.put("to_id", (String)session.getAttribute("target_member_id"));
        warnMessageMap.put("message_content", request.getParameter("warn_message"));
        blameService.insertBlameWarnMessage(warnMessageMap);
        /*
        todo : message 는 성공적으로 보냈음으로, 해당 customer_blame_warn 을 1 증가시켜주고, blame 에서 삭제.
         */
        return mav;
    }

    //todo : 아이디 정지 먹이기

    //todo : 아이디 블랙리스트 추가하기

}
