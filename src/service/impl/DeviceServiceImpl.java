package service.impl;

import bean.HealthValues;
import dao.DeviceDao;
import dao.impl.DeviceDaoImpl;
import bean.Device;
import service.DeviceService;
import bean.Module;

import java.util.List;

public class DeviceServiceImpl implements DeviceService {
    @Override
    public List<Device> findDeviceByUserID(String uid) throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        List<Device> devices = dao.findDeviceByUserID(uid);
        return devices;
    }

    @Override
    public void addDevice(Device device) throws Exception {
        DeviceDao dao =  new DeviceDaoImpl();
        dao.addDevice(device);
    }

    @Override
    public void addModule(Module module) throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        dao.addModule(module);
    }

    @Override
    public List<Module> findModule() throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        List<Module> modules = dao.findModule();
        return modules;
    }

    @Override
    public Module findModuleIdByDevice(String dname) throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        Module module=(Module) dao.findModuleIdByDevice(dname);
        return module;
    }

    @Override
    public void changDeviceMod(String dname, String changeMid, String deviceMid) throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        dao.changeDeviceMod(dname,changeMid,deviceMid);
    }

    @Override
    public List<Device> findRealtimeWorkDevice(String uid) throws Exception {
        DeviceDao dao = new DeviceDaoImpl();
        List<Device> devices = dao.findRealtimeWorkDevice(uid);
        return devices;
    }

    @Override
    public List<HealthValues> getHealthValuesByDev(String devicename) throws Exception {
        DeviceDao deviceDao = new DeviceDaoImpl();
        List<HealthValues> healthValuesList = deviceDao.getHealthValuesByDev(devicename);
        return healthValuesList;
    }
}
