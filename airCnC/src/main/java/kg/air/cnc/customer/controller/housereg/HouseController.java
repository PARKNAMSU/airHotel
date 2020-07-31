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
	
	@RequestMapping(value = "/index.do")
	public String mainPage() {
		return "mainPage";
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
}
