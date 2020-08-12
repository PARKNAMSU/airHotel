package kg.air.cnc.service.policyop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.policyop.PolicyDAO;
import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PolicyVO;
@Service
public class PolicyServiceImpl implements PolicyService {
	@Autowired
	private PolicyDAO policyDAO;
	
	@Override
	public List<PolicyVO> selectPolicyList(PagingCriteria cri) {
		return policyDAO.selectPolicyList(cri);
	}

	@Override
	public int countPolicyListTotal() {
		return policyDAO.countPolicyList();
	}

	@Override
	public int insertPolicy(PolicyVO vo) {
		return policyDAO.insertPolicyBoard(vo);
	}

	@Override
	public List<PolicyVO> getPolicyListAdmin(PagingCriteria cri) {
		return policyDAO.getPolicyListAdmin(cri);
	}

	@Override
	public PolicyVO detailPolicy(int policy_idx) {
		return policyDAO.detailPolicy(policy_idx);
	}

	@Override
	public void updatePolicy(PolicyVO vo) {
		policyDAO.updatePolicy(vo);
	}

	@Override
	public void deletePolicy(int policy_idx) {
		policyDAO.deletePolicy(policy_idx);
	}

}
