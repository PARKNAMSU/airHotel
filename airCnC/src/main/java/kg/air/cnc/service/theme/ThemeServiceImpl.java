package kg.air.cnc.service.theme;

import kg.air.cnc.dao.theme.ThemeDAO;
import kg.air.cnc.vo.House_InfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ThemeService")
public class ThemeServiceImpl implements ThemeService {

    @Autowired
    ThemeDAO themeDAO;

    @Override // 테마별 하우스 리스트
    public List<House_InfoVO> getThemeHouseList(String theme_type) {
        List<House_InfoVO>houseList =  themeDAO.getThemeHouseList(theme_type);
        return houseList;
    }

    @Override // 평점 순 하우스 리스트
    public List<House_InfoVO> getHighScoreHouseList() {
        return themeDAO.getHighScoreHouseList();
    }
}
