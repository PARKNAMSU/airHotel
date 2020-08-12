package kg.air.cnc.service.policyop;

import java.util.List;

import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PolicyVO;

public interface PolicyService {
	List<PolicyVO> selectPolicyList(PagingCriteria cri);
	int countPolicyListTotal();
	int insertPolicy(PolicyVO vo);
	List<PolicyVO> getPolicyListAdmin(PagingCriteria cri);
	public PolicyVO detailPolicy(int policy_idx);
	public void updatePolicy(PolicyVO vo);
	public void deletePolicy(int policy_idx);
}
