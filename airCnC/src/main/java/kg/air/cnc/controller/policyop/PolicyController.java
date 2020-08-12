package kg.air.cnc.controller.policyop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.policyop.PolicyService;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PolicyVO;

@Controller
@SessionAttributes({"policy", "detail"})
public class PolicyController {
	@Autowired
	private PolicyService policyService;
	@ModelAttribute("policy")
	public PolicyVO setEmptyPolicy() {
		return new PolicyVO();
	}
	
	@RequestMapping("/selectPolicyList.do")// 유저의 정책 리스트
	public String openPolicyList(PagingCriteria cri, Model model) {
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(policyService.countPolicyListTotal());
	    List<PolicyVO> policyList = policyService.selectPolicyList(cri);
	    model.addAttribute("policyList", policyList);
	    model.addAttribute("paging", pageMaker);
	  
	    return "getPolicyList"; //jsp파일 1
	}
	
	@RequestMapping("/addPolicyList.mdo")//새 정책 등록하는 페이지에서의 동작
	public String addPolicy(@ModelAttribute("policy") PolicyVO policy, Model model) {
		policyService.insertPolicy(policy);
		System.out.println(policy.toString());
		return "redirect:/goPolicyListAdmin.mdo";
	}
	
	@RequestMapping("/goaddPolicy.mdo")//관리자가 새 정책 등록하는 페이지이동
	public String gotoaddPolicy(@ModelAttribute("policy") PolicyVO policy, Model model) {
		return "addPolicyList"; //jsp파일 2
	}
	
	@RequestMapping("/goPolicyListAdmin.mdo")//관리자의 정책 리스트
	public String goPolicyListAdmin(PagingCriteria cri, Model model) {
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(policyService.countPolicyListTotal());
		 List<PolicyVO> policyList = policyService.getPolicyListAdmin(cri);
		 model.addAttribute("policyList",policyList);
		 model.addAttribute("paging",pageMaker);
		
		return "getPolicyListAdmin";
	} //jsp파일 3
	
	@RequestMapping(value = "/detailPolicy/{policy_idx}.mdo")//관리자가 정책 목록 클릭해서 들어감.
	public String detailPolicy(@PathVariable("policy_idx") int policy_idx, Model model, PagingCriteria cri) throws Exception {
		System.out.println("policy_idx : " + policy_idx);
		model.addAttribute("detail", policyService.detailPolicy(policy_idx));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		return "addPolicyListModi"; //jsp파일 4
	}
	
	@RequestMapping("/updatePolicy.mdo")//목록 클릭해서 들어가면 있는 수정 기능
	public String updatePolicy(PolicyVO vo, Model model, PagingCriteria cri){
		policyService.updatePolicy(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goPolicyListAdmin.mdo";
	}
	
	@RequestMapping("/deletePolicy.mdo")//목록 클릭해서 들어가면 있는 삭제 기능
	public String deletePolicy(@RequestParam int policy_idx, Model model, PagingCriteria cri){
		policyService.deletePolicy(policy_idx);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("paging", pageMaker);
		
		return "redirect:/goPolicyListAdmin.mdo";
	}
}
