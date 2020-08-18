package kg.air.cnc.service.blacklist;

import kg.air.cnc.vo.BlackUserVO;

import java.util.ArrayList;



public interface BlackListService {
    ArrayList<BlackUserVO> getBlackList(); // 블랙리스트 전체를 불러오는 메소드
    BlackUserVO getSearchBlackId(String blackSearchEmail); //검색된 블랙리스트 유저를 불러오는 메소드
    void deleteBlackList(String blackEmail);
    int[] getBlackListCount();


}
