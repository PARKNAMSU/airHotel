package kg.air.cnc.controller.cupon;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.cupon.CuponServiceImpl;
import kg.air.cnc.vo.CuponVO;

@Controller
public class CuponController {
	
	@Autowired
	private CuponServiceImpl cuponService;
	
	@RequestMapping(value="makeCupon.mdo")
	public ModelAndView makeCupon(@RequestParam Map<String,String> info, HttpSession session, ModelAndView mav) {
		String id = (String)session.getAttribute("login_session");
		System.out.println(info.toString());
		if(info.get("rate").equals("") && info.get("money").equals("")) System.out.println("아무것도 없습니다.");
		else cuponService.makeCupon(info);
		mav.addObject("session", id);
		mav.setViewName("makeCupon");
		return mav;
	}
	
	@RequestMapping(value="getCuponList.do")
	public ModelAndView getCuponList(HttpSession session, ModelAndView mav) {
		String id = (String)session.getAttribute("login_session");
		if(id==null || id.equals("") || id.equals("null")) {
			mav.setViewName("login");
		}
		else {
			mav.addObject("cuponList", cuponService.getCuponList(id));
			mav.setViewName("cuponList");
		}
		return mav;
	}
	
	@RequestMapping(value="cuponList.do",method = RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String cuponList(HttpSession session) throws JsonProcessingException{
		System.out.println("check method");
		String id = (String)session.getAttribute("login_session");
		List<CuponVO> list = cuponService.getCuponList(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println("jsonStr: "+jsonStr);
		return jsonStr;
	}
	
	@RequestMapping(value="makeCuponView.mdo")
	public ModelAndView makeCuponView(ModelAndView mav) {
		mav.setViewName("makeCupon");
		return mav;
	}
	
}
