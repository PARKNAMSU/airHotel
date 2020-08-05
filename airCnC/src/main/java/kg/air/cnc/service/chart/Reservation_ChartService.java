package kg.air.cnc.service.chart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.chart.Reservation_ChartDAO;
import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.vo.Reservation_ChartVO;

@Service
public class Reservation_ChartService implements Reservation_ChartServiceImpl {
	@Autowired
	Reservation_ChartDAO reservation_ChartDAO;
	@Override
	public List<Reservation_ChartVO> getAdmin_ResForYears(Reservation_ChartVO vo) {
		List<Reservation_ChartVO> list = reservation_ChartDAO.getAdmin_ResForYears(vo);
		DateFormat format = new SimpleDateFormat("YYYY년");
		return reservation_ChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForYear(Reservation_ChartVO vo) {
		List<Reservation_ChartVO> list = reservation_ChartDAO.getAdmin_ResForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		return reservation_ChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForMonth(Reservation_ChartVO vo) {
		List<Reservation_ChartVO> list = reservation_ChartDAO.getAdmin_ResForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return reservation_ChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Reservation_ChartVO> getAdmin_ResForDays(Reservation_ChartVO vo) {
		List<Reservation_ChartVO> list = reservation_ChartDAO.getAdmin_ResForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return reservation_ChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<ReservationVO> getAdmin_ResDetail(Reservation_ChartVO vo) {
		// TODO Auto-generated method stub
		return reservation_ChartDAO.getAdmin_ResDetail(vo);
	}

}
