package kg.air.cnc.service.reservation;

import java.util.List;

import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

public interface ReservationServiceImpl {
	public List<ReservationHouseDetailVO> getMyReservation(String id);
	public List<ReservationHouseDetailVO> getMyReservationBefore(String id);
	public ReservationHouseDetailVO getReservationHouse(ReservationHouseDetailVO vo);
	public void insertBlameHost(BlameVO vo);
	public void rollbackReservationCancel(ReservationHouseDetailVO vo);
	public void cancelReservation(ReservationHouseDetailVO vo);
	public String getFavoriteHouse(String id,int house_seq);
	public void addFavoriteHouse(CustomerVO vo);
	public void removeFavoriteHouse(String id,String favorite,int house_seq);
	public String getFavoriteHouseNumber(String id);
}
