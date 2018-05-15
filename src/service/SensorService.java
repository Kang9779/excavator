package service;

import bean.PageBean;
import bean.Sensor;

import java.util.Date;
import java.util.List;

public interface SensorService {
    List<Sensor> findSensorInfoByMid(String mid)throws Exception;

    PageBean<Sensor> findSensorPage(int currPage, int pageSize, Date dateStart, Date dateEnd, String moduleId) throws Exception;
}
