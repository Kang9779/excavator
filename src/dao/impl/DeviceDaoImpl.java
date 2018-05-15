package dao.impl;

import bean.HealthValues;
import dao.DeviceDao;
import bean.Device;
import bean.Module;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class DeviceDaoImpl implements DeviceDao {
    /**
     * 模块添加
     * @param module
     * @throws Exception
     */
    @Override
    public void addModule(Module module) throws Exception {
        System.out.println("注册模块");
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into module values(?,?,?);";
        qr.update(sql,module.getMid(),module.getModsim(),module.getModstatus());
    }
    /**
     * 添加设备
     * @param device
     * @return
     * @throws Exception
     */
    @Override
    public void addDevice(Device device) throws Exception {
        System.out.println("添加设备");
        /**
         * 添加设备，同时修改设备对应的模块号 0：表示模块号待绑定设备，1表示绑定设备
         */
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql1 = "insert into device values(?,?,?,?,?,?,?,?,?,?);";
        //根据moduleId修改设备状态号
        String sql2 = "update module set modstatus=1 where mid = ?";
        try {
            qr.update(sql1,device.getDid(),device.getUser().getUid(),device.getMid(),device.getDname(),
                    device.getPower(),device.getCapacity(),device.getWork_weight(),device.getWork_hours(),
                    device.getManufacturer(),device.getDevstatus());
            qr.update(sql2,device.getMid());
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    /**
     * 根据用户信息查询其所属于的设备信息
     * @param uid
     * @return
     * @throws Exception
     */
    @Override
    public List<Device> findDeviceByUserID(String uid) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from device where uid=?";
        List<Device> devices = qr.query(sql,new BeanListHandler<>(Device.class),uid);
        return devices;
    }

    /**
     * 查询可用module
     * @return
     * @throws Exception
     */
    @Override
    public List<Module> findModule() throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from module where modstatus=0";
        List<Module> modules = qr.query(sql,new BeanListHandler<>(Module.class));
        return modules;
    }

    @Override
    public Object findModuleIdByDevice(String dname) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from device where dname=?";
        Module module =qr.query(sql,new BeanHandler<>(Module.class),dname);
        return module;
    }

    /**
     * 修改设备绑定的模块号，并将先前绑定的模块号状态置为2：损坏或者不使用状态
     * @param dname
     * @param changeMid
     * @param deviceMid
     * @throws Exception
     */
    @Override
    public void changeDeviceMod(String dname, String changeMid, String deviceMid) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql1 = "update device set mid=? where dname=?";
        String sql2 = "update module set modstatus=? where mid=?";
        qr.update(sql1,changeMid,dname);
        qr.update(sql2,2,deviceMid);
        qr.update(sql2,1,changeMid);
    }

    /**
     * 根据设备状态返回在线工作的设备
     * @return
     * @throws Exception
     */
    @Override
    public List<Device> findRealtimeWorkDevice() throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from device where devstatus=1";
        List<Device> devices = qr.query(sql,new BeanListHandler<>(Device.class));
        return devices;
    }

    /**
     * 根据设备号查询对应的健康值,默认为10前10天的健康值
     * @param devicename
     * @return
     * @throws Exception
     */
    @Override
    public List<HealthValues> getHealthValuesByDev(String devicename) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from healthvalues where dname=? order by date asc limit 10";
        List<HealthValues> healthValuesList = qr.query(sql,new BeanListHandler<>(HealthValues.class),devicename);
        return healthValuesList;
    }
}
