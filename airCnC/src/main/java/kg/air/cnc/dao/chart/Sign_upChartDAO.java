package kg.air.cnc.dao.chart;

import java.text.DateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.Sign_upChartVO;

@Repository
public class Sign_upChartDAO implements Sign_upChartDAOImpl{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Sign_upChartVO> admin_salesSetting(List<Sign_upChartVO> list,DateFormat format){
		int sum = 0;
		System.out.println(list.size());
		for(int i=0;i<list.size();i++) {
			if(i>0) {
				list.get(i).setSignupchart_compare_before(list.get(i).getSignupchart_num() - list.get(i-1).getSignupchart_num());
				
			}
			list.get(i).setSignupchart_date(format.format(list.get(i).getSignupchart_regdate()));
			sum += list.get(i).getSignupchart_num();
		}
		list.get(0).setSignupchart_sum(sum);
		for(int i=0;i<list.size();i++) {
			float per = (((float)list.get(i).getSignupchart_num()*100)/sum);
			list.get(i).setSignupchart_persant(per);
			System.out.println(per);
		}
		return list;
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForYears(Sign_upChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Admin_signupChartDAO.getSignupForYears",vo);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForYear(Sign_upChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Admin_signupChartDAO.getSignupForYear",vo);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForMonth(Sign_upChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Admin_signupChartDAO.getSignupForMonth",vo);
	}

	@Override
	public List<Sign_upChartVO> getAdmin_signupForDays(Sign_upChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Admin_signupChartDAO.getSignupForDays",vo);
	}

	@Override
	public List<CustomerVO> getAdmin_signupDetail(Sign_upChartVO vo) {
		return sqlSessionTemplate.selectList("Admin_signupChartDAO.getSignupDetail",vo);
	}


}
