package kg.air.cnc.customer.controller.housereg;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.customer.service.housereg.HouseService;
import kg.air.cnc.customer.vo.housereg.HouseVO;


@Controller
@SessionAttributes({"house", "detail"})
public class HouseController {
	
	@Resource(name = "houseService")
	private HouseService houseService;
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@ModelAttribute("house")
	public HouseVO setEmptySawon() {
		return new HouseVO();
	}
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detail(String houseId, Model model) {
		model.addAttribute("detail", houseService.detailProduct(houseId));
		return "houseDetail";
	}
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String houseLlist(Model model, SessionStatus sessionStatus) throws Exception {
		List<HouseVO> list = houseService.listProduct();
		logger.info(list.toString());
		model.addAttribute("list", list);
		sessionStatus.setComplete();
		return "houseList";
	}
	@RequestMapping(value = "/topage.do")
	public String topage(@ModelAttribute("house") HouseVO house, Model model) {
		return "houseinsert1";
	}
	@RequestMapping(value="/write1.do", method = RequestMethod.POST)
	public String write1(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		return "houseinsert2";
	}
	@RequestMapping(value="/write2.do", method = RequestMethod.POST)
	public String write2(@ModelAttribute("house") HouseVO house, Model model, SessionStatus sessionStatus) throws Exception {
		logger.info(house.toString());
		houseService.insertProduct(house);
		sessionStatus.setComplete();
		return "redirect:/list.do";
	}
	
	
	

	@RequestMapping(value = "/index.do")
	public String mainPage() {
		return "1newhouse";
	}
	@RequestMapping(value = "/1newhouse.do")
	public String newhouse(@ModelAttribute("house") HouseVO house, Model model) {
		System.out.println("newhouse : " + house.getNewhouse());
		if(house.getNewhouse().equals("new1")) {
			logger.info(house.toString());
			return "2housedetail";
		}
		//숙소 등록중, 등록했던 숙소는 new2, new3로 조건부여
		return null;
	}
	@RequestMapping(value = "/2housedetail.do")
	public String housedetail(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("housedetail : " + house.getHouse_bedroom_amount());
		return "3bathcount";
	}
	
	@RequestMapping(value = "/3bathcount.do")
	public String bathcount(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("bathcount : " + house.getHouse_bathroom_type());
		return "4location";
	}
	
	@RequestMapping(value = "/4location.do")
	public String location(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("location : " + house.getHouse_loaction_sido());
		System.out.println("location_x : " + house.getHouse_xlocation());
		System.out.println("location_y : " + house.getHouse_ylocation() );
		return "5defaultoption";
	}
	
	@RequestMapping(value = "/5defaultoption.do")
	public String defaultoption(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("defaultsetting : " + house.isHouse_defaultsetting());
		return "6guestcomfortable";
	}
	
	@RequestMapping(value = "/6guestcomfortable.do")
	public String guestcomfortable(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("guestcomfortable : " + house.isHouse_default_livingroom_type());
		return "7guesttextarea";
	}
	
	@RequestMapping(value = "/7guesttextarea.do")
	public String guesttextarea(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("guesttextarea : " + house.getHouse_desc1());
		return "8hosthouseimg";
	}
}
