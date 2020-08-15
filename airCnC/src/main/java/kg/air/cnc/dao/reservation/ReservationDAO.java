package kg.air.cnc.dao.reservation;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CustomerVO;
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

	@Override
	public void insertBlameHost(BlameVO vo) {
		sqlSessionTemplate.insert("ReservationDAO.InsertBlameHost",vo);
		
	}

	@Override
	public void rollbackReservationCancel(ReservationHouseDetailVO vo) {
		sqlSessionTemplate.update("ReservationDAO.rollbackReservationCancel",vo);
	}

	@Override
	public void cancelReservation(ReservationHouseDetailVO vo) {
		sqlSessionTemplate.update("ReservationDAO.cancelReservation",vo);
		
	}

	@Override
	public String getFavoriteHouse(String id) {
		
		return sqlSessionTemplate.selectOne("ReservationDAO.getFavoriteHouse",id);
	}

	@Override
	public void addFavoriteHouse(CustomerVO vo) {
		sqlSessionTemplate.update("ReservationDAO.addFavoriteHouse",vo);
	}

	@Override
	public void removeFavoriteHouse(CustomerVO vo) {
		sqlSessionTemplate.update("ReservationDAO.removeFavoriteHouse",vo);
	}

	@Override
	public List<ReservationHouseDetailVO> getResForSpecHouse(int house_seq) {	
		return sqlSessionTemplate.selectList("ReservationDAO.getResForSpecHouse",house_seq);
	}
	public List<ReservationHouseDetailVO> getFavoriteHouse(Map<String, Object> seqMap){
		return sqlSessionTemplate.selectList("ReservationDAO.getMyFavoriteHouse",seqMap);
	}
	public ReservationHouseDetailVO getHousePhoto(int house_seq) {
		return sqlSessionTemplate.selectOne("ReservationDAO.getHousePhoto",house_seq);
	}
}
