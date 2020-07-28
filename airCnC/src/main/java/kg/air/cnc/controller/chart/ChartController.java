package kg.air.cnc.controller.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.chart.Admin_salesService;
import kg.air.cnc.vo.Admin_salesVO;

@Controller
public class ChartController {
	@Autowired
	private Admin_salesService admin_salesService;
	@RequestMapping("salesChart.mdo")
	public ModelAndView salesChartController(ModelAndView mav) {
		mav.setViewName("admin_salesChart");
		return mav;
	}
	@RequestMapping("salesChartSearch.mdo")
	public ModelAndView salesChartController(Admin_salesVO vo,ModelAndView mav) {
		System.out.println(vo.getSearchConditionFirst());
		System.out.println(vo.getSearchConditionSecond());
		if(vo.getSearchType().equals("years"))mav.addObject("salesList",admin_salesService.getAdmin_salesForYears(vo));
		if(vo.getSearchType().equals("year"))mav.addObject("salesList",admin_salesService.getAdmin_salesForYear(vo));
		if(vo.getSearchType().equals("month"))mav.addObject("salesList",admin_salesService.getAdmin_salesForMonth(vo));
		if(vo.getSearchType().equals("days"))mav.addObject("salesList",admin_salesService.getAdmin_salesForDays(vo));
		mav.setViewName("admin_salesChart");
		return mav;
	}
}
