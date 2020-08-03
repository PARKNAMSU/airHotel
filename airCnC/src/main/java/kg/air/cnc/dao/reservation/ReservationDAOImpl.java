package kg.air.cnc.dao.reservation;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface ReservationDAOImpl {
	public List<HouseVO> getMyReservation(String id);
	public List<HouseVO> getMyReservationBefore(String id);
}
