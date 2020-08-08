package kg.air.cnc.service.noticeop;

import java.util.List;

import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PagingCriteria;

public interface NoticeService {
	
	List<BoardVO> selectBoardList(PagingCriteria cri);
	int countBoardListTotal();
}
