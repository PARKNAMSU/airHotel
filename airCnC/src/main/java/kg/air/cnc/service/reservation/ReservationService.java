package kg.air.cnc.service.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.reservation.ReservationDAO;
import kg.air.cnc.vo.HouseVO;

@Service
public class ReservationService implements ReservationServiceImpl {

	@Autowired
	ReservationDAO reservationDAO;
	
	@Override
	public List<HouseVO> getMyReservation(String id) {
		List<HouseVO> list = reservationDAO.getMyReservation(id);
		String name = "";
		for(int i=0;i<list.size();i++) {
			name = list.get(i).getHouse_name();
			if(name.length() >10)name = name.substring(0,8)+"...";
			list.get(i).setHouse_name(name);
		}
		return list;
	}

	@Override
	public List<HouseVO> getMyReservationBefore(String id) {
		List<HouseVO> list = reservationDAO.getMyReservationBefore(id);
		String name = "";
		for(int i=0;i<list.size();i++) {
			name = list.get(i).getHouse_name();
			if(name.length() >10)name = name.substring(0,8)+"...";
			list.get(i).setHouse_name(name);
		}
		return list;
	}

}
