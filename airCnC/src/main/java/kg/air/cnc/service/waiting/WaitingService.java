package kg.air.cnc.service.waiting;

import java.util.List;

import kg.air.cnc.vo.HouseVO;


public interface WaitingService {
	public HouseVO getHouse(HouseVO vo);
	public List<HouseVO> getWaitingList(HouseVO vo);
}
