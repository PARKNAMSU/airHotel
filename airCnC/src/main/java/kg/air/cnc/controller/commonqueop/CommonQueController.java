package kg.air.cnc.controller.commonqueop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.commonqueop.CommonQueService;
import kg.air.cnc.vo.CommonQueVO;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;


@Controller
@SessionAttributes({"commonq", "detail"})
public class CommonQueController {
	@Autowired
	private CommonQueService commonqService;
	
	@ModelAttribute("commonq")
	public CommonQueVO setEmptyCommonQue() {
		return new CommonQueVO();
	}
	
	@RequestMapping("/selectCommonQueList.do")// 유저의 정책 리스트
	public String openCommonQueList(PagingCriteria cri, Model model) {
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(commonqService.countCommonQueListTotal());
	    List<CommonQueVO> commonqList = commonqService.selectCommonQueList(cri);
	    model.addAttribute("commonqList", commonqList);
	    model.addAttribute("paging", pageMaker);
	  
	    return "getCommonQueList"; //jsp파일 1
	}
	@RequestMapping("/selectCommonQueListType.do")// 유저의 정책 리스트
	public String openCommonQueListType(@RequestParam String commonq_type, Model model) {
	    if(commonq_type.length()>0) {
			String detype = commonq_type.replace(",", "");
			commonq_type = detype;
		}
	    System.out.println("타입 : " + commonq_type);
	    List<CommonQueVO> commonqList = commonqService.selectCommonQueListType(commonq_type);
	    model.addAttribute("commonqList", commonqList);
	  
	    return "getCommonQueListType"; //jsp파일 1
	}
	
	@RequestMapping("/addCommonQueList.mdo")//새 정책 등록하는 페이지에서의 동작
	public String addCommonQue(@ModelAttribute("commonq") CommonQueVO commonq, Model model) {
		commonqService.insertCommonQue(commonq);
		System.out.println(commonq.toString());
		return "redirect:/goCommonQueListAdmin.mdo";
	}
	
	@RequestMapping("/goaddCommonQue.mdo")//관리자가 새 정책 등록하는 페이지이동
	public String gotoaddCommonQue(@ModelAttribute("commonq") CommonQueVO commonq, Model model) {
		return "addCommonQueList"; //jsp파일 2
	}
	
	@RequestMapping("/goCommonQueListAdmin.mdo")//관리자의 정책 리스트
	public String goCommonQueListAdmin(PagingCriteria cri, Model model) {
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(commonqService.countCommonQueListTotal());
		 List<CommonQueVO> commonqList = commonqService.getCommonQueListAdmin(cri);
		 model.addAttribute("commonqList",commonqList);
		 model.addAttribute("paging",pageMaker);
		
		return "getCommonQueListAdmin";
	} //jsp파일 3
	
	@RequestMapping(value = "/detailCommonQue/{commonq_idx}.mdo")//관리자가 정책 목록 클릭해서 들어감.
	public String detailCommonQue(@PathVariable("commonq_idx") int commonq_idx, Model model, PagingCriteria cri) throws Exception {
		System.out.println("commonq_idx : " + commonq_idx);
		model.addAttribute("detail", commonqService.detailCommonQue(commonq_idx));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		return "addCommonQueListModi"; //jsp파일 4
	}
	
	@RequestMapping("/updateCommonQue.mdo")//목록 클릭해서 들어가면 있는 수정 기능
	public String updateCommonQue(CommonQueVO vo, Model model, PagingCriteria cri){
		commonqService.updateCommonQue(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goCommonQueListAdmin.mdo";
	}
	
	@RequestMapping("/deleteCommonQue.mdo")//목록 클릭해서 들어가면 있는 삭제 기능
	public String deleteCommonQue(@RequestParam int commonq_idx, Model model, PagingCriteria cri){
		commonqService.deleteCommonQue(commonq_idx);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goCommonQueListAdmin.mdo";
	}
}
