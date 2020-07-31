package kg.air.cnc.controller.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.dao.chart.Sign_upChartDAO;
import kg.air.cnc.service.chart.Admin_salesService;
import kg.air.cnc.service.chart.Sign_upChartService;
import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.Sign_upChartVO;

@Controller
public class ChartController {
	@Autowired
	private Admin_salesService admin_salesService;
	@Autowired
	private Sign_upChartService sign_upChartService;
	
	/*매출 차트*/
	
	/*처음 매출페이지로 이동*/
	@RequestMapping("salesChart.mdo")
	public ModelAndView salesChartController(ModelAndView mav) {
		mav.setViewName("admin_salesChart");
		return mav;
	}
	/*조건에 따라 매출 검색*/
	@RequestMapping("salesChartSearch.mdo")
	public ModelAndView salesChartController(Admin_salesVO vo,ModelAndView mav) {
		List<Admin_salesVO> list = null;
		if(vo.getSearchType().equals("years"))list = admin_salesService.getAdmin_salesForYears(vo);
		if(vo.getSearchType().equals("year"))list = admin_salesService.getAdmin_salesForYear(vo);
		if(vo.getSearchType().equals("month"))list = admin_salesService.getAdmin_salesForMonth(vo);
		if(vo.getSearchType().equals("days"))list = admin_salesService.getAdmin_salesForDays(vo);
		if(list != null) {
			mav.addObject("salesList",list);
			mav.setViewName("admin_salesChart");
		}else {
			mav.setViewName("redirect:salesChart.mdo");
		}
		return mav;
	}
	/*해당 일자의 매출 상세보기*/
	@RequestMapping("salesChartDetail.mdo")
	public ModelAndView salesChartDetaliController(Admin_salesVO vo,ModelAndView mav) {
		if(vo.getAdmin_sales_date() != null) {
			System.out.println(vo.getAdmin_sales_date());
			List<Admin_salesVO> list = admin_salesService.getAdmin_salesDetail(vo);
			if(list.size()>0) {
				mav.addObject("salesList",list);
			}
		}
		mav.setViewName("admin_salespopup");
		return mav;
	}
	
	/*회원가입 차트*/
	@RequestMapping("signupChart.mdo")
	public ModelAndView sign_upChartController(ModelAndView mav) {
		mav.setViewName("admin_signupChart");
		return mav;
	}
	@RequestMapping("signupChartSearch.mdo")
	public ModelAndView sign_upChartController(Sign_upChartVO vo,ModelAndView mav) {
		System.out.println(vo.getSearchConditionFirst());
		System.out.println(vo.getSearchType());
		List<Sign_upChartVO> list = null;
		if(vo.getSearchType().equals("years"))list = sign_upChartService.getAdmin_signupForYears(vo);
		if(vo.getSearchType().equals("year"))list = sign_upChartService.getAdmin_signupForYear(vo);
		if(vo.getSearchType().equals("month"))list = sign_upChartService.getAdmin_signupForMonth(vo);
		if(vo.getSearchType().equals("days"))list = sign_upChartService.getAdmin_signupForDays(vo);
		if(list != null) {
			mav.addObject("sign_upList",list);
			mav.setViewName("admin_signupChart");
		}else {
			mav.setViewName("redirect:signupChart.mdo");
		}
		return mav;
	}
	@RequestMapping("signupChartDetail.mdo")
	public ModelAndView signupChartDetaliController(Sign_upChartVO vo,ModelAndView mav) {
		if(vo.getSignupchart_date() != null) {
			List<CustomerVO> list = sign_upChartService.getAdmin_signupDetail(vo);
			if(list.size() >0) {
				mav.addObject("signupList",list);
			}
		}
		mav.setViewName("admin_signupChartpopup");
		return mav;
	}

}
