package kg.air.cnc.dao.personalqueop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.PagingCriteria;
import kg.air.cnc.vo.PersonalQueVO;

@Repository
public class PersonalQueDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<PersonalQueVO> selectPersonalQueList(PersonalQueVO vo) {
		System.out.println("===> Mybatis로 selectPersonalQueList() 기능 처리");
		return mybatis.selectList("personalqMapper.selectPersonalQueList");
	}//유저가 자기 아이디꺼 불러올 메소드

	public int countPersonalQueList(){
		System.out.println("===> Mybatis로 countPersonalQueList() 기능 처리");
	    return mybatis.selectOne("personalqMapper.countPersonalQueList");
	}//페이징에 필요한 메소드
	
	public int insertPersonalQueBoard(PersonalQueVO vo) {
		System.out.println("===> Mybatis로 insertPersonalQueBoard() 기능 처리");
		return mybatis.insert("personalqMapper.insertPersonalQue", vo);
	}//유저가 질문을 올리는 메소드
	
	public List<PersonalQueVO> getPersonalQueListAdmin(PagingCriteria cri) {
		System.out.println("===> Mybatis로 getPersonalQueListAdmin() 기능 처리");
		return mybatis.selectList("personalqMapper.getPersonalQueListAdmin",cri);
	}//관리자가 모든 질문을 불러올 메소드
	
	public PersonalQueVO detailPersonalQue(int personalq_idx) {
		System.out.println("===> Mybatis로 detailPersonalQue() 기능 처리");
		return mybatis.selectOne("personalqMapper.detailPersonalQue", personalq_idx);
	}//관리자가 답변을 달기위해 질문 상세보기를 하는 메소드
	
	public void updatePersonalQue(PersonalQueVO vo) {
		System.out.println("===> Mybatis로 updatePersonalQue() 기능 처리");
		mybatis.update("personalqMapper.updatePersonalQue", vo);
	}//관리자가 답변 작성하고 업데이트하는 메소드
	
	public void deletePersonalQue(int personalq_idx) {
		System.out.println("===> Mybatis로 deletePersonalQue() 기능 처리");
		mybatis.update("personalqMapper.deletePersonalQue", personalq_idx);
	}//관리자가 질문 삭제하는 메소드
}
