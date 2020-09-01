package kg.air.cnc.dao.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.MyCommentsVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Repository
public class CommentsDAO implements CommentsDAOImpl{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Override
	public void insertComments(CommentsVO vo) {
		sqlSessionTemplate.insert("CommentsDAO.insertComments",vo);
	}
	@Override
	public List<CommentsVO> getComments(ReservationHouseDetailVO vo) {
		return sqlSessionTemplate.selectList("CommentsDAO.getComments",vo);
	}

	@Override
	public void deleteComments(CommentsVO vo) {
		sqlSessionTemplate.delete("CommentsDAO.deleteComments",vo);
		
	}
	@Override
	public void updateComments(CommentsVO vo) {
		sqlSessionTemplate.update("CommentsDAO.updateComments",vo);
		
	}
	public List<MyCommentsVO> getCommentsForMe(String id){
		return sqlSessionTemplate.selectList("CommentsDAO.getCommentsForMe",id);
	}
	public List<MyCommentsVO> getMyComments(String id){
		return sqlSessionTemplate.selectList("CommentsDAO.getMyComments",id);
	}


}
