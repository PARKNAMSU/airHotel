package kg.air.cnc.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import kg.air.cnc.dao.log.LogDAO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.LogVO;
import kg.air.cnc.vo.MessageVO;

@EnableAspectJAutoProxy
@Component
@Aspect
public class LogAdvice {
	
	@Autowired
	private LogDAO logDAO;
	
	@Pointcut("execution(public * kg.air.cnc..*Controller.insert*(..))")
	private void logTarget() {}
	/*메서드 실행 시 로그 저장*/
	@After("logTarget()")
	public void trace(JoinPoint joinPoint)throws Throwable{
		String methodName = joinPoint.getSignature().getName();//메서드 메서드명
		Object [] arguments = joinPoint.getArgs();//메서드 매개변수
		LogVO logVO = new LogVO();
		System.out.println(methodName);
		if(methodName.equals("insertMessageController")) {
			MessageVO messageVO =(MessageVO)arguments[0];
			logVO.setLog_id(messageVO.getMessage_from_id());
			logVO.setLog_content(messageVO.getMessage_content());
			logVO.setLog_type("sendMessage");
			logDAO.addLog(logVO);
		}
		if(methodName.equals("insertCommentsController")) {
			CommentsVO commentsVO = (CommentsVO)arguments[0];
			logVO.setLog_id(commentsVO.getComments_id());
			logVO.setLog_content(commentsVO.getComments_content());
			logVO.setLog_type("insertCommnets");
			logDAO.addLog(logVO);
		}
		System.out.println("로그 완료");
	}
}
