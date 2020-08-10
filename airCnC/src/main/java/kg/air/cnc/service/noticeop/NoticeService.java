package kg.air.cnc.service.noticeop;

import java.util.List;

import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PagingCriteria;

public interface NoticeService {
	
	List<BoardVO> selectBoardList(PagingCriteria cri);
	int countBoardListTotal();
	int insertBoard(BoardVO vo);
	List<BoardVO> getNoticeListAdmin(PagingCriteria cri);
	public BoardVO detailNotice(int idx);
	public void updateNotice(BoardVO vo);
	public void deleteNotice(int idx);
}
