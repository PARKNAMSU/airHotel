package kg.air.cnc.dao.mhouse;

import java.text.DateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.Host_sales_chartVO;
import kg.air.cnc.vo.HouseReservationMemberVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Repository
public class MyHouseDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	/*호스트의 숙소 리스트*/
	public List<ReservationHouseDetailVO> getHostHouseList(String id){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getMyHouse",id);
	}
	/*숙소의 예약자 리스트*/
	public List<HouseReservationMemberVO> getHouseResList(ReservationHouseDetailVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getMyHouseResList",vo);
	}
	public List<HouseReservationMemberVO> getHouseBeforeResList(ReservationHouseDetailVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getMyHouseBeforeResList",vo);
	}
	/*호스트의 매출 관련*/
	public List<Host_sales_chartVO> getAdmin_salesForYears(Host_sales_chartVO vo) {
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForYears",vo);
	}
	public List<Host_sales_chartVO> getAdmin_salesForYear(Host_sales_chartVO vo) {
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForYear",vo);
	}
	public List<Host_sales_chartVO> getAdmin_salesForMonth(Host_sales_chartVO vo) {
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForMonth",vo);
	}
	public List<Host_sales_chartVO> getAdmin_salesForDays(Host_sales_chartVO vo) {
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForDays",vo);
	}
	/*금액계산*/
	public List<Host_sales_chartVO> admin_salesSetting(List<Host_sales_chartVO> list,DateFormat format){
		int sum = 0;
		if(list.size() >0) {
			for(int i=0;i<list.size();i++) {
				if(i>0) {
					list.get(i).setHost_sales_compare_before(list.get(i).getHost_sales() - list.get(i-1).getHost_sales());
					
				}
				list.get(i).setHost_sales_date(format.format(list.get(i).getHost_sales_regdate()));
				sum += list.get(i).getHost_sales();
			}
			list.get(0).setSumSales(sum);
			for(int i=0;i<list.size();i++) {
				float per = (((float)list.get(i).getHost_sales()*100)/sum);
				list.get(i).setHost_sales_persant(per);
			}
		}
		return list;
	}
	public List<Host_sales_chartVO> eachHouse_salesSetting(List<Host_sales_chartVO> list){
		int sum = 0;
		if(list.size()>0) {
			for(int i=0;i<list.size();i++) {
				if(list.get(0).getSumSalesEachHouse().get(list.get(i).getHost_house_seq()) == null) {
					list.get(0).getHouse_seq_list().add(list.get(i).getHost_house_seq());
					list.get(0).getSumSalesEachHouse().put(list.get(i).getHost_house_seq(),list.get(i).getHost_sales());
				}else {
					int getval = list.get(0).getSumSalesEachHouse().get(list.get(i).getHost_house_seq()) + list.get(i).getHost_sales();
					list.get(0).getSumSalesEachHouse().put(list.get(i).getHost_house_seq(),getval);
				}
				sum+= list.get(i).getHost_sales();
			}
			list.get(0).getHouse_seq_list().add(-1);
			list.get(0).setSumSales(sum);
		}
		return list;
	}
 	public List<Host_sales_chartVO> getHost_salesForYearsEachHouse(Host_sales_chartVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForYearsEachHouse",vo);
	}
 	public List<Host_sales_chartVO> getHost_salesForYearEachHouse(Host_sales_chartVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForYearEachHouse",vo);
	}
 	
 	public List<Host_sales_chartVO> getHost_salesForMonthEachHouse(Host_sales_chartVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForMonthEachHouse",vo);
	}
 	
 	public List<Host_sales_chartVO> getHost_salesForDaysEachHouse(Host_sales_chartVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getSalesForDaysEachHouse",vo);
	}
 	
	public void deleteResHouse(int seq) {
		sqlSessionTemplate.update("HostHouseManageVO.deleteResHouse",seq);
	}
	public void rollbackDeleteHouse(int seq) {
		sqlSessionTemplate.update("HostHouseManageVO.RollbackDeleteHouse",seq);
	}
	public List<ReservationHouseDetailVO> getReservationListThisWeek(String id){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getReservationListThisWeek",id);
	}
}
