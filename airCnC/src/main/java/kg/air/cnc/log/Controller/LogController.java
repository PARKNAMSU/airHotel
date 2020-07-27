package kg.air.cnc.log.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.log.service.LogService;
import kg.air.cnc.vo.LogVO;

@Controller
public class LogController {
	@Autowired
	LogService logService;
	
	@RequestMapping(value="/getLog.mdo", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getLogListController(LogVO vo) throws JsonProcessingException{

		List<LogVO> list = logService.getLogList(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		return jsonStr;
	}
	@RequestMapping(value="/logPage.mdo")
	public String logPageController() {
		return "admin_log";
	}
}
