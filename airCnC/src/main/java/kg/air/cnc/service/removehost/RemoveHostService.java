package kg.air.cnc.service.removehost;

import java.util.List;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.PagingVO;
import kg.air.cnc.vo.ReservationVO;

public interface RemoveHostService {
	public List<HostVO> getRemoveHostList(PagingVO page);
	public void deleteHost(HostVO vo);
	public List<ReservationVO> checkReservation(HostVO vo);
	public void sendMessage(List<ReservationVO> vo);
	public void refund(List<ReservationVO> vo);
	public void sendMessageHost(HostVO vo);
	public void deleteReservation(List<ReservationVO> vo);
}
