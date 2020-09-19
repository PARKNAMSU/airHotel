package kg.air.cnc.controller.personalqueop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.personalqueop.PersonalQueService;
import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PersonalQueVO;

@Controller
@SessionAttributes({"personalq", "detail"})
public class PersonalQueController {
	@Autowired
	private PersonalQueService personalqService;
	@ModelAttribute("personalq")
	public PersonalQueVO setEmptyPersonalQue() {
		return new PersonalQueVO();
	}
	
	
	@RequestMapping("/selectPersonalQueList.do")// 유저의 자신의 질문 리스트
	public String openPersonalQueList(Model model,
			@ModelAttribute("personalq") PersonalQueVO personalq, HttpSession session) {
	    String personalq_writer = (String)session.getAttribute("login_session");
	    personalq.setPersonalq_writer(personalq_writer);
	    System.out.println("11 : " + personalq.getPersonalq_writer());
		List<PersonalQueVO> personalqList = personalqService.selectPersonalQueList(personalq);
		System.out.println("22 : " + personalq.getPersonalq_writer());
		model.addAttribute("personalqList", personalqList);
//	    PageMaker pageMaker = new PageMaker();
//	    pageMaker.setCri(cri);
//	    pageMaker.setTotalCount(personalqService.countPersonalQueListTotal());
//	    List<PersonalQueVO> personalqList = personalqService.selectPersonalQueList(cri);
//	    model.addAttribute("personalqList", personalqList);
//	    model.addAttribute("paging", pageMaker);
	  
	    return "getPersonalQueList"; //jsp파일 1
	}
	
	@RequestMapping("/addPersonalQueList.do")//새 질문 등록하는 페이지에서의 동작
	public String addPersonalQue(@ModelAttribute("personalq") PersonalQueVO personalq, Model model) {
		personalqService.insertPersonalQue(personalq);
		System.out.println(personalq.toString());
		return "redirect:/selectPersonalQueList.do";
	}
	
	@RequestMapping("/goaddPersonalQue.do")//사용자가 새 질문 등록하는 페이지이동
	public String gotoaddPersonalQue(@ModelAttribute("personalq") PersonalQueVO personalq, Model model) {
		return "addPersonalQueList"; //jsp파일 2
	}
	
	@RequestMapping("/goPersonalQueListAdmin.mdo")//관리자의 모든유저의 질문 리스트
	public String goPersonalQueListAdmin(PagingCriteria cri, Model model) {
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(personalqService.countPersonalQueListTotal());
		 List<PersonalQueVO> personalqList = personalqService.getPersonalQueListAdmin(cri);
		 model.addAttribute("personalqList",personalqList);
		 model.addAttribute("paging",pageMaker);
		
		return "getPersonalQueListAdmin";
	} //jsp파일 3
	
	@RequestMapping(value = "/detailPersonalQue/{personalq_idx}.mdo")//관리자가 질문 목록 클릭해서 들어감.
	public String detailPersonalQue(@PathVariable("personalq_idx") int personalq_idx, Model model, PagingCriteria cri) throws Exception {
		System.out.println("personalq_idx : " + personalq_idx);
		model.addAttribute("detail", personalqService.detailPersonalQue(personalq_idx));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		return "addPersonalQueListModi"; //jsp파일 4
	}
	
	@RequestMapping("/updatePersonalQue.mdo")//목록 클릭해서 들어가면 있는 수정 기능
	public String updatePersonalQue(PersonalQueVO vo, Model model, PagingCriteria cri){
		personalqService.updatePersonalQue(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goPersonalQueListAdmin.mdo";
	}
	
	@RequestMapping("/deletePersonalQue.mdo")//목록 클릭해서 들어가면 있는 삭제 기능
	public String deletePersonalQue(@RequestParam int personalq_idx, Model model, PagingCriteria cri){
		personalqService.deletePersonalQue(personalq_idx);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goPersonalQueListAdmin.mdo";
	}
}
