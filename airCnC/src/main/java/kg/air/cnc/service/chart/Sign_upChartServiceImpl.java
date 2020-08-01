package kg.air.cnc.service.chart;

import java.util.List;

import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.Sign_upChartVO;

public interface Sign_upChartServiceImpl {
	public List<Sign_upChartVO> getAdmin_signupForYears(Sign_upChartVO vo);
	public List<Sign_upChartVO> getAdmin_signupForYear(Sign_upChartVO vo);
	public List<Sign_upChartVO> getAdmin_signupForMonth(Sign_upChartVO vo);
	public List<Sign_upChartVO> getAdmin_signupForDays(Sign_upChartVO vo);
	public List<CustomerVO> getAdmin_signupDetail(Sign_upChartVO vo);
}
