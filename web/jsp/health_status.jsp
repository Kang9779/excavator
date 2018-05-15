<%@ page import="bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KANG
  Date: 2018/4/17
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%--设备健康状态诊断--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/js/echarts/echarts.min.js"></script>
</head>
<%
    User user = (User)session.getAttribute("user");
    if(user==null){
        response.sendRedirect("/jsp/login.jsp");
        String loginInfo = "请先登陆";
        request.setAttribute("loginInfo",loginInfo);
    }
%>
<body class="hold-transition skin-yellow sidebar-mini">

<jsp:include page="mainboard.jsp"></jsp:include>

<div class="control-sidebar-bg"></div>
<%--设备信息管理区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            挖掘机液压系统综合健康指数
        </h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">健康状态</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <div class="row">
            <form action="${pageContext.request.contextPath}/device?method=healthStatus" method="post" onsubmit="return checkformDev()">
                <div class="col-md-12 text-left" style="padding-top: 8px" >
                    <label><b>选择设备型号:</b></label>
                    <select id="devicename" name="devicename" class="form-group">
                        <option>--请选择--</option>
                        <%--设备型号动态获取--%>
                    </select>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <button type="submit" class="btn-dropbox">查询</button>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">健康状态变化</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <div class="row">
                            <div id="healthCure" style="height: 400px;">
                                <%--曲线显示--%>
                            </div>
                            <script src="/js/dataprocess/healthStatus.js"></script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">综合性能评价</h3>
                    </div>
                    <div class="box-body no-padding">
                        <div class="row">
                            <div id="healthRadar" style="height:400px;">
                                <%--曲线显示--%>
                            </div>
                            <script src="/js/dataprocess/healthStatus.js"></script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.12
    </div>
    <strong>Copyright &copy; 2017-2018 <a href="http://mi.sjtu.edu.cn">上海交通大学机电物流所</a>.</strong> All rights
    reserved.
</footer>
<%--获取各个设备的健康值--%>
<script>
    function checkformDev() {
        var devicename = $("#devicename").val();
        if(devicename=="--请选择--"){
            alert("请输入设备型号！");
            return false;
        }
        return true;
    }
    var result = ${health};
    var dataX=[],dataY1=[],dataY2=[],dataY3=[];//时间信息，铲斗健康值，斗杆健康值，动臂健康值
    $.each(result,function (index) {
        dataX.push(result[index].date);
        dataY1.push(result[index].dg);
        dataY2.push(result[index].db);
        dataY3.push(result[index].cd);
    });
    drawHealthCure(dataX,dataY1,dataY2,dataY3);//健康曲线
    drawHealthRadar();
</script>
<%--实时加载用户设备--%>
<script type="text/javascript">
    $.ajax({
        url:"${pageContext.request.contextPath}/device?method=findDeviceByUserID",
        type:"get",
        success: function(data) {
            var obj = JSON.parse(data);//解析json对象
            var select = document.getElementById("devicename");
            if ($.isEmptyObject(obj)) {
                var inner = "<option value=''>--没有可用设备，请先注册设备!---</option>";
                select.innerHTML = inner;
                return true;
            }
            $(obj).each(function (index) {
                var objoption = document.createElement("OPTION");
                var var1 = obj[index];
                objoption.text=var1.dname;
                objoption.value = var1.dname;
                select.options.add(objoption);
            })
        },
        error:function () {
            alert('用户设备型号获取失败！');
        }
    });
</script>
</body>
</html>
