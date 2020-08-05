package kg.air.cnc.service.chart;

import java.util.List;

import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.vo.Reservation_ChartVO;

public interface Reservation_ChartServiceImpl {
	public List<Reservation_ChartVO> getAdmin_ResForYears(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForYear(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForMonth(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForDays(Reservation_ChartVO vo);
	public List<ReservationVO> getAdmin_ResDetail(Reservation_ChartVO vo);
}
