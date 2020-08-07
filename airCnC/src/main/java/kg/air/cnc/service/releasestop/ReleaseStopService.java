package kg.air.cnc.service.releasestop;

import kg.air.cnc.dao.releasestop.ReleaseStopDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class ReleaseStopService {

    @Autowired
    ReleaseStopDAO releaseStopDAO;

    @Scheduled(cron = "0 0 1 * * ?")
    public void setRelease(){
        releaseStopDAO.setHostStopRelease();
        releaseStopDAO.setCustomerStopRelease();
        releaseStopDAO.setHouseStopRelease();
    }

}
