package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.blame.BlameVO;

import java.util.ArrayList;
import java.util.Map;

public interface BlameDAO {
    ArrayList<BlameVO> getBlameList();
    ArrayList<BlameVO> getBlameInfo(String tartget_member_id);
    CustomerVO getCustomerBlameInfo(String tartget_member_id);
    void insertBlameWarnMessage(Map<String, String> warnMessageMap);
    void deleteBlame(String target_member_id);
    void increaseCustomerBlameWarn(String target_member_id);
    void addBlackList(String id);

}
