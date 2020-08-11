package kg.air.cnc.service.eventop;

import java.util.List;

import kg.air.cnc.vo.EventVO;
import kg.air.cnc.vo.PagingCriteria;

public interface EventService {
	List<EventVO> selectEventList(PagingCriteria cri);
	int countEventListTotal();
	int insertEvent(EventVO vo);
	List<EventVO> getEventListAdmin(PagingCriteria cri);
	public EventVO detailEvent(int event_idx);
	public void updateEvent(EventVO vo);
	public void deleteEvent(int event_idx);
}
