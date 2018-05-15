package service.impl;

import bean.PageBean;
import bean.Sensor;
import dao.SensorDao;
import dao.impl.SensorDaoImpl;
import service.SensorService;

import java.util.Date;
import java.util.List;

public class SensorServiceImpl implements SensorService {
    @Override
    public List<Sensor> findSensorInfoByMid(String mid) throws Exception {
        SensorDao dao = new SensorDaoImpl();
        List<Sensor> sensors = dao.findSensorInfoByMid(mid);
        return sensors;
    }

    /**
     * 分页查询传感器历史数据
     */
    @Override
    public PageBean<Sensor> findSensorPage(int currPage, int pageSize, Date dateStart, Date dateEnd, String moduleId) throws Exception {
        SensorDao sensorDao = new SensorDaoImpl();
        //当前页数据
        List<Sensor> list = sensorDao.findSensorPage(currPage,pageSize,dateStart,dateEnd,moduleId);
        //总条数
        int totalCount = sensorDao.getTotalCount(moduleId,dateStart,dateEnd);
        return new PageBean<>(list,currPage,pageSize,totalCount);
    }
}
