package kg.air.cnc.dao.housemap;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface HouseMapDAO {
	public List<HouseVO> getHouseList();
	public HouseVO getHouse(HouseVO vo);
}
