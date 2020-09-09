package kg.air.cnc.controller.housereg;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kg.air.cnc.service.housereg.HouseService;
import kg.air.cnc.vo.House_InfoVO;


@Controller
@SessionAttributes({"house", "detail"})
public class HouseController {
	
	@Resource(name = "houseService")
	private HouseService houseService;
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@ModelAttribute("house")
	public House_InfoVO setEmptyHouse() {
		return new House_InfoVO();
	}
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detail(String houseId, Model model) {
		model.addAttribute("detail", houseService.detailProduct(houseId));
		return "houseDetail";
	}
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String houseLlist(Model model, SessionStatus sessionStatus) throws Exception {
		List<House_InfoVO> list = houseService.listProduct();
		logger.info(list.toString());
		model.addAttribute("list", list);
		sessionStatus.setComplete();
		return "houseList";
	}
	@RequestMapping(value = "/topage.do")
	public String topage(@ModelAttribute("house") House_InfoVO house, Model model) {
		return "houseinsert1";
	}
	@RequestMapping(value="/write1.do", method = RequestMethod.POST)
	public String write1(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		return "houseinsert2";
	}
	@RequestMapping(value="/write2.do", method = RequestMethod.POST)
	public String write2(@ModelAttribute("house") House_InfoVO house, Model model, SessionStatus sessionStatus) throws Exception {
		logger.info(house.toString());
		houseService.insertProduct(house);
		sessionStatus.setComplete();
		return "redirect:/list.do";
	}
	@RequestMapping(value = "/totestpage.do")
	public String totestpage() {
		//return "hostHouse_resume";
		return "hostHouse_ReviseList";
	}
	
	

	@RequestMapping(value = "/hostregisterindex.do")
	public String mainPage(@ModelAttribute("house") House_InfoVO house, Model model, HttpSession session) {
		
		String hostId = (String)session.getAttribute("login_session");
		house.setHouse_host_id(hostId);
		System.out.println(house.getHouse_host_id());
		
		//house.setHouse_host_id("IMSIhostID");
		//house.setHouse_seq(26);
		System.out.println("호스트 아이디 : " + house.getHouse_host_id());
		System.out.println("수정하려는 집 pk : " + house.getHouse_seq());
		return "1newhouse";
	}
	
	@RequestMapping(value = "/house_revise.do")
//	public String revisePage(@ModelAttribute("house") House_InfoVO house, HttpSession session
//			, Model model) {
//		String host_house_seq = (String) session.getAttribute("house_seq");
//		int house_seq = Integer.parseInt(host_house_seq);
//		house.setHouse_seq(house_seq);
//		model.addAttribute("detail", houseService.detailHouse(house_seq));
//		return "hostHouse_ReviseList";
//	}
	
//	@RequestMapping(value = "/listhouse.do", method = RequestMethod.GET)
//	public String listHouse(Model model, SessionStatus sessionStatus) throws Exception {
//		List<House_InfoVO> list = houseService.listHouse();
//		model.addAttribute("list", list);
//		sessionStatus.setComplete();
//		return "totalhouseList";
//	}
	public String revisePage(House_InfoVO house, HttpSession session
			, Model model) {
		int house_seq = house.getHouse_seq();
		house.setHouse_seq(house_seq);
		model.addAttribute("detail", houseService.detailHouse(house_seq));
		return "hostHouse_ReviseList";
	}
	
	@RequestMapping(value = "/1newhouse.do")
	public String newhouse(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("newhouse : " + house.getNewhouse());
		if(house.getNewhouse().equals("new1")) {
			return "2housedetail";
			
		} else if(house.getNewhouse().equals("new2")) {
//			int house_seq = house.getHouse_seq();
//			model.addAttribute("detail", houseService.detailHouse(house_seq));
//			return "hostHouse_ReviseList";
			String hostId = house.getHouse_host_id();
			System.out.println(hostId);
			List<House_InfoVO> list = houseService.listHouse(house);
			model.addAttribute("list", list);
			return "123totalhouse";
		}
		//숙소 등록중, 등록했던 숙소는 new2, new3로 조건부여
		return null;
	}
	
	
//	@RequestMapping(value = "/revisehouse.do", method = RequestMethod.GET)//123totalhouse에서 집 선택하여 seq, 받아서 수정리스트로
//	public String listHouse(@ModelAttribute("house") House_InfoVO house, Model model) throws Exception {
//		int houseSeq = house.getHouse_seq();
//		System.out.println("집 순번" + houseSeq);
//		model.addAttribute("detail", houseService.detailHouse(houseSeq));
//		return "hostHouse_ReviseList";
//	}
	@RequestMapping(value = "/revisehouse/{house_seq}.do", method = RequestMethod.GET)//123totalhouse에서 집 선택하여 seq, 받아서 수정리스트로
	public String listHouse(@PathVariable("house_seq") int house_seq, @ModelAttribute("house") House_InfoVO house, Model model) throws Exception {
		
		house.setHouse_seq(house_seq);
		System.out.println("수정하는 집 순번 : " + house.getHouse_seq());
		model.addAttribute("detail", houseService.detailHouse(house_seq));
		return "hostHouse_ReviseList";
	}
	
	
	@RequestMapping(value = "/2housedetail.do")// 1newhouse에서 시작하여 등록 시작
	public String housedetail(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("housedetail : " + house.getHouse_bedroom_amount());
		return "3bathcount";
	}
	@RequestMapping(value = "/update_2housedetailopen.do")
	public String update_2housedetailopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("2housedetail 수정 페이지로 이동");
		return "2housedetail_update";
	}
	
	@RequestMapping(value = "/update_2housedetailwork.do")
	public String update_2housedetailwork(@ModelAttribute("house") House_InfoVO house, Model model) {
		houseService.updateHouse_housedetail(house);
		System.out.println("2housedetail 수정완료");
		return "forward:/1newhouse.do";
	}
	
	
	
	
	
	@RequestMapping(value = "/3bathcount.do")
	public String bathcount(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("bathcount : " + house.getHouse_bathroom_type());
		return "4location";
	}//상세보기
	@RequestMapping(value = "/update_3bathcountopen.do")
	public String update_bathcountopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("3bathcount 수정 페이지로 이동");
		return "3bathcount_update";
	}//수정이동
	@RequestMapping(value = "/update_3bathcountwork.do")
	public String update_3bathcountwork(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("욕실수 : " + house.getHouse_bathroom_amount());
		System.out.println("공용여부 : " + house.getHouse_bathroom_type());
		houseService.updateHouse_bathcount(house);
		System.out.println("3bathcount 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	@RequestMapping(value = "/4location.do")
	public String location(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("sido : " + house.getHouse_location_sido());
		System.out.println("sigun : " + house.getHouse_location_gugun());
		System.out.println("location_x : " + house.getHouse_xlocation());
		System.out.println("location : " + house.getHouse_location());
		System.out.println("location : " + house.getHouse_location_fulladdress());
		return "5defaultoption";
	}//상세보기
	@RequestMapping(value = "/update_4locationopen.do")
	public String update_locationopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("4location 수정 페이지로 이동");
		return "4location_update";
	}//수정이동
	@RequestMapping(value = "/update_4locationwork.do")
	public String update_locationwork(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("sido : " + house.getHouse_location_sido());
		System.out.println("sigun : " + house.getHouse_location_gugun());
		System.out.println("location_x : " + house.getHouse_xlocation());
		System.out.println("location : " + house.getHouse_location());
		System.out.println("location : " + house.getHouse_location_fulladdress());
		houseService.updateHouse_location(house);
		System.out.println("4location 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	@RequestMapping(value = "/5defaultoption.do")
	public String defaultoption(@ModelAttribute("house") House_InfoVO house, Model model) {
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
		System.out.println("등록 중 defaultsetting : " + house.getHouse_defaultsetting());
		System.out.println("등록 중 default_bedrock : " + house.getHouse_default_bedrock());
		return "6guestcomfortable";
	}//상세보기
	@RequestMapping(value = "/update_5defaultoptionopen.do")
	public String update_defaultoptionopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("5defaultoption 수정 페이지로 이동");
		return "5defaultoption_update";
	}//수정이동
	@RequestMapping(value = "/update_5defaultoptionwork.do")
	public String update_defaultoptionwork(@ModelAttribute("house") House_InfoVO house, Model model) {
		if(house.getHouse_defaultsetting_0or1().equals("false")) {house.setHouse_defaultsetting("false");} 
		else {house.setHouse_defaultsetting("true");}
		if(house.getHouse_default_tv_0or1().equals("false")) {house.setHouse_default_tv("false");} 
		else {house.setHouse_default_tv("true");}
		if(house.getHouse_default_wifi_0or1().equals("false")) {house.setHouse_default_wifi("false");} 
		else {house.setHouse_default_wifi("true");}
		if(house.getHouse_default_heater_0or1().equals("false")) {house.setHouse_default_heater("false");} 
		else {house.setHouse_default_heater("true");}
		if(house.getHouse_default_cooler_0or1().equals("false")) {house.setHouse_default_cooler("false");} 
		else {house.setHouse_default_cooler("true");}
		if(house.getHouse_default_iron_0or1().equals("false")) {house.setHouse_default_iron("false");} 
		else {house.setHouse_default_iron("true");}
		if(house.getHouse_default_fireditecter_0or1().equals("false")) {house.setHouse_default_fireditecter("false");} 
		else {house.setHouse_default_fireditecter("true");}
		if(house.getHouse_default_coditecter_0or1().equals("false")) {house.setHouse_default_coditecter("false");} 
		else {house.setHouse_default_coditecter("true");}
		if(house.getHouse_default_aidkit_0or1().equals("false")) {house.setHouse_default_aidkit("false");} 
		else {house.setHouse_default_aidkit("true");}
		if(house.getHouse_default_firesofwa_0or1().equals("false")) {house.setHouse_default_firesofwa("false");} 
		else {house.setHouse_default_firesofwa("true");}
		if(house.getHouse_default_bedrock_0or1().equals("false")) {house.setHouse_default_bedrock("false");} 
		else {house.setHouse_default_bedrock("true");}
		System.out.println("수정 중 defaultsetting : " + house.getHouse_defaultsetting());
		System.out.println("수정 중 default_bedrock : " + house.getHouse_default_bedrock());
		houseService.updateHouse_defaultoption(house);
		System.out.println("5defaultoption 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	@RequestMapping(value = "/6guestcomfortable.do")
	public String guestcomfortable(@ModelAttribute("house") House_InfoVO house, Model model) {
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

		System.out.println("등록 중 livingroom_type : " + house.getHouse_default_livingroom_type());
		System.out.println("등록 중 pool : " + house.getHouse_default_pool());
		return "7guesttextarea";
	}//상세보기
	@RequestMapping(value = "/update_6guestcomfortableopen.do")
	public String update_guestcomfortableopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("6guestcomfortable 수정 페이지로 이동");
		return "6guestcomfortable_update";
	}//수정이동
	@RequestMapping(value = "/update_6guestcomfortablework.do")
	public String update_guestcomfortablework(@ModelAttribute("house") House_InfoVO house, Model model) {
		if(house.getHouse_default_livingroom_type_0or1().equals("false")) {house.setHouse_default_livingroom_type("false");} 
		else {house.setHouse_default_livingroom_type("true");}
		if(house.getHouse_default_kitchen_0or1().equals("false")) {house.setHouse_default_kitchen("false");} 
		else {house.setHouse_default_kitchen("true");}
		if(house.getHouse_default_laundry_washer_0or1().equals("false")) {house.setHouse_default_laundry_washer("false");} 
		else {house.setHouse_default_laundry_washer("true");}
		if(house.getHouse_default_laundry_dryer_0or1().equals("false")) {house.setHouse_default_laundry_dryer("false");} 
		else {house.setHouse_default_laundry_dryer("true");}
		if(house.getHouse_default_parking_0or1().equals("false")) {house.setHouse_default_parking("false");} 
		else {house.setHouse_default_parking("true");}
		if(house.getHouse_default_gym_0or1().equals("false")) {house.setHouse_default_gym("false");} 
		else {house.setHouse_default_gym("true");}
		if(house.getHouse_default_pool_0or1().equals("false")) {house.setHouse_default_pool("false");} 
		else {house.setHouse_default_pool("true");}
		System.out.println("수정 중 livingroom_type왜왜왜 : " + house.getHouse_default_livingroom_type_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_livingroom_type());
		System.out.println("수정 중 house_default_kitchen_0or1 : " + house.getHouse_default_kitchen_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_kitchen());
		System.out.println("수정 중 house_default_laundry_washer_0or1 : " + house.getHouse_default_laundry_washer_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_laundry_washer());
		System.out.println("수정 중 house_default_laundry_dryer_0or1 : " + house.getHouse_default_laundry_dryer_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_laundry_dryer());
		System.out.println("수정 중 house_default_parking_0or1 : " + house.getHouse_default_parking_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_parking());
		System.out.println("수정 중 house_default_gym_0or1 : " + house.getHouse_default_gym_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_gym());
		System.out.println("수정 중 house_default_pool_0or1 : " + house.getHouse_default_pool_0or1());
		System.out.println("수정 중 livingroom_type : " + house.getHouse_default_pool());
		houseService.updateHouse_guestcomfortable(house);
		System.out.println("6guestcomfortable 수정완료");
		return "forward:/1newhouse.do";
	}
	
	@RequestMapping(value = "/7guesttextarea.do")
	public String guesttextarea(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("등록 중 guesttextarea : " + house.getHouse_desc1());
		return "8hosthouseimg";
	}//상세보기
	@RequestMapping(value = "/update_7guesttextareaopen.do")
	public String update_guesttextareaopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("7guesttextarea 수정 페이지로 이동");
		return "7guesttextarea_update";
	}//수정이동
	@RequestMapping(value = "/update_7guesttextareawork.do")
	public String update_guesttextareawork(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("수정 중 guesttextarea : " + house.getHouse_desc1());
		houseService.updateHouse_guesttextarea(house);
		System.out.println("7guesttextarea 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/8hosthouseimg.do", method = RequestMethod.POST)
	public String hosthouseimg(@ModelAttribute("house") House_InfoVO house, Model model,
			MultipartHttpServletRequest mtfRequest) {
		System.out.println(house.toString());
		MultipartFile uploadFile = house.getHouse_photo();
		String file = uploadFile.getOriginalFilename();
		System.out.println("file :" + file);
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			//String path = "c:\\EclipsePractice\\aaa\\";
			System.out.println("리얼패스 : " + mtfRequest.getSession().getServletContext().getRealPath("/upload/"));
			String path = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
			System.out.println("사진첨부한 파일 이름 : " + fileName);
			try {
				new File(path).mkdirs();
				uploadFile.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName));
			} catch (IllegalStateException e) {
				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
			} catch (IOException e) {
				System.err.println("사진파일을 첨부하지 않았음");
			}
			house.setHouse_photourl(house.getHouse_host_id() + "_" + fileName);
			System.out.println("houseVO안의 url : " + house.getHouse_photourl());
		}
//		List<MultipartFile> fileList = mtfRequest.getFiles("house_photo");
//		
//		System.out.println("리얼패스 : " + mtfRequest.getSession().getServletContext().getRealPath("/upload/"));
//		String path = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
//		for(MultipartFile mf : fileList) {
//			String fileName = mf.getOriginalFilename();
//			System.out.println("오리지널 파일 네임 : " + fileName);
//			try {
//				new File(path).mkdirs();
//				mf.transferTo(new File(path + fileName));
//				System.out.println("복사완료");
//				
//				String newurl = house.getHouse_photourl();
//				if(newurl == null) {
//					newurl = "";
//				}
//				System.out.println("이전 이름 : " + newurl);
//				house.setHouse_photourl(newurl + "_" + fileName);
//				System.out.println("새 이름 : " + house.getHouse_photourl());
//			} catch (IllegalStateException e) {
//				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
//			} catch (IOException e) {
//				System.err.println("사진파일을 첨부하지 않았음");
//			}
//		
//		}	
		return "9hosttitle";
	} //상세보기
	@RequestMapping(value = "/update_8hosthouseimgopen.do")
	public String update_hosthouseimgopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("8hosthouseimg 수정 페이지로 이동");
		return "8hosthouseimg_update";
	}//수정이동
	@RequestMapping(value = "/update_8hosthouseimgwork.do")
	public String update_hosthouseimgwork(@ModelAttribute("house") House_InfoVO house, Model model,
			MultipartHttpServletRequest mtfRequest) {
		MultipartFile uploadFile = house.getHouse_photo();
		MultipartFile uploadFile_detail1 = house.getHouse_photo_detail1();
		MultipartFile uploadFile_detail2 = house.getHouse_photo_detail2();
		MultipartFile uploadFile_detail3 = house.getHouse_photo_detail3();
		MultipartFile uploadFile_detail4 = house.getHouse_photo_detail4();
		
		if(!uploadFile.isEmpty() || !uploadFile_detail1.isEmpty() || !uploadFile_detail2.isEmpty()
				|| !uploadFile_detail3.isEmpty() || !uploadFile_detail4.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String fileName_detail1 = uploadFile_detail1.getOriginalFilename();
			if(uploadFile_detail1.isEmpty()) {fileName_detail1 = "noimage.png";}
//			if(fileName_detail1.length()<1) fileName_detail1 = "noimage.png";
			String fileName_detail2 = uploadFile_detail2.getOriginalFilename();
			if(uploadFile_detail2.isEmpty()) fileName_detail2 = "noimage.png";
			String fileName_detail3 = uploadFile_detail3.getOriginalFilename();
			if(uploadFile_detail3.isEmpty()) fileName_detail3 = "noimage.png";
			String fileName_detail4 = uploadFile_detail4.getOriginalFilename();
			if(uploadFile_detail4.isEmpty()) fileName_detail4 = "noimage.png";

			System.out.println("리얼패스 : " + mtfRequest.getSession().getServletContext().getRealPath("/upload/"));
			String path = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
			System.out.println("수정으로 사진첨부한 파일 이름 : " + fileName + ", " + fileName_detail1 
					+ ", " + fileName_detail2 + ", " + fileName_detail3 + ", " + fileName_detail4);
			try {
				new File(path).mkdirs();
				uploadFile.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName));
				if(!fileName_detail1.equals("noimage.png")) uploadFile_detail1.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName_detail1));
				if(!fileName_detail2.equals("noimage.png")) uploadFile_detail2.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName_detail2));
				if(!fileName_detail3.equals("noimage.png")) uploadFile_detail3.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName_detail3));
				if(!fileName_detail4.equals("noimage.png")) uploadFile_detail4.transferTo(new File(path + house.getHouse_host_id() + "_" + fileName_detail4));
			} catch (IllegalStateException e) {
				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
			} catch (IOException e) {
				System.err.println("사진파일을 첨부하지 않았음");
			}
			house.setHouse_photourl(house.getHouse_host_id() + "_" + fileName);
			if(fileName_detail1.equals("noimage.png")) {house.setHouse_photourl_detail1("noimage.png");}
			else {house.setHouse_photourl_detail1(house.getHouse_host_id() + "_" + fileName_detail1);}
			if(fileName_detail2.equals("noimage.png")) {house.setHouse_photourl_detail2("noimage.png");}
			else {house.setHouse_photourl_detail2(house.getHouse_host_id() + "_" + fileName_detail2);}
			if(fileName_detail3.equals("noimage.png")) {house.setHouse_photourl_detail3("noimage.png");}
			else {house.setHouse_photourl_detail3(house.getHouse_host_id() + "_" + fileName_detail3);}
			if(fileName_detail4.equals("noimage.png")) {house.setHouse_photourl_detail4("noimage.png");}
			else {house.setHouse_photourl_detail4(house.getHouse_host_id() + "_" + fileName_detail4);}
			
			houseService.updateHouse_hosthouseimg(house);
			System.out.println("houseVO안의 url : " + house.getHouse_photourl());
			System.out.println("houseVO안의 url_detail1 : " + house.getHouse_photourl_detail1());
		}
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	@RequestMapping(value = "/9hosttitle.do")
	public String hosttitle(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("hosttitle : " + house.getHouse_name());
		return "10charge";
	}//상세보기
	@RequestMapping(value = "/update_9hosttitleopen.do")
	public String update_hosttitleopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("9hosttitle 수정 페이지로 이동");
		return "9hosttitle_update";
	}//수정이동
	@RequestMapping(value = "/update_9hosttitlework.do")
	public String update_hosttitlework(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("수정 중 hosttitle : " + house.getHouse_name());
		houseService.updateHouse_hosttitle(house);
		System.out.println("9hosttitle 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	
	
	
	@RequestMapping(value = "/10charge.do")
	public String charge(@ModelAttribute("house") House_InfoVO house, Model model) {
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
		System.out.println("check-in : " + house.getHouse_checkin_time());
		System.out.println("check-out : " + house.getHouse_checkout_time());
		System.out.println("charge : " + house.getHouse_price_default());
		return "11restricttheme";
	}//상세보기
	@RequestMapping(value = "/update_10chargeopen.do")
	public String update_10chargeopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("10charge 수정 페이지로 이동");
		return "10charge_update";
	}//수정이동
	@RequestMapping(value = "/update_10chargework.do")
	public String update_10chargework(@ModelAttribute("house") House_InfoVO house, Model model) {
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
		System.out.println("수정 중 check-in : " + house.getHouse_checkin_time());
		System.out.println("수정 중 check-out : " + house.getHouse_checkout_time());
		System.out.println("수정 중 charge : " + house.getHouse_price_default());
		houseService.updateHouse_charge(house);
		System.out.println("10charge 수정완료");
		return "forward:/1newhouse.do";
	}//수정동작
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/11restricttheme.do")
	public String restricttheme(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		if(house.getHouse_theme_bbq_0or1()==null) {house.setHouse_theme_bbq("false");} 
		else {house.setHouse_theme_bbq("true");}
		if(house.getHouse_theme_pet_0or1()==null) {house.setHouse_theme_pet("false");} 
		else {house.setHouse_theme_pet("true");}
		if(house.getHouse_theme_party_0or1()==null) {house.setHouse_theme_party("false");} 
		else {house.setHouse_theme_party("true");}
		if(house.getHouse_theme_pool_0or1()==null) {house.setHouse_theme_pool("false");} 
		else {house.setHouse_theme_pool("true");}
		if(house.getHouse_theme_farm_0or1()==null) {house.setHouse_theme_farm("false");} 
		else {house.setHouse_theme_farm("true");}
		
		if(house.getHouse_condition_childok_0or1()==null) {house.setHouse_condition_childok("false");} 
		else {house.setHouse_condition_childok("true");}
		if(house.getHouse_condition_babyok_0or1()==null) {house.setHouse_condition_babyok("false");} 
		else {house.setHouse_condition_babyok("true");}
		if(house.getHouse_condition_smokeok_0or1()==null) {house.setHouse_condition_smokeok("false");} 
		else {house.setHouse_condition_smokeok("true");}
		
		if(house.getHouse_restrict_stairs_0or1()==null) {house.setHouse_restrict_stairs("false");} 
		else {house.setHouse_restrict_stairs("true");}
		if(house.getHouse_restrict_noise_0or1()==null) {house.setHouse_restrict_noise("false");} 
		else {house.setHouse_restrict_noise("true");}
		if(house.getHouse_restrict_pet_0or1()==null) {house.setHouse_restrict_pet("false");} 
		else {house.setHouse_restrict_pet("true");}
		if(house.getHouse_restrict_cantpark_0or1()==null) {house.setHouse_restrict_cantpark("false");} 
		else {house.setHouse_restrict_cantpark("true");}
		if(house.getHouse_restrict_commonspace_0or1()==null) {house.setHouse_restrict_commonspace("false");} 
		else {house.setHouse_restrict_commonspace("true");}
		if(house.getHouse_restrict_facility_0or1()==null) {house.setHouse_restrict_facility("false");} 
		else {house.setHouse_restrict_facility("true");}
		if(house.getHouse_restrict_cctv_0or1()==null) {house.setHouse_restrict_cctv("false");} 
		else {house.setHouse_restrict_cctv("true");}
		if(house.getHouse_restrict_weapon_0or1()==null) {house.setHouse_restrict_weapon("false");} 
		else {house.setHouse_restrict_weapon("true");}
		if(house.getHouse_restrict_beast_0or1()==null) {house.setHouse_restrict_beast("false");} 
		else {house.setHouse_restrict_beast("true");}
		
		System.out.println("theme_bbq : " + house.getHouse_theme_bbq());
		System.out.println("restrict_beast : " + house.getHouse_restrict_beast());
		
		return "12guestcheck1";
	}//상세보기
	@RequestMapping(value = "/update_11restrictthemeopen.do")
	public String update_restrictthemeopen(@ModelAttribute("house") House_InfoVO house, Model model) {
		System.out.println("11restricttheme 수정 페이지로 이동");
		return "11restricttheme_update";
	}//수정이동
	@RequestMapping(value = "/update_11restrictthemework.do")
	public String update_11restrictthemework(@ModelAttribute("house") House_InfoVO house, Model model) {
		if(house.getHouse_theme_bbq_0or1().equals("false")) {house.setHouse_theme_bbq("false");} 
		else {house.setHouse_theme_bbq("true");}
		if(house.getHouse_theme_pet_0or1().equals("false")) {house.setHouse_theme_pet("false");} 
		else {house.setHouse_theme_pet("true");}
		if(house.getHouse_theme_party_0or1().equals("false")) {house.setHouse_theme_party("false");} 
		else {house.setHouse_theme_party("true");}
		if(house.getHouse_theme_pool_0or1().equals("false")) {house.setHouse_theme_pool("false");} 
		else {house.setHouse_theme_pool("true");}
		if(house.getHouse_theme_farm_0or1().equals("false")) {house.setHouse_theme_farm("false");} 
		else {house.setHouse_theme_farm("true");}
		
		if(house.getHouse_condition_childok_0or1().equals("false")) {house.setHouse_condition_childok("false");} 
		else {house.setHouse_condition_childok("true");}
		if(house.getHouse_condition_babyok_0or1().equals("false")) {house.setHouse_condition_babyok("false");} 
		else {house.setHouse_condition_babyok("true");}
		if(house.getHouse_condition_smokeok_0or1().equals("false")) {house.setHouse_condition_smokeok("false");} 
		else {house.setHouse_condition_smokeok("true");}
		
		if(house.getHouse_restrict_stairs_0or1().equals("false")) {house.setHouse_restrict_stairs("false");} 
		else {house.setHouse_restrict_stairs("true");}
		if(house.getHouse_restrict_noise_0or1().equals("false")) {house.setHouse_restrict_noise("false");} 
		else {house.setHouse_restrict_noise("true");}
		if(house.getHouse_restrict_pet_0or1().equals("false")) {house.setHouse_restrict_pet("false");} 
		else {house.setHouse_restrict_pet("true");}
		if(house.getHouse_restrict_cantpark_0or1().equals("false")) {house.setHouse_restrict_cantpark("false");} 
		else {house.setHouse_restrict_cantpark("true");}
		if(house.getHouse_restrict_commonspace_0or1().equals("false")) {house.setHouse_restrict_commonspace("false");} 
		else {house.setHouse_restrict_commonspace("true");}
		if(house.getHouse_restrict_facility_0or1().equals("false")) {house.setHouse_restrict_facility("false");} 
		else {house.setHouse_restrict_facility("true");}
		if(house.getHouse_restrict_cctv_0or1().equals("false")) {house.setHouse_restrict_cctv("false");} 
		else {house.setHouse_restrict_cctv("true");}
		if(house.getHouse_restrict_weapon_0or1().equals("false")) {house.setHouse_restrict_weapon("false");} 
		else {house.setHouse_restrict_weapon("true");}
		if(house.getHouse_restrict_beast_0or1().equals("false")) {house.setHouse_restrict_beast("false");} 
		else {house.setHouse_restrict_beast("true");}
		
		System.out.println("수정중 theme_bbq : " + house.getHouse_theme_bbq());
		System.out.println("수정중 restrict_beast : " + house.getHouse_restrict_beast());
		houseService.updateHouse_restricttheme(house);
		System.out.println("11restricttheme 수정완료");
		return "forward:/1newhouse.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/12guestcheck1.do")
	public String guestcheck1(@ModelAttribute("house") House_InfoVO house, Model model) {
		logger.info(house.toString());
		System.out.println("게스트에게의 여러정보들!");
		return "13chargetext";
	}
	
	@RequestMapping(value = "/13chargetext.do")
	public String chargetext(@ModelAttribute("house") House_InfoVO house, Model model, SessionStatus sessionStatus) throws Exception{
		
		logger.info(house.toString());
		houseService.insertHouse(house);
		sessionStatus.setComplete();
		System.out.println("집 등록 완료!");
		return "redirect:/hostregisterindex.do";
	}
}
