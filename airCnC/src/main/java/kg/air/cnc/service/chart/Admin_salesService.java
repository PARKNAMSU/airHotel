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
		return admin_salesDAO.admin_salesSetting(list, format);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForYear(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		return admin_salesDAO.admin_salesSetting(list, format);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForMonth(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월DD일");
		return admin_salesDAO.admin_salesSetting(list, format);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesForDays(Admin_salesVO vo) {
		List<Admin_salesVO> list = admin_salesDAO.getAdmin_salesForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월DD일");
		return admin_salesDAO.admin_salesSetting(list, format);
	}
	@Override
	public List<Admin_salesVO> getAdmin_salesDetail(Admin_salesVO vo) {
		return admin_salesDAO.getAdmin_SalesDetail(vo);
	}

}
