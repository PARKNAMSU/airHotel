package kg.air.cnc.service.reservation;

import java.util.List;

import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

public interface ReservationServiceImpl {
	public List<ReservationHouseDetailVO> getMyReservation(String id);
	public List<ReservationHouseDetailVO> getMyReservationBefore(String id);
	public ReservationHouseDetailVO getReservationHouse(ReservationHouseDetailVO vo);
	public void insertBlameHost(BlameVO vo);
}
