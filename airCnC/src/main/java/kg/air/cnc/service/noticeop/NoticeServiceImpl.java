package kg.air.cnc.service.noticeop;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.noticeop.NoticeDAO;
import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PagingCriteria;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<BoardVO> selectBoardList(PagingCriteria cri) {
		return noticeDAO.selectBoardList(cri);
	}
	@Override
	public int countBoardListTotal() {
	    return noticeDAO.countBoardList();
	}
	@Override
	public int insertBoard(BoardVO vo) {
		return noticeDAO.insertNoticeBoard(vo);
	}
	@Override
	public List<BoardVO> getNoticeListAdmin(PagingCriteria cri) {
		return noticeDAO.getNoticeListAdmin(cri);
	}
	@Override
	public BoardVO detailNotice(int idx) {
		return noticeDAO.detailNotice(idx);
	}
	@Override
	public void updateNotice(BoardVO vo) {
		noticeDAO.updateNotice(vo);
	}
	@Override
	public void deleteNotice(int idx) {
		noticeDAO.deleteNotice(idx);
	}

}
