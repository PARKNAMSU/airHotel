package kg.air.cnc.dao.theme;

import kg.air.cnc.vo.House_InfoVO;

import java.util.List;

public interface ThemeDAO {
    List<House_InfoVO> getThemeHouseList(String theme_type); // 테마별 숙소리스트 불러오기
    List<House_InfoVO> getHighScoreHouseList(); // 평점이 높은 숙소리스트 불러오기
}
