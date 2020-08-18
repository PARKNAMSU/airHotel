package kg.air.cnc.controller.blame;

import kg.air.cnc.service.blame.BlameService;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
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

    @RequestMapping(value = "/blamelist.mdo", method = RequestMethod.GET)  // 신고당한 아이디 - 신고당한횟수
    public ModelAndView getBlameList(ModelAndView mav){
        mav.addObject("blameCount",blameService.getBlameSize());
        mav.addObject("blamelist", blameService.getBlameList());
        mav.setViewName("blamelist");
        return mav;
    }

    @RequestMapping(value = "/blameinfo.mdo", method = RequestMethod.GET) // 신고당한 아이디 - 신고사유 - host/customer
    public ModelAndView getBlameInfo(HttpServletRequest request, ModelAndView mav){
        String target_member_id = request.getParameter("target_member_id");
        mav.addObject("blameinfo", blameService.getBlameInfo(target_member_id));
        mav.setViewName("blameinfo");
        return mav;
    }

    @RequestMapping(value = "/blamejudge.mdo", method = RequestMethod.GET) // 신고당한 아이디 처리 페이지
    public ModelAndView judgeBlameTarget(HttpServletRequest request, HttpSession session, ModelAndView mav){
        String target_member_id = request.getParameter("target_member_id");
        int blame_type = Integer.parseInt(request.getParameter("blame_type"));
        session.setAttribute("target_member_id", target_member_id);
        session.setAttribute("blame_type", blame_type);
        if(blame_type == 0){
            //host 인 경우
             HostVO hostVO = blameService.getHostBlameInfo(target_member_id);
             mav.addObject("blameHostJudgeInfo", hostVO);
             mav.setViewName("blamejudge");
            return mav;
        } else if(blame_type ==1) {
            //Customer 인 경우
            CustomerVO customerVO = blameService.getCustomerBlameJudgeInfo(target_member_id);
            mav.addObject("blameCustomerJudgeInfo", customerVO);
            mav.setViewName("blamejudge");
            return mav;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/blameWarnMessage.mdo", method = RequestMethod.POST) // 신고당한 아이디 경고메세지 보내기
    public ModelAndView sendWarnMessage(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        String blame_type = Integer.toString((int)session.getAttribute("blame_type"));
        System.out.println(blame_type);
        if((int)session.getAttribute("blame_type")==0){
            // admin 계정으로 target_member_id 아이디를 가진 host 에게 message 전송
            HashMap<String, String> warnMessageMap = new HashMap<>();
            HashMap<String, String> deleteBlameMap = new HashMap<>();
            String target_member_id = (String)session.getAttribute("target_member_id");
            warnMessageMap.put("to_id", target_member_id);
            warnMessageMap.put("message_content", request.getParameter("warn_message"));
            deleteBlameMap.put("target_member_id", target_member_id);
            deleteBlameMap.put("blame_type", blame_type);
            //admin 계정으로 target_member_id 에게 message 전송
            blameService.insertBlameWarnMessage(warnMessageMap);
            //host_blame_warn 1 증가
            blameService.increaseHostBlameWarn(target_member_id);
            //blame 에서 삭제
            blameService.deleteBlame(deleteBlameMap);
            session.removeAttribute("target_member_id");
            session.removeAttribute("blame_type");
            mav.setViewName("redirect:/blamelist.mdo");

        } else if ((int)session.getAttribute("blame_type")==1){
            // admin 계정으로 target_member_id 아이디를 가진 customer 에게 message 전송
            HashMap<String, String> warnMessageMap = new HashMap<>();
            HashMap<String, String> deleteBlameMap = new HashMap<>();
            String target_member_id = (String)session.getAttribute("target_member_id");
            warnMessageMap.put("to_id", target_member_id);
            warnMessageMap.put("message_content", request.getParameter("warn_message"));
            deleteBlameMap.put("target_member_id", target_member_id);
            deleteBlameMap.put("blame_type", blame_type);
            //admin 계정으로 target_member_id 에게 message 전송
            blameService.insertBlameWarnMessage(warnMessageMap);
            //customer_blame_warn 1증가
            blameService.increaseCustomerBlameWarn(target_member_id);
            // blame 에서 삭제
            blameService.deleteBlame(deleteBlameMap);
            session.removeAttribute("target_member_id");
            session.removeAttribute("blame_type");
            mav.setViewName("redirect:/blamelist.mdo");
        }
        return mav;
    }

    @RequestMapping(value = "/blameSuspend.mdo", method = RequestMethod.POST) // 신고당한 아이디 정지시키기
    public ModelAndView suspendMember(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        int blame_type = (int)session.getAttribute("blame_type");
        String target_member_id = (String)session.getAttribute("target_member_id");
        String suspend_day = request.getParameter("suspend_day");
        System.out.println(suspend_day);
        if(blame_type == 0){
            //호스트인경우
            blameService.suspendHost(target_member_id, suspend_day);
        } else if (blame_type == 1){
            //customer 인 경우
            blameService.suspendCustomer(target_member_id, suspend_day);
        }
        mav.setViewName("redirect:/blamelist.mdo");
        return mav;
    }


    @RequestMapping(value = "/addBlacklist.mdo", method = RequestMethod.GET)
    public ModelAndView addBlackList(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("target_member_id");;
        blameService.addBlackList(id);
        mav.setViewName("redirect:/blamelist.mdo");
        return mav;
    }

}
