package kg.air.cnc.service.chart;

import java.util.List;

import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;

public interface HostChartServiceImpl {
	public List<Host_ChartVO> getAdmin_HostForYears(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_HostForYear(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_HostForMonth(Host_ChartVO vo);
	public List<Host_ChartVO> getAdmin_HostForDays(Host_ChartVO vo);
	public List<HostVO> getAdmin_HostDetail(Host_ChartVO vo);
}
