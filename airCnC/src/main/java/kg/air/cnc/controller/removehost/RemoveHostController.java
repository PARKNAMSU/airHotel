package kg.air.cnc.controller.removehost;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.removehost.RemoveHostServiceImpl;
import kg.air.cnc.vo.HostVO;

@Controller
public class RemoveHostController {
	
	@Autowired
	private RemoveHostServiceImpl removeHostService;
	
	@RequestMapping(value="/getRemoveHostList.mdo")
	public ModelAndView getHostList(ModelAndView mav) {
		mav.addObject("hostList",removeHostService.getRemoveHostList());
		mav.setViewName("getRemoveHostList");
		return mav;
	}
	
	@RequestMapping(value="/deleteHost.mdo")
	public ModelAndView deleteHost(HostVO vo, ModelAndView mav) {
		System.out.println("fucking "+vo.getHost_id());
		removeHostService.deleteHost(vo);
		mav.setViewName("redirect:getRemoveHostList.mdo");
		return mav;
	}
	
}
