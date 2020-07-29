package kg.air.cnc.controller.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.chart.Admin_salesService;
import kg.air.cnc.vo.Admin_salesVO;

@Controller
public class ChartController {
	@Autowired
	private Admin_salesService admin_salesService;
	/*처음 매출페이지로 이동*/
	@RequestMapping("salesChart.mdo")
	public ModelAndView salesChartController(ModelAndView mav) {
		mav.setViewName("admin_salesChart");
		return mav;
	}
	/*조건에 따라 매출 검색*/
	@RequestMapping("salesChartSearch.mdo")
	public ModelAndView salesChartController(Admin_salesVO vo,ModelAndView mav) {
		if(vo.getSearchType().equals("years"))mav.addObject("salesList",admin_salesService.getAdmin_salesForYears(vo));
		if(vo.getSearchType().equals("year"))mav.addObject("salesList",admin_salesService.getAdmin_salesForYear(vo));
		if(vo.getSearchType().equals("month"))mav.addObject("salesList",admin_salesService.getAdmin_salesForMonth(vo));
		if(vo.getSearchType().equals("days"))mav.addObject("salesList",admin_salesService.getAdmin_salesForDays(vo));
		mav.setViewName("admin_salesChart");
		return mav;
	}
	/*해당 일자의 매출 상세보기*/
	@RequestMapping("salesChartDetail.mdo")
	public ModelAndView salesChartDetaliController(Admin_salesVO vo,ModelAndView mav) {
		if(vo.getAdmin_sales_date() != null) {
			mav.addObject("salesList",admin_salesService.getAdmin_salesDetail(vo));
		}
		mav.setViewName("admin_salespopup");
		return mav;
	}

}
