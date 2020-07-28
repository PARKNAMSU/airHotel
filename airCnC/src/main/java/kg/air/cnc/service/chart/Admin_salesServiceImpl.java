package kg.air.cnc.service.chart;

import java.util.List;

import org.springframework.stereotype.Service;

import kg.air.cnc.vo.Admin_salesVO;

public interface Admin_salesServiceImpl {
	public List<Admin_salesVO> getAdmin_salesForYears(Admin_salesVO vo);
	public List<Admin_salesVO> getAdmin_salesForYear(Admin_salesVO vo);
	public List<Admin_salesVO> getAdmin_salesForMonth(Admin_salesVO vo);
	public List<Admin_salesVO> getAdmin_salesForDays(Admin_salesVO vo);
}
