package kg.air.cnc.service.mhouse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.mhouse.MyHouseDAO;
import kg.air.cnc.vo.HostVO;
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
}
