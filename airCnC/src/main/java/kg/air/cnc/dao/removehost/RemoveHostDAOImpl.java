package kg.air.cnc.dao.removehost;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.ReservationVO;

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
		System.out.println(vo.size());
		mybatis.insert("RemoveHostDAO.sendMessage", vo);
	}

	@Override
	public void refund(List<ReservationVO> vo) {
		mybatis.insert("RemoveHostDAO.refund", vo);
	}
	
	@Override
	public void deleteHost(HostVO vo) {
		mybatis.delete("RemoveHostDAO.deleteHost", vo);
	}

}
