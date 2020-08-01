package kg.air.cnc.service.blame;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.BlameVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BlameService  {
    List<Map.Entry<String, Integer>> getBlameList();
    ArrayList<BlameVO> getBlameInfo(String target_member_id);
    CustomerVO getCustomerBlameJudgeInfo(String target_member_id);
    HostVO getHostBlameInfo(String target_member_id);
    void insertBlameWarnMessage(Map<String, String>warnMessageMap);
    void deleteBlame(Map<String, String> deleteBlameMap);
    void increaseCustomerBlameWarn(String target_member_id);
    void increaseHostBlameWarn(String target_member_id);
    void addBlackList(String id);
    void suspendHost(String host_id, String suspend_day);
    void suspendCustomer(String customer_id, String suspend_day);

}
