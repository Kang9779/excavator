package servlet;


import bean.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceImpl;
import utils.MD5Utils;
import utils.UUIDUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/user",name = "UserServlet")
public class UserServlet extends BaseServlet {
    /**
     * 用户注册
     * */
    public String regist(HttpServletRequest request,HttpServletResponse response)throws Exception
    {
        request.setCharacterEncoding("utf-8");
        User user = new User();
        //判断用户名和密码是否一致

        //获取用户名，密码，邮箱，电话
        BeanUtils.populate(user,request.getParameterMap());
        //设置uid
        user.setUid(UUIDUtils.getId());
        //加密处理
        user.setPassword(MD5Utils.md5(user.getPassword()));
        UserService s = new UserServiceImpl();
        s.regist(user);
        request.setAttribute("msg","注册成功，请登陆！");
        return "/jsp/login.jsp";
    }

    /**
     * 用户登陆
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public String login(HttpServletRequest request,HttpServletResponse response)throws Exception
    {
        request.setCharacterEncoding("utf-8");
        /**
         * 验证码
         */
        String inputcode = request.getParameter("code");//接收客户端浏览器提交上来的验证码
        String checkcode = (String) request.getSession().getAttribute("checkcode");//从服务器端的session中取出验证码
        //将客户端验证码和服务器端验证比较，如果相等，则表示验证通过
        if (!inputcode.equals(checkcode)) {
            request.setAttribute("msg","验证码错误");
            return "/jsp/login.jsp";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = MD5Utils.md5(password);
        UserService s = new UserServiceImpl();
        User user = s.login(username,password);
        if(user == null){
            request.setAttribute("msg","用户名与密码不匹配");
            return "/jsp/login.jsp";
        }
        response.setContentType("text/html;charset=utf-8");
        request.getSession().setAttribute("user",user);//将用户信息放入session域中
        Cookie[] cookies = request.getCookies();
        if (cookies==null)
        {
            Cookie cookie = new Cookie("username",username);
            cookie.setMaxAge(9999);
            response.addCookie(cookie);
            cookie = new Cookie("password",password);
            cookie.setMaxAge(9999);
            response.addCookie(cookie);
        }
        response.sendRedirect(request.getContextPath()+"/jsp/main_home.jsp");//重定向到首页

        /**
         * 自动登陆实现cookie
         */

        return null;
    }
    /**
     * 用户退出
     */
    public String logout(HttpServletRequest request,HttpServletResponse response)throws Exception
    {
        request.setCharacterEncoding("utf-8");
        request.getSession().invalidate();
        return "/jsp/login.jsp";
    }
    /**
     * 设置checkcookie
     */
    public String checkcookie(HttpServletRequest request,HttpServletResponse response)throws Exception{

        System.out.println("cookie检查");
//        //设置服务器端以UTF-8编码进行输出
//        response.setCharacterEncoding("UTF-8");
//        //设置浏览器以UTF-8编码进行接收,解决中文乱码问题
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        //获取浏览器访问服务器时传递过来的cookie数组
//        Cookie[] cookies = request.getCookies();
//        //如果用户是第一次访问，那么得到的cookies将是null
//        if (cookies!=null) {
//            out.write("您上次访问的时间是：");
//            for (int i = 0; i < cookies.length; i++) {
//                Cookie cookie = cookies[i];
//                if (cookie.getName().equals("lastAccessTime")) {
//                    Long lastAccessTime =Long.parseLong(cookie.getValue());
//                    Date date = new Date(lastAccessTime);
//                    out.write(date.toLocaleString());
//                }
//            }
//        }else {
//            out.write("这是您第一次访问本站！");
//        }
//        //用户访问过之后重新设置用户的访问时间，存储到cookie中，然后发送到客户端浏览器
//        Cookie cookie = new Cookie("lastAccessTime", System.currentTimeMillis()+"");//创建一个cookie，cookie的名字是lastAccessTime
//        //将cookie对象添加到response对象中，这样服务器在输出response对象中的内容时就会把cookie也输出到客户端浏览器
//        response.addCookie(cookie);
        return "/jsp/login.jsp";
    }


}
