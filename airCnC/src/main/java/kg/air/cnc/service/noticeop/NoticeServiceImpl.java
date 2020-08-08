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

}
