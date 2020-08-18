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
	@Autowired
	private Utils utils;
	@Pointcut("execution(public * kg.air.cnc..*Controller.insert*(..)) || execution(public * kg.air.cnc..*Controller.update*(..)) || execution(public * kg.air.cnc..*Controller.delete*(..))" 
			+ "|| execution(public * kg.air.cnc..CustomerServiceImpl.login(..)) || execution(public * kg.air.cnc..CustomerServiceImpl.register(..))")
	private void logTarget() {}
	
	@Pointcut("execution(public * kg.air.cnc..CustomerController.logout(..))")
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
			utils.addLogProcess(messageVO.getMessage_from_id(),messageVO.getMessage_content(),"sendMessage");
			System.out.println("sendMessage 실행");
		}
		if(methodName.equals("insertMessageForDetailControlle")) {
			MessageVO messageVO =(MessageVO)arguments[0];
			utils.addLogProcess(messageVO.getMessage_from_id(),messageVO.getMessage_content(),"sendMessage");
			System.out.println("sendMessage 실행");
		}
		if(methodName.equals("insertCommentsController")) {
			CommentsVO commentsVO = (CommentsVO)arguments[0];
			utils.addLogProcess(commentsVO.getComments_id(),commentsVO.getComments_content(),"insertCommnets");
			System.out.println("insertComments 실행");
		}
		if(methodName.equals("updateCommentsController")){
			CommentsVO commentsVO = (CommentsVO)arguments[0];
			HttpSession session = (HttpSession)arguments[1];
			utils.addLogProcess((String)session.getAttribute("login_session"),commentsVO.getComments_content(),"updateComments");
			System.out.println("updateComments 실행");
		}
		if(methodName.equals("insertHostBlame")) {
			BlameVO blameVO = (BlameVO)arguments[0];
			utils.addLogProcess(blameVO.getBlame_member_id(), "to "+blameVO.getBlame_target_member_id()+" content "+blameVO.getBlame_content(), "insertBlame");
			System.out.println("insertBlame 실행");
		}
		if(methodName.equals("login")) {
			CustomerVO vo = (CustomerVO)arguments[0];
			utils.addLogProcess(vo.getCustomer_id(), "로그인 성공", "login");
			System.out.println("login 실행");
		}
		if(methodName.equals("register")) {
			CustomerVO vo = (CustomerVO)arguments[0];
			utils.addLogProcess(vo.getCustomer_id(), "회원가입 성공", "createAccount");
			System.out.println("회원가입 성공");
		}
		if(methodName.equals("deleteReservationController")) {
			ReservationHouseDetailVO vo = (ReservationHouseDetailVO)arguments[0];
			utils.addLogProcess("예약번호: "+vo.getReservation_seq(), "예약취소", "cancelReservation");
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
			utils.addLogProcess(id, "로그아웃 성공", "logout");
			System.out.println("logout 실행");
		}
	}

}
