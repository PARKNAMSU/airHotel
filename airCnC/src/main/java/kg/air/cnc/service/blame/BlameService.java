package kg.air.cnc.service.blame;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.blame.BlameVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BlameService  {
    List<Map.Entry<String, Integer>> getBlameList();
    ArrayList<BlameVO> getBlameInfo(String target_member_id);
    CustomerVO getBlameJudgeInfo(String target_member_id);
    void insertBlameWarnMessage(Map<String, String>warnMessageMap);
}
