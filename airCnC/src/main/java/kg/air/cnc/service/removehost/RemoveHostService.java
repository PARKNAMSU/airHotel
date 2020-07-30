package kg.air.cnc.service.removehost;

import java.util.List;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.ReservationVO;

public interface RemoveHostService {
	public List<HostVO> getRemoveHostList();
	public void deleteHost(HostVO vo);
	public List<ReservationVO> checkReservation(HostVO vo);
	public void sendMessage(List<ReservationVO> vo);
	public void refund(List<ReservationVO> vo);
}
