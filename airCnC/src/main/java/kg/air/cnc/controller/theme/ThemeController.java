package kg.air.cnc.controller.theme;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.air.cnc.service.theme.ThemeService;
import kg.air.cnc.vo.House_InfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class ThemeController {

    @Autowired
    ThemeService themeService;

    @RequestMapping(value = "/themesearch.do", method = RequestMethod.GET)
    public ModelAndView getThemeSearchList(HttpServletRequest httpServletRequest, ModelAndView mav){
        String theme_type = httpServletRequest.getParameter("theme_type");
        mav.addObject("themeList", themeService.getThemeHouseList(theme_type));
        //todo theme 에 따라 jsp 분기
        if(theme_type.equals("house_condition_petok")){ //반려견과 함께
            mav.setViewName("themesearchdog");
        } else if (theme_type.equals("house_theme_bbq")){ //바비큐와 함께
            mav.setViewName("themesearchbbq");
        } else if (theme_type.equals("house_theme_party")){ // 파티룸
            mav.setViewName("themesearchparty");
        } else if (theme_type.equals("house_theme_pool")){ //가족물놀이
            mav.setViewName("themesearchpool");
        } else if (theme_type.equals("house_theme_farm")){ //가족체험농장
            mav.setViewName("themesearchfarm");
        } else {
            mav.setViewName("index");
        }
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

    @RequestMapping(value = "/getMoreThemeHouse.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    @ResponseBody
    public String test2(@RequestParam Map<String, String> param){
        ObjectMapper mapper = new ObjectMapper();
        String theme_type = param.get("theme_type");
        System.out.println(theme_type);
        List<House_InfoVO> themeHouseList =  themeService.getThemeHouseList(theme_type);
        System.out.println("size: "  + themeHouseList.size());
        String data = "";
        try {
            data = mapper.writeValueAsString(themeHouseList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return data;
    }
}
