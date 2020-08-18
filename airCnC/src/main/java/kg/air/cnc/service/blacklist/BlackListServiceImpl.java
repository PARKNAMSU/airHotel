package kg.air.cnc.service.blacklist;

import kg.air.cnc.dao.blacklist.BlackListDAO;
import kg.air.cnc.vo.BlackUserVO;
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

    public BlackUserVO getSearchBlackId(String blackSearchEmail) {
        return blackListDAO.getBlackSearchId(blackSearchEmail);
    }

    public void deleteBlackList(String blackEmail) {
        blackListDAO.deleteBlackList(blackEmail);
    }

}
