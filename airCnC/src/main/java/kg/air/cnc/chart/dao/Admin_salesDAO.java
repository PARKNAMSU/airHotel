package kg.air.cnc.chart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.Admin_salesVO;

@Repository
public class Admin_salesDAO implements Admin_salesDAOImpl{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<Admin_salesVO> getAdmin_salesForYears(Admin_salesVO vo) {
		return sqlSessionTemplate.selectList("Admin_salesDAO.getSalesForYears",vo);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForYear(Admin_salesVO vo) {
		return sqlSessionTemplate.selectList("Admin_salesDAO.getSalesForYear",vo);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForMonth(Admin_salesVO vo) {
		return sqlSessionTemplate.selectList("Admin_salesDAO.getSalesForMonth",vo);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForDays(Admin_salesVO vo) {
		return sqlSessionTemplate.selectList("Admin_salesDAO.getSalesForDays",vo);
	}
	

}
