package kg.air.cnc.controller.eventop;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kg.air.cnc.service.eventop.EventService;
import kg.air.cnc.vo.EventVO;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;

@Controller
@SessionAttributes({"evnet", "detail"})
public class EventController {
	@Autowired
	private EventService eventService;
	@ModelAttribute("evnet")
	public EventVO setEmptyEvent() {
		return new EventVO();
	}
	
	@RequestMapping("/selectEventList.do")// 유저의 이벤트 리스트
	public String openBoardList(PagingCriteria cri, Model model) {
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(eventService.countEventListTotal());
	    List<EventVO> eventList = eventService.selectEventList(cri);
	    model.addAttribute("eventList", eventList);
	    model.addAttribute("paging", pageMaker);
	  
	    return "getEventList"; //jsp파일 1
	}
	
	@RequestMapping(value = "/partiEvent/{event_idx}.do")
	public String partiEvent(@PathVariable("event_idx") int event_idx, Model model, PagingCriteria cri) throws Exception {
		System.out.println("event_idx : " + event_idx);
		model.addAttribute("detail", eventService.detailEvent(event_idx));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		return "getEventOpen"; //jsp파일 5
	}
	
	@RequestMapping("/addEventList.mdo")//새 이벤트 등록하는 페이지에서의 동작
	public String addEvent(@ModelAttribute("event") EventVO event, Model model,
			MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("event_img");
		String path = "c:\\EclipsePractice\\bbb\\";
		
		for(MultipartFile mf : fileList) {
			String fileName = mf.getOriginalFilename();
			try {
				new File(path).mkdirs();
				mf.transferTo(new File(path + fileName));
				System.out.println("복사완료");
				event.setEvent_url(path + fileName);
				System.out.println("이벤트 사진 경로 : " + event.getEvent_url());
			} catch (IllegalStateException e) {
				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
		eventService.insertEvent(event);
		System.out.println(event.toString());
		return "redirect:/goEventListAdmin.mdo"; 
	}
	
	@RequestMapping("/goaddEvent.mdo")//관리자가 새 이벤트 등록하는 페이지이동
	public String gotoaddEvent(@ModelAttribute("event") EventVO event, Model model) {
		return "addEventList"; //jsp파일 2
	}
	
	@RequestMapping("/goEventListAdmin.mdo")//관리자의 공지사항 리스트
	public String goEventListAdmin(PagingCriteria cri, Model model) {
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(eventService.countEventListTotal());
		 List<EventVO> eventList = eventService.getEventListAdmin(cri);
		 model.addAttribute("eventList",eventList);
		 model.addAttribute("paging",pageMaker);
		
		return "getEventListAdmin"; //jsp파일 3
	}
	
	@RequestMapping(value = "/detailEvent/{event_idx}.mdo")//관리자가 공지사항 목록 클릭해서 들어감.
	public String detailEvent(@PathVariable("event_idx") int event_idx, Model model, PagingCriteria cri) throws Exception {
		System.out.println("event_idx : " + event_idx);
		model.addAttribute("detail", eventService.detailEvent(event_idx));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		return "addEventListModi"; //jsp파일 4
	}
	
	@RequestMapping("/updateEvent.mdo")//목록 클릭해서 들어가면 있는 수정 기능
	public String updateEvent(EventVO vo, Model model, PagingCriteria cri
			,MultipartHttpServletRequest mtfRequest){
		List<MultipartFile> fileList = mtfRequest.getFiles("event_img");
		String path = "c:\\EclipsePractice\\bbb\\";
		
		for(MultipartFile mf : fileList) {
			String fileName = mf.getOriginalFilename();
			try {
				new File(path).mkdirs();
				mf.transferTo(new File(path + fileName));
				System.out.println("복사완료");
				vo.setEvent_url(path + fileName);
				System.out.println("이벤트 사진 경로 : " + vo.getEvent_url());
			} catch (IllegalStateException e) {
				System.err.println("같은 이름의 파일 있거나 되돌아가서임");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
		
		eventService.updateEvent(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goEventListAdmin.mdo";
	}
	
	@RequestMapping("/deleteEvent.mdo")//목록 클릭해서 들어가면 있는 삭제 기능
	public String deleteEvent(@RequestParam int event_idx, Model model, PagingCriteria cri){
		eventService.deleteEvent(event_idx);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goEventListAdmin.mdo";
	}
	
	
}
