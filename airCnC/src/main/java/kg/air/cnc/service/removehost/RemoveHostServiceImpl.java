package kg.air.cnc.service.removehost;

import java.util.List;

import kg.air.cnc.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kg.air.cnc.vo.ReservationVO;
import kg.air.cnc.dao.removehost.RemoveHostDAOImpl;
import kg.air.cnc.vo.HostVO;

@Service
public class RemoveHostServiceImpl implements RemoveHostService {

	@Autowired
	private RemoveHostDAOImpl removeHostDAO;

	@Override
	public List<HostVO> getRemoveHostList() {
		return removeHostDAO.getRemoveHostList();
	}

	@Override
	public List<ReservationVO> checkReservation(HostVO vo) {
		//System.out.println("RemoveHostServiceImpl(vo.host_id) = "+vo.getHost_id());
		List<ReservationVO> list = removeHostDAO.checkReservation(vo);
		return list;
	}

	@Override
	public void sendMessage(List<ReservationVO> vo) {
		removeHostDAO.sendMessage(vo);
	}

	@Override
	public void refund(List<ReservationVO> vo) {
		removeHostDAO.refund(vo);
	}
	
	@Override
	public void sendMessageHost(HostVO vo) {
		removeHostDAO.sendMessageHost(vo);
	}
	
	@Override
	public void deleteReservation(List<ReservationVO> vo) {
		removeHostDAO.deleteReservation(vo);
	}
	
	@Override
	public void deleteHost(HostVO vo) {
		List<ReservationVO> reservation = checkReservation(vo);
		sendMessage(reservation);
		refund(reservation);
		deleteReservation(reservation);
		sendMessageHost(vo);
		removeHostDAO.deleteHost(vo);
		return;
	}


}
