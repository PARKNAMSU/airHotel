package kg.air.cnc.dao.noticeop;

import java.util.List;

import kg.air.cnc.vo.BoardVO;

public interface BoardDao {
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	void insertBoard(BoardVO vo);
}
