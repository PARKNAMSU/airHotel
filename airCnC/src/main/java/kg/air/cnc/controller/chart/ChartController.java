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
import kg.air.cnc.service.chart.HostChartService;
import kg.air.cnc.service.chart.Reservation_ChartService;
import kg.air.cnc.service.chart.Sign_upChartService;
import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.vo.Reservation_ChartVO;
import kg.air.cnc.vo.Sign_upChartVO;

@Controller
public class ChartController {
	@Autowired
	private Admin_salesService admin_salesService;
	@Autowired
	private Sign_upChartService sign_upChartService;
	@Autowired
	private HostChartService hostChartService;
	@Autowired
	private Reservation_ChartService reservation_ChartService;
	/*���� ��Ʈ*/
	
	/*ó�� ������������ �̵�*/
	@RequestMapping("salesChart.mdo")
	public ModelAndView salesChartController(ModelAndView mav) {
		mav.setViewName("admin_salesChart");
		return mav;
	}
	/*���ǿ� ���� ���� �˻�*/
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
	/*�ش� ������ ���� �󼼺���*/
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
	
	/*ȸ������ ��Ʈ*/
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
	/*ȣ��Ʈ ��û ��Ʈ*/
	@RequestMapping("hostChart.mdo")
	public ModelAndView hostChartController(ModelAndView mav) {
		mav.setViewName("admin_hostChart");
		return mav;
	}
	@RequestMapping("hostChartSearch.mdo")
	public ModelAndView hostChartController(Host_ChartVO vo,ModelAndView mav) {
		System.out.println(vo.getSearchConditionFirst());
		System.out.println(vo.getSearchType());
		List<Host_ChartVO> list = null;
		if(vo.getSearchType().equals("years"))list = hostChartService.getAdmin_HostForYears(vo);
		if(vo.getSearchType().equals("year"))list = hostChartService.getAdmin_HostForYear(vo);
		if(vo.getSearchType().equals("month"))list = hostChartService.getAdmin_HostForMonth(vo);
		if(vo.getSearchType().equals("days"))list = hostChartService.getAdmin_HostForDays(vo);
		if(list != null) {
			mav.addObject("hostList",list);
			mav.setViewName("admin_hostChart");
		}else {
			mav.setViewName("redirect:hostChart.mdo");
		}
		return mav;
	}
	@RequestMapping("hostChartDetail.mdo")
	public ModelAndView hostChartDetaliController(Host_ChartVO vo,ModelAndView mav) {
		if(vo.getHostchart_date() != null) {
			List<HostVO> list = hostChartService.getAdmin_HostDetail(vo);
			if(list.size() >0) {
				mav.addObject("hostList",list);
			}
		}
		mav.setViewName("admin_hostChartpopup");
		return mav;
	}
	@RequestMapping("resChart.mdo")
	public ModelAndView resChartController(ModelAndView mav) {
		mav.setViewName("admin_resChart");
		return mav;
	}
	@RequestMapping("resChartSearch.mdo")
	public ModelAndView resChartController(Reservation_ChartVO vo,ModelAndView mav) {
		System.out.println(vo.getSearchConditionFirst());
		System.out.println(vo.getSearchType());
		List<Reservation_ChartVO> list = null;
		if(vo.getSearchType().equals("years"))list = reservation_ChartService.getAdmin_ResForYears(vo);
		if(vo.getSearchType().equals("year"))list = reservation_ChartService.getAdmin_ResForYear(vo);
		if(vo.getSearchType().equals("month"))list = reservation_ChartService.getAdmin_ResForMonth(vo);
		if(vo.getSearchType().equals("days"))list = reservation_ChartService.getAdmin_ResForDays(vo);
		if(list != null) {
			mav.addObject("resList",list);
			mav.setViewName("admin_resChart");
		}else {
			mav.setViewName("redirect:resChart.mdo");
		}
		System.out.println(list.size());
		return mav;
	}
	@RequestMapping("resChartDetail.mdo")
	public ModelAndView resChartDetaliController(Reservation_ChartVO vo,ModelAndView mav) {
		if(vo.getReschart_date() != null) {
			List<ReservationVO> list = reservation_ChartService.getAdmin_ResDetail(vo);
			if(list.size() >0) {
				mav.addObject("resList",list);
			}
		}
		mav.setViewName("admin_resChartpopup");
		return mav;
	}

}
