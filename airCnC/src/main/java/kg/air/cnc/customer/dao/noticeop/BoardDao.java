package kg.air.cnc.customer.dao.noticeop;

import java.util.List;

import kg.air.cnc.customer.vo.noticeop.BoardVO;

public interface BoardDao {
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	void insertBoard(BoardVO vo);
}
