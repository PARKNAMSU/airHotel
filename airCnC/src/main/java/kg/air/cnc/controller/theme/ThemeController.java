package kg.air.cnc.controller.theme;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.air.cnc.service.theme.ThemeService;
import kg.air.cnc.vo.House_InfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ThemeController {

    @Autowired
    ThemeService themeService;

    @RequestMapping(value = "/themesearch.do", method = RequestMethod.GET)
    public ModelAndView getThemeSearchList(HttpServletRequest httpServletRequest, ModelAndView mav){
        String theme_type = httpServletRequest.getParameter("theme_type");
        mav.addObject("themeList", themeService.getThemeHouseList(theme_type));
        mav.setViewName("themesearch");
        return mav;
    }

    @RequestMapping(value = "/themesearchhighscore.do", method = RequestMethod.GET)
    public ModelAndView getHighScoreList(ModelAndView mav){
        List<House_InfoVO> highScoreHouseList = themeService.getHighScoreHouseList();
        mav.addObject("themeList", highScoreHouseList);
        mav.setViewName("highscoresearch");
        return mav;
    }

    @RequestMapping(value = "/getMoreHighScoreHouse.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String test(){
        ObjectMapper mapper = new ObjectMapper();
        List<House_InfoVO> highScoreHouseList =  themeService.getHighScoreHouseList();
        String data = "";
        try {
            data = mapper.writeValueAsString(highScoreHouseList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return data;
    }
}
