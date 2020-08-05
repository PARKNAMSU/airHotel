package kg.air.cnc.dao.chart;

import java.util.List;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;
import kg.air.cnc.vo.Sign_upChartVO;

public interface HostChartDAOImpl {
	public List<Host_ChartVO> getAdmin_hostForYears(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_hostForYear(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_hostForMonth(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_hostForDays(Host_ChartVO vo);
	public List<HostVO> getAdmin_hostDetail(Host_ChartVO vo);
}
