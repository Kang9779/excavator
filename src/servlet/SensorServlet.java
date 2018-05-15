package servlet;

import bean.DataPage;
import bean.Module;
import bean.PageBean;
import bean.Sensor;
import myconverter.MyConverter;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import service.DeviceService;
import service.SensorService;
import service.impl.DeviceServiceImpl;
import service.impl.SensorServiceImpl;
import utils.JsonDateValueProcessor;
import utils.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 查询传感器历史信息记录Servlet
 */
@WebServlet(urlPatterns = "/sensor",name = "SensorServlet")
public class SensorServlet extends BaseServlet {
    /**
     * 分页查询数据
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String findSensorHistoryInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf8");
        String datetimeStart = request.getParameter("datetimeStart");
        if(datetimeStart==null||datetimeStart==""){
            datetimeStart =(String)request.getSession().getAttribute("datetimeStart");
        }
        else {
            request.getSession().setAttribute("datetimeStart",datetimeStart);
        }
        System.out.println(datetimeStart);

        String datetimeEnd = request.getParameter("datetimeEnd");
        if(datetimeEnd==null||datetimeEnd==""){
            datetimeEnd =(String)request.getSession().getAttribute("datetimeEnd");
        }
        else {
            request.getSession().setAttribute("datetimeEnd",datetimeEnd);
        }
        System.out.println(datetimeEnd);
        String devicename = request.getParameter("devicename");
        if(devicename==null||devicename==""){
            devicename =(String)request.getSession().getAttribute("devicename");
        }
        else {
            request.getSession().setAttribute("devicename",devicename);
        }

        String devicepartsID = request.getParameter("devicepartsID");
        if(devicepartsID==null||devicepartsID==""){
            devicepartsID =(String)request.getSession().getAttribute("devicepartsID");
        }
        else {
            request.getSession().setAttribute("devicepartsID",devicepartsID);
        }

        //获取前台DataTable 传递的参数
//        int pageSize = 10;
//        int currPage = 1;
//        String size = request.getParameter("length");//单页显示数据量
//        if (!"".equals(size) && size != null) {
//            pageSize = Integer.parseInt(size);
//        }
//        System.out.println("length:");
//        System.out.println(size);
//
//        int draw = Integer.parseInt(request.getParameter("draw"));
//        System.out.println("draw:");
//        System.out.println(draw);

//        String currentRecord = request.getParameter("start");//当前页
//        if (!"".equals(currentRecord) && currentRecord != null) {
//            currPage = Integer.parseInt(currentRecord)+1;           //注意此处+1
//        }
//        System.out.println("start:");
//        System.out.println(currentRecord);

        int currPage = Integer.parseInt(request.getParameter("currPage"));
        int pageSize = 10;
        Date dateStart = (Date) new MyConverter().convert(Date.class,datetimeStart);
        Date dateEnd = (Date) new MyConverter().convert(Date.class,datetimeEnd);

        System.out.println(dateStart);

        DeviceService deviceService = new DeviceServiceImpl();
        Module module = deviceService.findModuleIdByDevice(devicename);

        String moduleId = module.getMid();
        SensorService sensorService = new SensorServiceImpl();
        PageBean<Sensor> sensorPageBean = sensorService.findSensorPage(currPage,pageSize,dateStart,dateEnd,moduleId);
//        String json = JsonUtil.object2json(sensorPageBean);
//        System.out.println(json);

//        for(Sensor sensor:sensorPageBean.getList()){
//            System.out.println(sensor.getDate());
//            System.out.println(sensor.getDbX());
//        }
//        DataPage<Sensor> dataPage = new DataPage<>();
//        dataPage.setDraw(draw);
//        dataPage.setRecordsTotal(sensorPageBean.getTotalCount());
//        dataPage.setRecordsFiltered(sensorPageBean.getPageSize());
//        dataPage.setData(sensorPageBean.getList());
//
//        JsonConfig jsonConfig = new JsonConfig();
//        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-mm-dd HH:mm:ss"));
//        JSONObject jsonObject =new JSONObject();
//        jsonObject = jsonObject.fromObject(dataPage,jsonConfig);
//        System.out.println(jsonObject);

//        System.out.println(js);

        request.setAttribute("sensorbean",sensorPageBean);
        request.setAttribute("devicepartsID",devicepartsID);

//        response.getWriter().println(js);

//        response.getWriter().println(jsonObject);

       // request.getRequestDispatcher("/jsp/history_list.jsp").forward(request,response);
        return "/jsp/history_list.jsp";
    }
}
