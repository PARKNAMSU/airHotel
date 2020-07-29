package kg.air.cnc.service.blacklist;

import kg.air.cnc.dao.blacklist.BlackListDAO;
import kg.air.cnc.vo.blacklist.BlackUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("blackListService")
public class BlackListServiceImpl implements BlackListService {

    @Autowired
    BlackListDAO blackListDAO;

    public ArrayList<BlackUserVO> getBlackList() {
        System.out.println("getBlackList()--Serivce");
        ArrayList<BlackUserVO> blackUserList = blackListDAO.getBlackList();
        return blackUserList;
    }

    public BlackUserVO getSearchBlackId(String searchId) {
        return blackListDAO.getBlackSearchId(searchId);
    }

    public void deleteBlackList(String blackId) {
        blackListDAO.deleteBlackList(blackId);
    }

}
