package kg.air.cnc.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import kg.air.cnc.customer.service.CustomerService;
import kg.air.cnc.customer.vo.CustomerVO;

// 로그인 처리를 담당하는 인터셉터.
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	CustomerService service;

	// 컨트롤러보다 먼저 수행되는 메서드.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession(); // 세션 객체를 가져옴.
		Object object = session.getAttribute("login_session"); // login처리 담당하는 사용자 정보 객체를 가져옴.
		if (object == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				String sessionId = loginCookie.getValue();
				CustomerVO customerVO = service.checkCustomerWithSessionKey(sessionId);
				if (customerVO != null) {
					session.setAttribute("login_session", customerVO);
					return true;
				}
			}
			// 로그인이 안되어 있는 상태이므로 로그인 폼으로 돌려보냄.
			response.sendRedirect("/login");
			return false; // 컨트롤러 요청으로 가지 않도록 false 반환.
		}
		return true;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}	
}
