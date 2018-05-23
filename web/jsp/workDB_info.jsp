<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: KANG
  Date: 2018/3/17
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
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
            实时状态监控
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">在线工作</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <div class="container-fluid">
            <div class="nav-tabs-custom col-md-6">
                <ul class="nav nav-tabs">
                    <li ><a href="${pageContext.request.contextPath}/page?method=workInfo" >位置信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/page?method=workDGInfo" >斗杆信息</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/page?method=workDBInfo" >动臂信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/page?method=workCDInfo">铲斗信息</a></li>
                </ul>
            </div>
        </div>
        <%--动臂传感器信息--%>
        <div class="row">
            <div class="col-md-6">
                <!-- MAP & BOX PANE -->
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">有杆腔压力</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <div class="row">
                            <div id="pressureOne" style="height: 300px;">
                                <%--曲线显示--%>
                            </div>
                            <script src="/js/dataprocess/PressureOne.js"></script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- MAP & BOX PANE -->
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">无杆腔压力</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <div class="row">
                            <div id="pressureTwo" style="height: 300px;">
                                <%--曲线显示--%>
                            </div>
                            <script src="/js/dataprocess/PressureTwo.js"></script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- MAP & BOX PANE -->
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">动臂液压缸位移</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <div class="row">
                            <div id="deformation" style="height:300px;">
                                <%--地图显示--%>
                            </div>
                            <script src="/js/dataprocess/deformation.js"></script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- MAP & BOX PANE -->
                <div class="col-md-6">
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">X轴倾角</h3>
                        </div>
                        <div class="box-body no-padding">
                            <div class="row">
                                <div class="col-md-9 col-sm-8">
                                    <div class="pad">
                                        <div id="X_angles" style="height: 250px;">
                                            <%--地图显示--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">Y轴倾角</h3>
                        </div>
                        <div class="box-body no-padding">
                            <div class="row">
                                <div class="col-md-9 col-sm-8">
                                    <div class="pad">
                                        <div id="Y_angles" style="height: 250px;">
                                            <%--地图显示--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

<script>
    <%--定时调用数据加载--%>
    window.setInterval(loadData,100);
    //去后台请求数据
    function loadData()
    {
        $.ajax({
            url:"${pageContext.request.contextPath}/device?method=getSensorInfo",
            type:"get",
            success:function (data) {
                var result = eval(data);
                var dataX=[],dataY1=[],dataY2=[],dataY3=[],dataX_angle=[],dataY_angle=[];
                $.each(result,function (index) {
                    dataX.push(result[index].date);
                    dataY1.push(result[index].dbyp);
                    dataY2.push(result[index].dbwp);
                    dataY3.push(result[index].dbwy);
                    dataX_angle.push(result[index].dbX);
                    dataY_angle.push(result[index].dbY);
                });
                drawPressureOne(dataX,dataY1);
                drawPressureTwo(dataX,dataY2);
                drawDeformation(dataX,dataY3);
                drawX_angle(dataX_angle);
                drawY_angle(dataY_angle);
            }
            // ,
            // error:function () {
            //     alert("数据请求出错！")
            // }
        })
    }
</script>

</body>

</html>



