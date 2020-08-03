package kg.air.cnc.dao.reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HouseVO;

@Repository
public class ReservationDAO implements ReservationDAOImpl{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<HouseVO> getMyReservation(String id) {
		
		return sqlSessionTemplate.selectList("ReservationDAO.getMyReservaiton", id);
	}

	@Override
	public List<HouseVO> getMyReservationBefore(String id) {
		
		return sqlSessionTemplate.selectList("ReservationDAO.getMyReservationBefore", id);
	}
	
}
