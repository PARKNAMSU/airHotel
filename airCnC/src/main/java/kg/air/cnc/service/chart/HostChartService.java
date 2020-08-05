package kg.air.cnc.service.chart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.chart.HostChartDAO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.Host_ChartVO;

@Service
public class HostChartService implements HostChartServiceImpl{

	@Autowired
	HostChartDAO hostChartDAO;

	@Override
	public List<Host_ChartVO> getAdmin_HostForYears(Host_ChartVO vo) {
		List<Host_ChartVO> list = hostChartDAO.getAdmin_hostForYears(vo);
		DateFormat format = new SimpleDateFormat("YYYY년");
		return hostChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Host_ChartVO> getAdmin_HostForYear(Host_ChartVO vo) {
		List<Host_ChartVO> list = hostChartDAO.getAdmin_hostForYear(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월");
		return hostChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Host_ChartVO> getAdmin_HostForMonth(Host_ChartVO vo) {
		List<Host_ChartVO> list = hostChartDAO.getAdmin_hostForMonth(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return hostChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<Host_ChartVO> getAdmin_HostForDays(Host_ChartVO vo) {
		List<Host_ChartVO> list = hostChartDAO.getAdmin_hostForDays(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		return hostChartDAO.admin_salesSetting(list, format);
	}

	@Override
	public List<HostVO> getAdmin_HostDetail(Host_ChartVO vo) {
		List<HostVO> list = hostChartDAO.getAdmin_hostDetail(vo);
		DateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
		for(int i=0;i<list.size();i++) {
			list.get(i).setHost_image(format.format(list.get(i).getHost_regdate()));//�ӽ÷� �̹����� ���� ���߿� ������date ����
		}
		return list;
	}
}
