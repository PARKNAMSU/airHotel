package kg.air.cnc.service.commonqueop;

import java.util.List;

import kg.air.cnc.vo.CommonQueVO;
import kg.air.cnc.vo.PagingCriteria;

public interface CommonQueService {
	List<CommonQueVO> selectCommonQueList(PagingCriteria cri);
	int countCommonQueListTotal();
	int insertCommonQue(CommonQueVO vo);
	List<CommonQueVO> getCommonQueListAdmin(PagingCriteria cri);
	public CommonQueVO detailCommonQue(int commonq_idx);
	public void updateCommonQue(CommonQueVO vo);
	public void deleteCommonQue(int commonq_idx);
	List<CommonQueVO> selectCommonQueListType(String commonq_type);
}
