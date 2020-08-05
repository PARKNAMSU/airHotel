package kg.air.cnc.dao.chart;

import java.text.DateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.Sign_upChartVO;

@Repository
public class HostChartDAO implements HostChartDAOImpl{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<Host_ChartVO> admin_salesSetting(List<Host_ChartVO> list,DateFormat format){
		int sum = 0;
		if(list.size() >0) {
			for(int i=0;i<list.size();i++) {
				if(i>0) {
					list.get(i).setHostchart_compare_before(list.get(i).getHostchart_num() - list.get(i-1).getHostchart_num());
					
				}
				list.get(i).setHostchart_date(format.format(list.get(i).getHostchart_regdate()));
				sum += list.get(i).getHostchart_num();
			}
			list.get(0).setHostchart_sum(sum);
			for(int i=0;i<list.size();i++) {
				float per = (((float)list.get(i).getHostchart_num()*100)/sum);
				list.get(i).setHostchart_persant(per);
			}
		}
		return list;
	}
	@Override
	public List<Host_ChartVO> getAdmin_hostForYears(Host_ChartVO vo) {

		return sqlSessionTemplate.selectList("HostChartDAO.getHostForYears",vo);
	}

	@Override
	public List<Host_ChartVO> getAdmin_hostForYear(Host_ChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("HostChartDAO.getHostForYear",vo);
	}

	@Override
	public List<Host_ChartVO> getAdmin_hostForMonth(Host_ChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("HostChartDAO.getHostForMonth",vo);
	}

	@Override
	public List<Host_ChartVO> getAdmin_hostForDays(Host_ChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("HostChartDAO.getHostForDays",vo);
	}

	@Override
	public List<HostVO> getAdmin_hostDetail(Host_ChartVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("HostChartDAO.getHostDetail",vo);
	}

}
