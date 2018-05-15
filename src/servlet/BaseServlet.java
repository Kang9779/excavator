package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 通用servlet设计
 * */
@WebServlet(name ="BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        try{
            //反射机制设计
            //1.获取子类 类型类；
            Class clazz = this.getClass();
            // System.out.println(this);
            //2.获取请求的方法；
            String m = request.getParameter("method");
            if(m==null){
                m = "index";
            }
            //  System.out.println(m);
            //3.调用类型类方法，获取方法对象；
            Method method = clazz.getMethod(m,HttpServletRequest.class,HttpServletResponse.class);
            //4.让方法执行 返回值为请求转发的路径；
            String s = (String) method.invoke(this,request,response);
            if(s!=null)
            {
                request.getRequestDispatcher(s).forward(request,response);
            }
        }
        catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
    public String index(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{

        return null;
    }
}
