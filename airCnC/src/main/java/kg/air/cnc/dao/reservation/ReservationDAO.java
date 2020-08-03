package kg.air.cnc.dao.reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Repository
public class ReservationDAO implements ReservationDAOImpl{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReservationHouseDetailVO> getMyReservation(String id) {
		
		return sqlSessionTemplate.selectList("ReservationDAO.getMyReservaiton", id);
	}

	@Override
	public List<ReservationHouseDetailVO> getMyReservationBefore(String id) {
		
		return sqlSessionTemplate.selectList("ReservationDAO.getMyReservationBefore", id);
	}

	@Override
	public ReservationHouseDetailVO getReservationHouse(ReservationHouseDetailVO vo) {
		return sqlSessionTemplate.selectOne("ReservationDAO.getMyReservationHouse", vo);
	}
	
}
