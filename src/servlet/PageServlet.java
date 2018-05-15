package servlet;

import bean.Sensor;
import service.SensorService;
import service.impl.SensorServiceImpl;
import utils.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/page",name = "PageServlet")
public class PageServlet extends BaseServlet {
    public String findDeviceInfo (HttpServletRequest request, HttpServletResponse response) throws Exception {

        //请求转发
        request.getRequestDispatcher("/jsp/device_info.jsp").forward(request,response);
        return null;
    }
    public String findMainhome (HttpServletRequest request, HttpServletResponse response) throws Exception {

        //请求转发
        request.getRequestDispatcher("/jsp/main_home.jsp").forward(request,response);
        return null;
    }
    public String showDevInfo (HttpServletRequest request, HttpServletResponse response) throws Exception {

        //请求转发
        request.getRequestDispatcher("/jsp/device_showInfo.jsp").forward(request,response);
        return null;
    }
    public String deviceMonitorInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.getRequestDispatcher("/jsp/device_monitor.jsp").forward(request,response);
        return null;
    }
    public String workInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getRequestDispatcher("/jsp/work_info.jsp").forward(request,response);
        return null;
    }
    public String workDGInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getRequestDispatcher("/jsp/workDG_info.jsp").forward(request,response);
        return null;
    }
    public String workDBInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getRequestDispatcher("/jsp/workDB_info.jsp").forward(request,response);
        return null;
    }
    public String workCDInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getRequestDispatcher("/jsp/workCD_info.jsp").forward(request,response);
        return null;
    }

    /**
     * 从链接中获取设备的模块号，并将其存放在session域中，后续过程将从session域中取出模块号查询对应的sensor信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String realtimeWorkInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
        request.setCharacterEncoding("utf-8");
        String mid = request.getParameter("mid");
        //将设备对应的module号存放在session域中
        request.getSession().setAttribute("moduleId",mid);

        response.setContentType("text/html;utf-8");
     //   response.getWriter().println(json);
        request.getRequestDispatcher("/jsp/work_info.jsp").forward(request, response);
        return null;
    }
    public String getHealthStatus(HttpServletRequest request,HttpServletResponse response)throws Exception{
        request.getRequestDispatcher("/jsp/health_status.jsp").forward(request,response);
        return null;
    }
    public String getPerformanceInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
        request.getRequestDispatcher("/jsp/performance_info.jsp").forward(request,response);
        return null;
    }
}
