package kg.air.cnc.dao.chart;

import java.text.DateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.vo.Reservation_ChartVO;

@Repository
public class Reservation_ChartDAO implements Reservation_ChartDAOImpl{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<Reservation_ChartVO> admin_salesSetting(List<Reservation_ChartVO> list,DateFormat format){
		int sum = 0;
		if(list.size() >0) {
			for(int i=0;i<list.size();i++) {
				if(i>0) {
					list.get(i).setReschart_compare_before(list.get(i).getReschart_num() - list.get(i-1).getReschart_num());
					
				}
				list.get(i).setReschart_date(format.format(list.get(i).getReschart_regdate()));
				sum += list.get(i).getReschart_num();
			}
			list.get(0).setReschart_sum(sum);
			for(int i=0;i<list.size();i++) {
				float per = (((float)list.get(i).getReschart_num()*100)/sum);
				list.get(i).setReschart_persant(per);
			}
		}
		return list;
	}
	@Override
	public List<Reservation_ChartVO> getAdmin_ResForYears(Reservation_ChartVO vo) {
		
		return sqlSessionTemplate.selectList("ResChartDAO.getResForYears",vo);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForYear(Reservation_ChartVO vo) {
		return sqlSessionTemplate.selectList("ResChartDAO.getResForYear",vo);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForMonth(Reservation_ChartVO vo) {
		return sqlSessionTemplate.selectList("ResChartDAO.getResForMonth",vo);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForDays(Reservation_ChartVO vo) {
		return sqlSessionTemplate.selectList("ResChartDAO.getResForDays",vo);
	}

	@Override
	public List<ReservationVO> getAdmin_ResDetail(Reservation_ChartVO vo) {
		return sqlSessionTemplate.selectList("ResChartDAO.getResDetail",vo);
	}

}
