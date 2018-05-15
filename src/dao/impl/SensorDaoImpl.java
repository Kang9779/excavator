package dao.impl;

import bean.PageBean;
import bean.Sensor;
import dao.SensorDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;

import java.util.Date;
import java.util.List;

public class SensorDaoImpl implements SensorDao {
    /**
     * 根据mid查询sensor的信息
     * @param mid
     * @return
     * @throws Exception
     */
    @Override
    public List<Sensor> findSensorInfoByMid(String mid) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        //从数据库中按照时间顺序取出20个数据
        String sql = "select * from sensor where mid=? order by date desc limit 0,10";
        List<Sensor> sensors = qr.query(sql,new BeanListHandler<>(Sensor.class),mid);
        return sensors;
    }

    /**
     * 查询当前页需要显示的数据
     */
    @Override
    public List<Sensor> findSensorPage(int currPage, int pageSize, Date dateStart, Date dateEnd, String moduleId) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from sensor where mid=? and date between ? and ? limit ?,?";
        List<Sensor> sensorList = qr.query(sql,new BeanListHandler<>(Sensor.class),moduleId, dateStart,dateEnd,(currPage-1)*pageSize,pageSize);
        return sensorList;
    }

    /**
     *查询当前时间段内的所有数据总量
     */
    @Override
    public int getTotalCount(String moduleId, Date dateStart, Date dateEnd) throws Exception{
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from sensor where mid = ? and date between ? and ?";
        //qr.query()返回object类型 ，先转成 ScalarHandler的Long类型 然后 在转为 int类型
        return ((Long) qr.query(sql, new ScalarHandler(),moduleId, dateStart,dateEnd)).intValue();
    }
}
