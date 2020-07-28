package kg.air.cnc.service.chart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.chart.Admin_salesDAO;
import kg.air.cnc.vo.Admin_salesVO;

@Service
public class Admin_salesService implements Admin_salesServiceImpl{
	@Autowired
	private Admin_salesDAO admin_salesDAO;
	@Override
	public List<Admin_salesVO> getAdmin_salesForYears(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForYears(vo);
		DateFormat format = new SimpleDateFormat("YYYY년");
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
	@Override
	public List<Admin_salesVO> getAdmin_salesForYear(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			if(i>0) {
				list.get(i).setAdmin_sales_compare_before(list.get(i).getAdmin_sales() - list.get(i-1).getAdmin_sales());
				
			}
			System.out.println(list.get(i).getAdmin_sales_regdate());
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
	@Override
	public List<Admin_salesVO> getAdmin_salesForMonth(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월DD일");
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			if(i>0) {
				list.get(i).setAdmin_sales_compare_before(list.get(i).getAdmin_sales() - list.get(i-1).getAdmin_sales());
				
			}
			System.out.println(list.get(i).getAdmin_sales_regdate());
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
	@Override
	public List<Admin_salesVO> getAdmin_salesForDays(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월DD일");
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			if(i>0) {
				list.get(i).setAdmin_sales_compare_before(list.get(i).getAdmin_sales() - list.get(i-1).getAdmin_sales());
			}
			System.out.println(list.get(i).getAdmin_sales_regdate());
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
