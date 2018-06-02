package servlet;

import bean.*;
import bean.Module;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.commons.beanutils.BeanUtils;
import service.DeviceService;
import service.SensorService;
import service.impl.DeviceServiceImpl;
import service.impl.SensorServiceImpl;
import utils.JsonDateValueProcessor;
import utils.JsonUtil;
import utils.UUIDUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/device",name = "DeviceServlet")
public class DeviceServlet extends BaseServlet {
    /**
     * 模块添加
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String addModule(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf-8");
        Module module = new Module();
        BeanUtils.populate(module,request.getParameterMap());
        DeviceService s = new DeviceServiceImpl();
        s.addModule(module);
        response.sendRedirect("/jsp/device_info.jsp");
        return null;
    }
    /***
     * 设备添加
     */
    public String addDevice(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf-8");
        Device device = new Device();
        BeanUtils.populate(device,request.getParameterMap());
        device.setDid(UUIDUtils.getId());
        User user =(User)request.getSession().getAttribute("user");
        device.setUser(user);
        DeviceService s = new DeviceServiceImpl();
        s.addDevice(device);
        response.sendRedirect("/jsp/device_info.jsp");
//        request.getRequestDispatcher("/jsp/device_info.jsp").forward(request,response);
        return null;
    }
    /**
     * 根据当前用户查询其所含有的设备
     */
    public String findDeviceByUserID(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("设备查询成功！");
        request.setCharacterEncoding("utf-8");
        User user = (User)request.getSession().getAttribute("user");
        DeviceService s = new DeviceServiceImpl();
        List<Device> devices = s.findDeviceByUserID(user.getUid());
//        request.setAttribute("devices",devices);
        String json = JsonUtil.list2json(devices);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(json);
        return null;
    }
    /**
     * 查询未被绑定的Module
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String findModule(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("查询可用Module");
        request.setCharacterEncoding("utf-8");
        DeviceService s = new DeviceServiceImpl();
        List<Module> modules = s.findModule();
//        request.setAttribute("modules",modules);
        String json = JsonUtil.list2json(modules);
        response.setContentType("utf-8");
        response.getWriter().println(json);
        if (modules.isEmpty())
        {
            System.out.println("没有可用的Module,请注册新的Module");
            return null;
        }
        for(Module module:modules){
            System.out.println(module.getMid());
        }
        return null;
    }

    /**
     * 根据设备型号查找其对应的模块号
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String findModuleIdByDevice(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String dname = request.getParameter("Devicename");
        DeviceService s = new DeviceServiceImpl();
        Module module = s.findModuleIdByDevice(dname);
        String json = JsonUtil.object2json(module);
        request.removeAttribute("Devicename");
        response.getWriter().println(json);
        return null;
    }

    /**
     * 当模块损坏时，修改设备对应的模块号
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String changeDeviceMod(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf-8");
        String dname = request.getParameter("mdname");
        String deviceMid = request.getParameter("device_mid");
        String changeMid = request.getParameter("changeMid");
        DeviceService service = new DeviceServiceImpl();
        service.changDeviceMod(dname,changeMid,deviceMid);
        String info = "绑定修改成功";
        /**
         * 此处request域中的info无法在前端页面中显示
         */
        request.setAttribute("info",info);
        //请求转发
        request.getRequestDispatcher("/jsp/device_info.jsp").forward(request,response);
        return null;
    }
    /**
     * 查询实时工作的设备
     */
    public String findRealtimeWorkDevice(HttpServletRequest request,HttpServletResponse response) throws Exception{

        request.setCharacterEncoding("utf-8");
        User user = (User)request.getSession().getAttribute("user");
        String uid = user.getUid();
        DeviceService service = new DeviceServiceImpl();
        List<Device> realtimeDevices = service.findRealtimeWorkDevice(uid);
        //实时在线工作的设备信息存放在session域中
        request.getSession().setAttribute("realtimeDevices",realtimeDevices);
        for(Device device:realtimeDevices){
            System.out.println(device.getDname());
        }
        String json = JsonUtil.list2json(realtimeDevices);
        response.getWriter().println(json);
        System.out.println("查询实时工作设备");
        return null;
    }

    /**
     * 从session域中取出模块号，查询相关sensor的信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String getSensorInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
        //从session中获取在线设备对应的模块号
        String mid = (String)request.getSession().getAttribute("moduleId");
        System.out.println(mid);
        SensorService service = new SensorServiceImpl();
        List<Sensor> sensors = service.findSensorInfoByMid(mid);

        /**
         * 注意sensors类中Date类型在转换成json数据格式时应该注意的方法
         */
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        JSONArray jsonArray = new JSONArray();
        jsonArray = jsonArray.fromObject(sensors,jsonConfig);
//        System.out.println(jsonArray);
        response.getWriter().println(jsonArray);
        return null;
    }

    /**
     * 根据设备号查询对应的健康值
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String healthStatus(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf8");
        String devicename = request.getParameter("devicename");
        System.out.print("设备号：");
        System.out.println(devicename);
        DeviceService deviceService = new DeviceServiceImpl();
        List<HealthValues> healthValuesList = deviceService.getHealthValuesByDev(devicename);

        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-mm-dd"));
        JSONArray jsonArray = new JSONArray();
        jsonArray = jsonArray.fromObject(healthValuesList,jsonConfig);
        System.out.println(jsonArray);
        request.setAttribute("health",jsonArray);
        request.getRequestDispatcher("/jsp/health_status.jsp").forward(request,response);
        return null;
    }
}
