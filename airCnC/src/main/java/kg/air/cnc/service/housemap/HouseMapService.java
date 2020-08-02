package kg.air.cnc.service.housemap;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface HouseMapService {
	public List<HouseVO> getHouseList();
	public HouseVO getHouse(HouseVO vo);
}
