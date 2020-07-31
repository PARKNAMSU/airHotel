package kg.air.cnc.service.comments;

import java.util.List;

import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.HouseVO;

public interface CommentsServiceImpl {
	public void insertComments(CommentsVO vo);
	public List<CommentsVO> getComments(HouseVO vo);
	public void deleteComments(CommentsVO vo);
	public void updateComments(CommentsVO vo);
}
