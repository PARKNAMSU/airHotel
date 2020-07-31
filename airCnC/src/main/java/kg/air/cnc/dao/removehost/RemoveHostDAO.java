package kg.air.cnc.dao.removehost;

import java.util.List;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.ReservationVO;

public interface RemoveHostDAO {
	public List<HostVO> getRemoveHostList();
	public void deleteHost(HostVO vo);
	public List<ReservationVO> checkReservation(HostVO vo);
	public void sendMessage(List<ReservationVO> vo);
	public void refund(List<ReservationVO> vo);
	public void sendMessageHost(HostVO vo);
	public void deleteReservation(List<ReservationVO> vo);
}
