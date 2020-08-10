package kg.air.cnc.service.eventop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.eventop.EventDAO;
import kg.air.cnc.vo.EventVO;
import kg.air.cnc.vo.PagingCriteria;
@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> selectEventList(PagingCriteria cri) {
		return eventDAO.selectEventList(cri);
	}

	@Override
	public int countEventListTotal() {
		return eventDAO.countEventList();
	}

	@Override
	public int insertEvent(EventVO vo) {
		return eventDAO.insertEventBoard(vo);
	}

	@Override
	public List<EventVO> getEventListAdmin(PagingCriteria cri) {
		return eventDAO.getEventListAdmin(cri);
	}

	@Override
	public EventVO detailEvent(int event_idx) {
		return eventDAO.detailEvent(event_idx);
	}

	@Override
	public void updateEvent(EventVO vo) {
		eventDAO.updateEvent(vo);
	}

	@Override
	public void deleteEvent(int event_idx) {
		eventDAO.deleteEvent(event_idx);
	}

}
