package kg.air.cnc.service.noticeop;

import java.util.List;

import kg.air.cnc.vo.BoardVO;

public interface BoardService {
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	void insertBoard(BoardVO vo);
}
