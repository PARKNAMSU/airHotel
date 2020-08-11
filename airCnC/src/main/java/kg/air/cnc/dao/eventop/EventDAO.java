package kg.air.cnc.dao.eventop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.EventVO;
import kg.air.cnc.vo.PagingCriteria;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<EventVO> selectEventList(PagingCriteria cri) {
		System.out.println("===> Mybatis로 selectEventList() 기능 처리");
		return mybatis.selectList("eventMapper.selectEventList",cri);
	}

	public int countEventList(){
		System.out.println("===> Mybatis로 countEventList() 기능 처리");
	    return mybatis.selectOne("eventMapper.countEventList");
	}
	
	public int insertEventBoard(EventVO vo) {
		System.out.println("===> Mybatis로 insertEventBoard() 기능 처리");
		return mybatis.insert("eventMapper.insertEvent", vo);
	}
	
	public List<EventVO> getEventListAdmin(PagingCriteria cri) {
		System.out.println("===> Mybatis로 getEventListAdmin() 기능 처리");
		return mybatis.selectList("eventMapper.getEventListAdmin",cri);
	}
	
	public EventVO detailEvent(int event_idx) {
		System.out.println("===> Mybatis로 detailEvent() 기능 처리");
		return mybatis.selectOne("eventMapper.detailEvent", event_idx);
	}
	
	public void updateEvent(EventVO vo) {
		System.out.println("===> Mybatis로 updateEvent() 기능 처리");
		mybatis.update("eventMapper.updateEvent", vo);
	}
	
	public void deleteEvent(int event_idx) {
		System.out.println("===> Mybatis로 deleteEvent() 기능 처리");
		mybatis.update("eventMapper.deleteEvent", event_idx);
	}
}
