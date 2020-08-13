package kg.air.cnc.dao.commonqueop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.CommonQueVO;
import kg.air.cnc.vo.PagingCriteria;

@Repository
public class CommonQueDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommonQueVO> selecCommonQueList(PagingCriteria cri) {
		System.out.println("===> Mybatis로 selectCommonQueList() 기능 처리");
		return mybatis.selectList("commonqMapper.selectCommonQueList",cri);
	}//유저가 자주묻는질문 불러올 메소드

	public int countCommonQueList(){
		System.out.println("===> Mybatis로 countCommonQueList() 기능 처리");
	    return mybatis.selectOne("commonqMapper.countCommonQueList");
	}//페이징에 필요한 메소드
	
	public int insertCommonQueBoard(CommonQueVO vo) {
		System.out.println("===> Mybatis로 insertCommonQueBoard() 기능 처리");
		return mybatis.insert("commonqMapper.insertCommonQue", vo);
	}//관리자가 자주묻는질문 추가할 메서드
	
	public List<CommonQueVO> getCommonQueListAdmin(PagingCriteria cri) {
		System.out.println("===> Mybatis로 getCommonQueListAdmin() 기능 처리");
		return mybatis.selectList("commonqMapper.getCommonQueListAdmin",cri);
	}//관리자가 모든 질문을 불러올 메소드
	
	public CommonQueVO detailCommonQue(int commonq_idx) {
		System.out.println("===> Mybatis로 detailCommonQue() 기능 처리");
		return mybatis.selectOne("commonqMapper.detailCommonQue", commonq_idx);
	}//관리자가 답변을 달기위해 질문 상세보기를 하는 메소드
	
	public void updateCommonQue(CommonQueVO vo) {
		System.out.println("===> Mybatis로 updateCommonQue() 기능 처리");
		mybatis.update("commonqMapper.updateCommonQue", vo);
	}//관리자가 작성하고 업데이트하는 메소드
	
	public void deleteCommonQue(int commonq_idx) {
		System.out.println("===> Mybatis로 deleteCommonQue() 기능 처리");
		mybatis.update("commonqMapper.deleteCommonQue", commonq_idx);
	}//관리자가 삭제하는 메소드

	public List<CommonQueVO> selecCommonQueListType(String commonq_type) {
		System.out.println("===> Mybatis로 selectCommonQueListType() 기능 처리");
		return mybatis.selectList("commonqMapper.selectCommonQueListType",commonq_type);
	}
}
