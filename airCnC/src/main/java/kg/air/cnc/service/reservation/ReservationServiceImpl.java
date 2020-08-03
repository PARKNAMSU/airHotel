package kg.air.cnc.service.reservation;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface ReservationServiceImpl {
	public List<HouseVO> getMyReservation(String id);
	public List<HouseVO> getMyReservationBefore(String id);
}
