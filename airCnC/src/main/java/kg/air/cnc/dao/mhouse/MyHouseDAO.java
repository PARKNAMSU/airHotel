package kg.air.cnc.dao.mhouse;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.HouseReservationMemberVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Repository
public class MyHouseDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReservationHouseDetailVO> getHostHouseList(String id){
		
		return sqlSessionTemplate.selectList("HostHouseManageVO.getMyHouse",id);
	}
	public List<HouseReservationMemberVO> getHouseResList(ReservationHouseDetailVO vo){
		return sqlSessionTemplate.selectList("HostHouseManageVO.getMyHouseResList",vo);
	}
}
