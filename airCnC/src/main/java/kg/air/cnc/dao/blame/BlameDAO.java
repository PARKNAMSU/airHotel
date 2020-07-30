package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.blame.BlameVO;

import java.util.ArrayList;
import java.util.Map;

public interface BlameDAO {
    ArrayList<BlameVO> getBlameList();
    ArrayList<BlameVO> getBlameInfo(String target_member_id);
    CustomerVO getCustomerBlameInfo(String target_member_id);
    HostVO getHostBlameInfo(String target_member_id);
    void insertBlameWarnMessage(Map<String, String> warnMessageMap);
    void deleteBlame(Map<String, String> deleteBlameMap);
    void increaseCustomerBlameWarn(String target_member_id);
    void increaseHostBlameWarn(String target_member_id);
    void addBlackList(String id);

}
