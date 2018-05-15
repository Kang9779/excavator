<%@ page import="bean.User" %><%--在线工作下的全局监控页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/echarts/echarts.min.js"></script>

    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <%--引用百度地图api--%>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>

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
<jsp:include page="/jsp/mainboard.jsp"></jsp:include>
<div class="control-sidebar-bg"></div>

<%--设备信息管理区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            全局状态监控
        </h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">在线工作</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                    <!-- MAP & BOX PANE -->
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">Location</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <div class="row">
                                    <div class="pad">
                                        <div id="location" style="height: 500px;">
                                            <%--地图显示--%>
                                        </div>
                                        <script src="/js/dataprocess/location.js"></script>
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

</body>
</html>
