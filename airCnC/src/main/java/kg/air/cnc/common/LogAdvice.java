package kg.air.cnc.common;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import kg.air.cnc.dao.log.LogDAO;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.LogVO;
import kg.air.cnc.vo.MessageVO;

@EnableAspectJAutoProxy
@Component
@Aspect
public class LogAdvice {
	
	@Autowired
	private LogDAO logDAO;
	
	@Pointcut("execution(public * kg.air.cnc..*Controller.insert*(..)) || execution(public * kg.air.cnc..*Controller.update*(..))")
	private void logTarget() {}
	/*�޼��� ���� �� �α� ����*/
	@After("logTarget()")
	public void trace(JoinPoint joinPoint)throws Throwable{
		String methodName = joinPoint.getSignature().getName();//�޼��� �޼����
		Object [] arguments = joinPoint.getArgs();//�޼��� �Ű�����
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
	}
}
