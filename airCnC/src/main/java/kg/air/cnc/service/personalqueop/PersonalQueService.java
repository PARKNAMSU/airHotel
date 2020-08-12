package kg.air.cnc.service.personalqueop;

import java.util.List;

import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PersonalQueVO;

public interface PersonalQueService {
	List<PersonalQueVO> selectPersonalQueList(PagingCriteria cri);
	int countPersonalQueListTotal();
	int insertPersonalQue(PersonalQueVO vo);
	List<PersonalQueVO> getPersonalQueListAdmin(PagingCriteria cri);
	public PersonalQueVO detailPersonalQue(int personalq_idx);
	public void updatePersonalQue(PersonalQueVO vo);
	public void deletePersonalQue(int personalq_idx);
}
