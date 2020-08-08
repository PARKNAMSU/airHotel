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
	
	public int insertNoticeBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 insertNoticeBoard() 기능 처리");
		return mybatis.insert("noticeMapper.insertBoard", vo);
	}
	
	public List<BoardVO> getNoticeListAdmin(PagingCriteria cri) {
		System.out.println("===> Mybatis로 getNoticeListAdmin() 기능 처리");
		return mybatis.selectList("noticeMapper.getNoticeListAdmin",cri);
	}
	
	public BoardVO detailNotice(int idx) {
		System.out.println("===> Mybatis로 detailNotice() 기능 처리");
		return mybatis.selectOne("noticeMapper.detailNotice", idx);
	}
	
	public void updateNotice(BoardVO vo) {
		System.out.println("===> Mybatis로 updateNotice() 기능 처리");
		mybatis.update("noticeMapper.updateNotice", vo);
	}
	
	public void deleteNotice(int idx) {
		System.out.println("===> Mybatis로 deleteNotice() 기능 처리");
		mybatis.update("noticeMapper.deleteNotice", idx);
	}
}	
