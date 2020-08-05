package kg.air.cnc.service.chart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.chart.Sign_upChartDAO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.Sign_upChartVO;

@Service
public class Sign_upChartService implements Sign_upChartServiceImpl{
	
	@Autowired
	private Sign_upChartDAO sign_upChartDAO;

	@Override
	public List<Sign_upChartVO> getAdmin_signupForYears(Sign_upChartVO vo) {
		List<Sign_upChartVO> list = sign_upChartDAO.getAdmin_signupForYears(vo);
		DateFormat format = new SimpleDateFormat("YYYY년");
		return sign_upChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForYear(Sign_upChartVO vo) {
		List<Sign_upChartVO> list = sign_upChartDAO.getAdmin_signupForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		return sign_upChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForMonth(Sign_upChartVO vo) {
		List<Sign_upChartVO> list = sign_upChartDAO.getAdmin_signupForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return sign_upChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForDays(Sign_upChartVO vo) {
		List<Sign_upChartVO> list = sign_upChartDAO.getAdmin_signupForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return sign_upChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<CustomerVO> getAdmin_signupDetail(Sign_upChartVO vo) {
		List<CustomerVO> list = sign_upChartDAO.getAdmin_signupDetail(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		for(int i=0;i<list.size();i++) {
			list.get(i).setCustomer_image(format.format(list.get(i).getCustomer_regdate()));
		}
		return list;
	}

}
