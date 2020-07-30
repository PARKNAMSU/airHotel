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


        // todo customer 인지, host 인지 찾아와야함.

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
            blameService.deleteBlame(deleteBlameMap);




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
            mav.setViewName("redirect:/blamelist.mdo");
        }
        /*
        HashMap<String, String> warnMessageMap = new HashMap<>();
        String target_member_id = (String)session.getAttribute("target_member_id");
        warnMessageMap.put("to_id", target_member_id);
        warnMessageMap.put("message_content", request.getParameter("warn_message"));

        //admin 계정으로 target_member_id 에게 message 전송
        blameService.insertBlameWarnMessage(warnMessageMap);
        //customer_blame_warn 1증가
        blameService.increaseCustomerBlameWarn(target_member_id);
        // blame 에서 삭제
        blameService.deleteBlame(target_member_id);
        */
        return mav;
    }

    //todo : 아이디 정지 먹이기
    //todo : customer 에 대한 정지와 host 에 대한 정지를 어떻게 처리할 것인지 생각해보기.

    //todo : 아이디 블랙리스트 추가하기
    @RequestMapping(value = "/addBlacklist.mdo", method = RequestMethod.GET)
    public ModelAndView addBlackList(HttpServletRequest request, ModelAndView mav){
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("target_member_id");
        System.out.println(id);
        /*
        todo : 블랙리스트 추가할 경우
        선택된 신고의 타입을 확인해 host, customer 분기
        1. host 일 경우
        해당 host 가 가지고 있는 모든 숙소의 예약을 환불처리한다. (customer 에게 환불)
        환불사유에 대한 메세지를 customer 에게 전송한다.
        해당아이디로 접속할 경우 접속불가 메세지를 띄어준다.
        host table 에서 해당 아이디 삭제.
        message table 에서 host 아이디가 가지고 있던 메세지들 삭제

        2. customer 인 경우
        해당 customer 가 예약한 숙소를 환불처리한다 ( 본인에게 환불 )
        환불사유에 대한 메세지를 customer 에게 전송한다.
        예약취소 사유에 대한 메세지를 host 에게 전송한다.
        해당숙소에 대한 예약처리를 취소한다.

        todo : 호스트인경우, 해당 호스트가 가지고있던 숙소도 삭제 되어야한다? 메세지도 삭제되어야하고...
         */
        blameService.addBlackList(id);


        return mav;
    }

}
