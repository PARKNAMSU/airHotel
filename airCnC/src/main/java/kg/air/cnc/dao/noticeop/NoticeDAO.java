package kg.air.cnc.dao.noticeop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PagingCriteria;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> selectBoardList(PagingCriteria cri) {
		System.out.println("===> Mybatis로 selectBoardList() 기능 처리");
		return mybatis.selectList("noticeMapper.selectBoardList",cri);
	}

	public int countBoardList(){
		System.out.println("===> Mybatis로 countBoardList() 기능 처리");
	    return mybatis.selectOne("noticeMapper.countBoardList");
	}


}	
