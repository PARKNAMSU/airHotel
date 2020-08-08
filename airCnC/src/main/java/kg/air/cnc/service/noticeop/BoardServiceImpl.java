package kg.air.cnc.service.noticeop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.noticeop.BoardDao;
import kg.air.cnc.vo.BoardVO;
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDAO;
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

}
