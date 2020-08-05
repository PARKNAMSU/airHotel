package kg.air.cnc.dao.chart;

import java.util.List;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.vo.Reservation_ChartVO;

public interface Reservation_ChartDAOImpl {
	public List<Reservation_ChartVO> getAdmin_ResForYears(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForYear(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForMonth(Reservation_ChartVO vo);
	public List<Reservation_ChartVO> getAdmin_ResForDays(Reservation_ChartVO vo);
	public List<ReservationVO> getAdmin_ResDetail(Reservation_ChartVO vo);
}
