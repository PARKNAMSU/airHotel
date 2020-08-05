package kg.air.cnc.service.theme;

import kg.air.cnc.vo.House_InfoVO;

import java.util.List;

public interface ThemeService {
    List<House_InfoVO> getThemeHouseList(String theme_type);
    List<House_InfoVO> getHighScoreHouseList();
}
