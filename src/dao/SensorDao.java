package dao;

import bean.PageBean;
import bean.Sensor;

import java.util.Date;
import java.util.List;

public interface SensorDao {
    List<Sensor> findSensorInfoByMid(String mid) throws Exception;

    List<Sensor> findSensorPage(int currPage, int pageSize, Date dateStart, Date dateEnd, String moduleId)throws Exception;

    int getTotalCount(String moduleId, Date dateStart, Date dateEnd)throws Exception;
}
