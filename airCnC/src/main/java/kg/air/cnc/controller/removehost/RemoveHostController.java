package kg.air.cnc.controller.removehost;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.removehost.RemoveHostServiceImpl;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.PagingVO;

@Controller
public class RemoveHostController {
	
	@Autowired
	private RemoveHostServiceImpl removeHostService;
	
	@RequestMapping(value="/getRemoveHostList.mdo")
	public ModelAndView getHostList(ModelAndView mav, PagingVO page, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = removeHostService.hostCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mav.addObject("paging",page);
		mav.addObject("hostList",removeHostService.getRemoveHostList(page));
		mav.setViewName("getRemoveHostList");
		return mav;
	}
	
	@RequestMapping(value="/deleteHost.mdo")
	public ModelAndView deleteHost(HostVO vo, ModelAndView mav) {
		removeHostService.deleteHost(vo);
		mav.setViewName("redirect:getRemoveHostList.mdo");
		return mav;
	}
	
}
