package kg.air.cnc.dao.reservation;

import java.util.List;

import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

public interface ReservationDAOImpl {
	public List<ReservationHouseDetailVO> getMyReservation(String id);
	public List<ReservationHouseDetailVO> getMyReservationBefore(String id);
	public ReservationHouseDetailVO getReservationHouse(ReservationHouseDetailVO vo);
}
