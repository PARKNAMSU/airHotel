package kg.air.cnc.controller.blacklist;

import kg.air.cnc.service.blacklist.BlackListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BlackListController {

    @Autowired
    BlackListService blackListService;

    @RequestMapping(value = "/blacklist.mdo", method = RequestMethod.GET) // 블랙리스트 전체를 보여주는 메소드
    public ModelAndView getBlackList(ModelAndView mav){
        mav.addObject("blacklist", blackListService.getBlackList());
        mav.setViewName("blame/blacklist");
        return mav;
    }

    @RequestMapping(value = "/blacklistSearchEmail.mdo", method = RequestMethod.GET) // 검색한 블랙리스트 보여주는 메소드
    public ModelAndView getBlackSearchId(HttpServletRequest httpServletRequest, ModelAndView mav){
            String searchEmail = httpServletRequest.getParameter("blackSearchEmail");
            mav.addObject("blacklist",blackListService.getSearchBlackId(searchEmail));
            mav.setViewName("blame/blacklistsearch");
            return mav;
    }

    @RequestMapping(value = "/blacklistRelease.mdo", method = RequestMethod.GET) // 블랙리스트 해제 메소드
    public ModelAndView deleteBlackList(HttpServletRequest httpServletRequest, ModelAndView mav){
            String blackEmail = httpServletRequest.getParameter("blackEmail");
            blackListService.deleteBlackList(blackEmail);
            mav.setViewName("redirect:/blacklist.mdo");
            return mav;
    }

}
