package kg.air.cnc.service.commonqueop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.commonqueop.CommonQueDAO;
import kg.air.cnc.vo.CommonQueVO;
import kg.air.cnc.vo.PagingCriteria;

@Service
public class CommonQueServiceImpl implements CommonQueService {
	
	@Autowired
	private CommonQueDAO commonqDAO;
	
	@Override
	public List<CommonQueVO> selectCommonQueList(PagingCriteria cri) {
		return commonqDAO.selecCommonQueList(cri);
	}

	@Override
	public int countCommonQueListTotal() {
		return commonqDAO.countCommonQueList();
	}

	@Override
	public int insertCommonQue(CommonQueVO vo) {
		return commonqDAO.insertCommonQueBoard(vo);
	}

	@Override
	public List<CommonQueVO> getCommonQueListAdmin(PagingCriteria cri) {
		return commonqDAO.getCommonQueListAdmin(cri);
	}

	@Override
	public CommonQueVO detailCommonQue(int commonq_idx) {
		return commonqDAO.detailCommonQue(commonq_idx);
	}

	@Override
	public void updateCommonQue(CommonQueVO vo) {
		commonqDAO.updateCommonQue(vo);
	}

	@Override
	public void deleteCommonQue(int commonq_idx) {
		commonqDAO.deleteCommonQue(commonq_idx);
	}

	@Override
	public List<CommonQueVO> selectCommonQueListType(String commonq_type) {
		return commonqDAO.selecCommonQueListType(commonq_type);
	}

}
