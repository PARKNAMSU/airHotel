package kg.air.cnc.dao.chart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
	@Override
	public List<Admin_salesVO> getAdmin_SalesDetail(Admin_salesVO vo) {
		return sqlSessionTemplate.selectList("Admin_salesDAO.getSalesDetail",vo);
	}
	public List<Admin_salesVO> admin_salesSetting(List<Admin_salesVO> list,DateFormat format){
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			if(i>0) {
				list.get(i).setAdmin_sales_compare_before(list.get(i).getAdmin_sales() - list.get(i-1).getAdmin_sales());
				
			}
			list.get(i).setAdmin_sales_date(format.format(list.get(i).getAdmin_sales_regdate()));
			sum += list.get(i).getAdmin_sales();
		}
		list.get(0).setSumSales(sum);
		for(int i=0;i<list.size();i++) {
			float per = (((float)list.get(i).getAdmin_sales()*100)/sum);
			System.out.println(sum);
			list.get(i).setAdmin_sales_persant(per);
			System.out.println(list.get(i).getAdmin_sales_persant());
		}
		return list;
	}

	

}
