package kg.air.cnc.dao.blacklist;

import kg.air.cnc.vo.blacklist.BlackUserVO;

import java.util.ArrayList;


public interface BlackListDAO {

    ArrayList<BlackUserVO>getBlackList();

    BlackUserVO getBlackSearchId(String searchId);

    void deleteBlackList(String blackId);

}
