package kg.air.cnc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	
	@RequestMapping("/test.do")
	public String testcon() {
		return "test";
	}
}
