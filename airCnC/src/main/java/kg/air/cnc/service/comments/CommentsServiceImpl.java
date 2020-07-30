package kg.air.cnc.service.comments;

import java.util.List;

import kg.air.cnc.vo.CommentsVO;

public interface CommentsServiceImpl {
	public void insertComments(CommentsVO vo);
	public List<CommentsVO> getComments(CommentsVO vo);
	public void deleteComments(CommentsVO vo);
}
