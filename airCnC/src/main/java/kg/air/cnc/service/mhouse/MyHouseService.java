package kg.air.cnc.service.mhouse;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.mhouse.MyHouseDAO;
import kg.air.cnc.vo.Admin_salesVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_sales_chartVO;
import kg.air.cnc.vo.HouseReservationMemberVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Service
public class MyHouseService {
	
	@Autowired
	private MyHouseDAO myHouseDAO;
	
	public List<ReservationHouseDetailVO> getHostHouseList(String id){
		List<ReservationHouseDetailVO> list = myHouseDAO.getHostHouseList(id);
		String name = "";
		for(int i=0;i<list.size();i++) {
			name = list.get(i).getHouse_name();
			if(name.length() >10)name = name.substring(0,8)+"...";
			list.get(i).setHouse_name(name);
			if(list.get(i).getHouse_status() == 0) {
				list.get(i).setHouse_status_text("이용가능");
			}
			if(list.get(i).getHouse_status() == 1) {
				list.get(i).setHouse_status_text("정지");
			}
			if(list.get(i).getHouse_status() == 2) {
				list.get(i).setHouse_status_text("삭제대기");
			}
			if(list.get(i).getHouse_status() == 3) {
				list.get(i).setHouse_status_text("등록대기");
			}
		}
		return list;
	}
	public List<HouseReservationMemberVO> getHouseResList(ReservationHouseDetailVO vo){
		List<HouseReservationMemberVO> list = myHouseDAO.getHouseResList(vo);

		return list;
	}
	public List<HouseReservationMemberVO> getHouseBeforeResList(ReservationHouseDetailVO vo){
		List<HouseReservationMemberVO> list = myHouseDAO.getHouseBeforeResList(vo);
		return list;
	}
	public List<Host_sales_chartVO> getAdmin_salesForYears(Host_sales_chartVO vo) {
		List<Host_sales_chartVO> list = myHouseDAO.getAdmin_salesForYears(vo);
		DateFormat format = new SimpleDateFormat("YYYY년");
		return myHouseDAO.admin_salesSetting(list, format);
	}
	public List<Host_sales_chartVO> getAdmin_salesForYear(Host_sales_chartVO vo) {
		List<Host_sales_chartVO> list = myHouseDAO.getAdmin_salesForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		return myHouseDAO.admin_salesSetting(list, format);
	}
	public List<Host_sales_chartVO> getAdmin_salesForMonth(Host_sales_chartVO vo) {
		List<Host_sales_chartVO> list = myHouseDAO.getAdmin_salesForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return myHouseDAO.admin_salesSetting(list, format);
	}
	public List<Host_sales_chartVO> getAdmin_salesForDays(Host_sales_chartVO vo) {
		List<Host_sales_chartVO> list = myHouseDAO.getAdmin_salesForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return myHouseDAO.admin_salesSetting(list, format);
	}
	public List<Host_sales_chartVO> getHost_salesForYearsEachHouse(Host_sales_chartVO vo){
		List<Host_sales_chartVO> list = myHouseDAO.getHost_salesForYearsEachHouse(vo);
		return myHouseDAO.eachHouse_salesSetting(list);
	}
	public List<Host_sales_chartVO> getHost_salesForYearEachHouse(Host_sales_chartVO vo){
		List<Host_sales_chartVO> list = myHouseDAO.getHost_salesForYearEachHouse(vo);
		return myHouseDAO.eachHouse_salesSetting(list);
	}
	public List<Host_sales_chartVO> getHost_salesForMonthEachHouse(Host_sales_chartVO vo){
		List<Host_sales_chartVO> list = myHouseDAO.getHost_salesForMonthEachHouse(vo);
		return myHouseDAO.eachHouse_salesSetting(list);
	}
	public List<Host_sales_chartVO> getHost_salesForDaysEachHouse(Host_sales_chartVO vo){
		List<Host_sales_chartVO> list = myHouseDAO.getHost_salesForDaysEachHouse(vo);
		System.out.println(list.size());
		return myHouseDAO.eachHouse_salesSetting(list);
	}
	public void deleteResHouse(int seq) {
		myHouseDAO.deleteResHouse(seq);
	}
	public void rollbackDeleteHouse(int seq) {
		myHouseDAO.rollbackDeleteHouse(seq);
	}
	public List<ReservationHouseDetailVO> getReservationListThisWeek(String id){
		List<ReservationHouseDetailVO> resList = myHouseDAO.getReservationListThisWeek(id);
		for(ReservationHouseDetailVO vo:resList) {
			String name = vo.getHouse_name();
			if(name.length() >8) {
				vo.setHouse_name(name.substring(0,6)+"...");
			}
		}
		return resList;
	}
}
