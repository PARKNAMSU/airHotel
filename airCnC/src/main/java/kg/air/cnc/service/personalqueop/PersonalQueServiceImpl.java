package kg.air.cnc.service.personalqueop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.personalqueop.PersonalQueDAO;
import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PersonalQueVO;
@Service
public class PersonalQueServiceImpl implements PersonalQueService {
	@Autowired
	private PersonalQueDAO personalqDAO;
	
	@Override
	public List<PersonalQueVO> selectPersonalQueList(PagingCriteria cri) {
		return personalqDAO.selectPersonalQueList(cri);
	}

	@Override
	public int countPersonalQueListTotal() {
		return personalqDAO.countPersonalQueList();
	}

	@Override
	public int insertPersonalQue(PersonalQueVO vo) {
		return personalqDAO.insertPersonalQueBoard(vo);
	}

	@Override
	public List<PersonalQueVO> getPersonalQueListAdmin(PagingCriteria cri) {
		return personalqDAO.getPolicyListAdmin(cri);
	}

	@Override
	public PersonalQueVO detailPersonalQue(int personalq_idx) {
		return personalqDAO.detailPersonalQue(personalq_idx);
	}

	@Override
	public void updatePersonalQue(PersonalQueVO vo) {
		personalqDAO.updatePersonalQue(vo);
	}

	@Override
	public void deletePersonalQue(int personalq_idx) {
		personalqDAO.deletePersonalQue(personalq_idx);
	}

}
