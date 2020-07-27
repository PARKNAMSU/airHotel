package kg.air.cnc.controller.blame;

import kg.air.cnc.service.blame.BlameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "/blamejudge.mdo", method = RequestMethod.GET)
    public ModelAndView judgeBlameTarget(HttpServletRequest request, ModelAndView mav){
        String target_member_id = request.getParameter("target_member_id");
        System.out.println(target_member_id);
        mav.addObject("blameinfo", blameService.getBlameInfo(target_member_id));
        mav.setViewName("blamejudge");
        return mav;
    }

}
