package kg.air.cnc.customer.controller.housereg;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.customer.service.housereg.HouseService;
import kg.air.cnc.customer.vo.housereg.HousePhotoVO;
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
		if(house.getHouse_defaultsetting_0or1()==null) {house.setHouse_defaultsetting("false");} 
		else {house.setHouse_defaultsetting("true");}
		if(house.getHouse_default_tv_0or1()==null) {house.setHouse_default_tv("false");} 
		else {house.setHouse_default_tv("true");}
		if(house.getHouse_default_wifi_0or1()==null) {house.setHouse_default_wifi("false");} 
		else {house.setHouse_default_wifi("true");}
		if(house.getHouse_default_heater_0or1()==null) {house.setHouse_default_heater("false");} 
		else {house.setHouse_default_heater("true");}
		if(house.getHouse_default_cooler_0or1()==null) {house.setHouse_default_cooler("false");} 
		else {house.setHouse_default_cooler("true");}
		if(house.getHouse_default_iron_0or1()==null) {house.setHouse_default_iron("false");} 
		else {house.setHouse_default_iron("true");}
		if(house.getHouse_default_fireditecter_0or1()==null) {house.setHouse_default_fireditecter("false");} 
		else {house.setHouse_default_fireditecter("true");}
		if(house.getHouse_default_coditecter_0or1()==null) {house.setHouse_default_coditecter("false");} 
		else {house.setHouse_default_coditecter("true");}
		if(house.getHouse_default_aidkit_0or1()==null) {house.setHouse_default_aidkit("false");} 
		else {house.setHouse_default_aidkit("true");}
		if(house.getHouse_default_firesofwa_0or1()==null) {house.setHouse_default_firesofwa("false");} 
		else {house.setHouse_default_firesofwa("true");}
		if(house.getHouse_default_bedrock_0or1()==null) {house.setHouse_default_bedrock("false");} 
		else {house.setHouse_default_bedrock("true");}
		System.out.println("defaultsetting : " + house.getHouse_defaultsetting());
		System.out.println("default_bedrock : " + house.getHouse_default_bedrock());
		return "6guestcomfortable";
	}
	
	@RequestMapping(value = "/6guestcomfortable.do")
	public String guestcomfortable(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		if(house.getHouse_default_livingroom_type_0or1()==null) {house.setHouse_default_livingroom_type("false");} 
		else {house.setHouse_default_livingroom_type("true");}
		if(house.getHouse_default_kitchen_0or1()==null) {house.setHouse_default_kitchen("false");} 
		else {house.setHouse_default_kitchen("true");}
		if(house.getHouse_default_laundry_washer_0or1()==null) {house.setHouse_default_laundry_washer("false");} 
		else {house.setHouse_default_laundry_washer("true");}
		if(house.getHouse_default_laundry_dryer_0or1()==null) {house.setHouse_default_laundry_dryer("false");} 
		else {house.setHouse_default_laundry_dryer("true");}
		if(house.getHouse_default_parking_0or1()==null) {house.setHouse_default_parking("false");} 
		else {house.setHouse_default_parking("true");}
		if(house.getHouse_default_gym_0or1()==null) {house.setHouse_default_gym("false");} 
		else {house.setHouse_default_gym("true");}
		if(house.getHouse_default_pool_0or1()==null) {house.setHouse_default_pool("false");} 
		else {house.setHouse_default_pool("true");}
		
		System.out.println("livingroom_type : " + house.getHouse_default_livingroom_type());
		System.out.println("pool : " + house.getHouse_default_pool());
		return "7guesttextarea";
	}
	
	@RequestMapping(value = "/7guesttextarea.do")
	public String guesttextarea(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("guesttextarea : " + house.getHouse_desc1());
		return "8hosthouseimg";
	}
	
	@RequestMapping(value = "/8hosthouseimg.do")
	public String hosthouseimg(@ModelAttribute("house") HouseVO house, Model model) {
		System.out.println(house.toString());
		MultipartFile uploadFile = house.getHouse_photo();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			System.out.println("사진첨부한 파일 이름 : " + fileName);
			try {
				uploadFile.transferTo(new File("c:\\EclipsePractice\\" + fileName));
			} catch (IllegalStateException e) {
				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
			} catch (IOException e) {
				e.printStackTrace();
			}
			house.setHouse_photourl(fileName);
			System.out.println("houseVO안의 url : " + house.getHouse_photourl());
		}
		System.out.println("사진첨부 안했음");
		return "9hosttitle";
	} 
	
	@RequestMapping(value = "/9hosttitle.do")
	public String hosttitle(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("hosttitle : " + house.getHouse_name());
		return "10charge";
	}
	
	@RequestMapping(value = "10charge.do")
	public String charge(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		if(house.getHouse_price_default_parInt().length()>0) {
			String dePrice = (house.getHouse_price_default_parInt()).replace(",", "");
			int defaultPrice = Integer.parseInt(dePrice);
			house.setHouse_price_default(defaultPrice);
		}
		if(house.getHouse_price_max_parInt().length()>0) {
			String maPrice = (house.getHouse_price_max_parInt()).replace(",", "");
			int maxPrice = Integer.parseInt(maPrice);
			house.setHouse_price_max(maxPrice);
		}
		System.out.println("charge : " + house.getHouse_price_default());
		return "11restricttheme";
	}
	
	@RequestMapping(value = "/11restricttheme.do")
	public String restricttheme(@ModelAttribute("house") HouseVO house, Model model) {
		logger.info(house.toString());
		System.out.println("hosttitle : " + house.getHouse_name());
		return "12guestcheck1";
	}
}
