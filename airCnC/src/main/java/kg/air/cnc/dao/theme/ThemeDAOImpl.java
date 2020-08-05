package kg.air.cnc.dao.theme;

import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.House_InfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ThemeDAO")
public class ThemeDAOImpl implements ThemeDAO{

    @Autowired
    SqlSession sqlSession;

    @Override // 테마에 맞는 숙소리스트 불러오기
    public List<House_InfoVO> getThemeHouseList(String theme_type) {
        System.out.println(theme_type);
        List<House_InfoVO> house_infoVOList = sqlSession.selectList("kg.air.cnc.dao.theme.ThemeDAO.getThemeHouseList", theme_type);
        return house_infoVOList;
    }

    @Override // 평점이 높은 숙소리스트 불러오기
    public List<House_InfoVO> getHighScoreHouseList() {
        return sqlSession.selectList("kg.air.cnc.dao.theme.ThemeDAO.getHighScoreHouseList");
    }
}
