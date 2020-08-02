package kg.air.cnc.dao.comments;

import java.util.List;

import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.HouseVO;

public interface CommentsDAOImpl {
	
	public void insertComments(CommentsVO vo);
	public List<CommentsVO> getComments(HouseVO vo);
	public void deleteComments(CommentsVO vo);
	public void updateComments(CommentsVO vo);

	
}
