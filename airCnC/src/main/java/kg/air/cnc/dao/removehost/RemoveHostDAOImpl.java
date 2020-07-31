package kg.air.cnc.dao.removehost;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HostVO;

@Repository
public class RemoveHostDAOImpl implements RemoveHostDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<HostVO> getRemoveHostList() {
		return mybatis.selectList("RemoveHostDAO.getRemoveHostList");
	}


	@Override
	public List<ReservationVO> checkReservation(HostVO vo) {
		//System.out.println("RemoveHostDAOImpl(vo.host_id) = "+vo.getHost_id());
		return mybatis.selectList("RemoveHostDAO.checkReservation", vo);
	}

	@Override
	public void sendMessage(List<ReservationVO> vo) {
		System.out.println(vo.toString());
		for(int i=0; i<vo.size(); i++) {
			mybatis.insert("RemoveHostDAO.sendMessage", vo.get(i));
		}
	}

	@Override
	public void refund(List<ReservationVO> vo) {
		for(int i=0; i<vo.size(); i++) {
			mybatis.insert("RemoveHostDAO.refund", vo.get(i));
		}
	}
	
	@Override
	public void deleteHost(HostVO vo) {
		mybatis.delete("RemoveHostDAO.deleteHost", vo);
	}


	@Override
	public void sendMessageHost(HostVO vo) {
		mybatis.insert("RemoveHostDAO.sendMessageHost", vo);
	}
	
	@Override
	public void deleteReservation(List<ReservationVO> vo) {
		for(int i=0; i<vo.size(); i++) {
			mybatis.delete("RemoveHostDAO.deleteReservation", vo.get(i));
		}
	}

}
