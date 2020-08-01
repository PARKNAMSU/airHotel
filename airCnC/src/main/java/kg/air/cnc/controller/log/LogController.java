package kg.air.cnc.controller.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.log.LogService;
import kg.air.cnc.vo.LogVO;

@Controller
public class LogController {
	@Autowired
	LogService logService;
	
	/*해당 조건의 로그 json형태로 변환후 검색*/
	@RequestMapping(value="/getLog.mdo", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getLogListController(LogVO vo) throws JsonProcessingException{
		List<LogVO> list = null;
		if(vo.getLog_id() == null || vo.getLog_id().equals("")) {
			list = logService.getLogList(vo);
		}else {
			list = logService.getLogListForId(vo);
		}
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping(value="/logPage.mdo")
	public String logPageController() {
		return "admin_log";
	}
}
