package kg.air.cnc.common;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import kg.air.cnc.dao.log.LogDAO;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.LogVO;
import kg.air.cnc.vo.MessageVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@EnableAspectJAutoProxy
@Component
@Aspect
public class LogAdvice {
	
	@Autowired
	private LogDAO logDAO;
	
	@Pointcut("execution(public * kg.air.cnc..*Controller.insert*(..)) || execution(public * kg.air.cnc..*Controller.update*(..)) || execution(public * kg.air.cnc..*Controller.delete*(..))" 
			+ "|| execution(public * kg.air.cnc..CustomerServiceImpl.login(..)) || execution(public * kg.air.cnc..CustomerServiceImpl.register(..))")
	private void logTarget() {}
	
	@Pointcut("execution(public * kg.air.cnc..*Controller.logout(..))")
	private void beforeTarget() {}
	/*메서드 실행시 로그저장*/
	@After("logTarget()")
	public void trace(JoinPoint joinPoint)throws Throwable{
		String methodName = joinPoint.getSignature().getName();//메소드명
		Object [] arguments = joinPoint.getArgs();//매개변수
		LogVO logVO = new LogVO();
		System.out.println(methodName);
		if(methodName.equals("insertMessageController")) {
			MessageVO messageVO =(MessageVO)arguments[0];
			logVO.setLog_id(messageVO.getMessage_from_id());
			logVO.setLog_content(messageVO.getMessage_content());
			logVO.setLog_type("sendMessage");
			logDAO.addLog(logVO);
			System.out.println("sendMessage 실행");
		}
		if(methodName.equals("insertMessageForDetailControlle")) {
			MessageVO messageVO =(MessageVO)arguments[0];
			logVO.setLog_id(messageVO.getMessage_from_id());
			logVO.setLog_content(messageVO.getMessage_content());
			logVO.setLog_type("sendMessage");
			logDAO.addLog(logVO);
			System.out.println("sendMessage 실행");
		}
		if(methodName.equals("insertCommentsController")) {
			CommentsVO commentsVO = (CommentsVO)arguments[0];
			logVO.setLog_id(commentsVO.getComments_id());
			logVO.setLog_content(commentsVO.getComments_content());
			logVO.setLog_type("insertCommnets");
			logDAO.addLog(logVO);
			System.out.println("insertComments 실행");
		}
		if(methodName.equals("updateCommentsController")){
			CommentsVO commentsVO = (CommentsVO)arguments[0];
			HttpSession session = (HttpSession)arguments[1];
			
			logVO.setLog_id((String)session.getAttribute("login_session"));
			logVO.setLog_content(commentsVO.getComments_content());
			logVO.setLog_type("updateComments");
			logDAO.addLog(logVO);
			System.out.println("updateComments 실행");
		}
		if(methodName.equals("insertHostBlame")) {
			BlameVO blameVO = (BlameVO)arguments[0];
			logVO.setLog_id(blameVO.getBlame_member_id());
			logVO.setLog_content("to "+blameVO.getBlame_target_member_id()+" content "+blameVO.getBlame_content());
			logVO.setLog_type("insertBlame");
			logDAO.addLog(logVO);
			System.out.println("insertBlame 실행");
		}
		if(methodName.equals("login")) {
			CustomerVO vo = (CustomerVO)arguments[0];
			logVO.setLog_id(vo.getCustomer_id());
			logVO.setLog_content("로그인 성공");
			logVO.setLog_type("login");
			logDAO.addLog(logVO);
			System.out.println("login 실행");
		}
		if(methodName.equals("register")) {
			CustomerVO vo = (CustomerVO)arguments[0];
			logVO.setLog_id(vo.getCustomer_id());
			logVO.setLog_content("회원가입 성공");
			logVO.setLog_type("createAccount");
			logDAO.addLog(logVO);
		}
		if(methodName.equals("deleteReservationController")) {
			ReservationHouseDetailVO vo = (ReservationHouseDetailVO)arguments[0];
			logVO.setLog_id("예약번호: "+vo.getReservation_seq());
			logVO.setLog_content("예약취소");
			logVO.setLog_type("cancelReservation");
			logDAO.addLog(logVO);
			System.out.println("deleteReservation 실행");
		}
		System.out.println("로그완료");
	}
	@Before("beforeTarget()")
	public void bTrace(JoinPoint joinPoint) throws Throwable{
		String methodName = joinPoint.getSignature().getName();//메소드명
		Object [] arguments = joinPoint.getArgs();//매개변수
		LogVO logVO = new LogVO();
		if(methodName.equals("logout")) {
			HttpSession session = (HttpSession)arguments[0];
			String id = (String)session.getAttribute("login_session");
			logVO.setLog_id(id);
			logVO.setLog_content("로그아웃 성공");
			logVO.setLog_type("logout");
			logDAO.addLog(logVO);
			System.out.println("logout 실행");
		}
	}
}
