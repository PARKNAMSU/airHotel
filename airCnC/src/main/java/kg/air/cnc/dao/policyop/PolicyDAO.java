package kg.air.cnc.dao.policyop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PolicyVO;

@Repository
public class PolicyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<PolicyVO> selectPolicyList(PagingCriteria cri) {
		System.out.println("===> Mybatis로 selectPolicyList() 기능 처리");
		return mybatis.selectList("policyMapper.selectPolicyList",cri);
	}

	public int countPolicyList(){
		System.out.println("===> Mybatis로 countPolicyList() 기능 처리");
	    return mybatis.selectOne("policyMapper.countPolicyList");
	}
	
	public int insertPolicyBoard(PolicyVO vo) {
		System.out.println("===> Mybatis로 insertPolicyBoard() 기능 처리");
		return mybatis.insert("policyMapper.insertPolicy", vo);
	}
	
	public List<PolicyVO> getPolicyListAdmin(PagingCriteria cri) {
		System.out.println("===> Mybatis로 getPolicyListAdmin() 기능 처리");
		return mybatis.selectList("policyMapper.getPolicyListAdmin",cri);
	}
	
	public PolicyVO detailPolicy(int policy_idx) {
		System.out.println("===> Mybatis로 detailPolicy() 기능 처리");
		return mybatis.selectOne("policyMapper.detailPolicy", policy_idx);
	}
	
	public void updatePolicy(PolicyVO vo) {
		System.out.println("===> Mybatis로 updatePolicy() 기능 처리");
		mybatis.update("policyMapper.updatePolicy", vo);
	}
	
	public void deletePolicy(int policy_idx) {
		System.out.println("===> Mybatis로 deletePolicy() 기능 처리");
		mybatis.update("policyMapper.deletePolicy", policy_idx);
	}
}
