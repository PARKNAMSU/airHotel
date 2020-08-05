package kg.air.cnc.dao.noticeop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.BoardVO;
@Repository
public class BoardDAOImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO) sqlSessionTemplate.selectOne("notice.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return sqlSessionTemplate.selectList("notice.getBoardList", vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		sqlSessionTemplate.insert("notice.insertBoard", vo);
	}

}
