<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="/css/jquery-jvectormap-1.2.2.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
    <%--<!-- jQuery 2.2.3 -->--%>
    <script src="/js/jquery-2.2.3.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%--确定用户是否登陆--%>
<%
    User user = (User)session.getAttribute("user");
    if(user==null){
        response.sendRedirect("/jsp/login.jsp");
        String loginInfo = "请先登陆";
        request.setAttribute("loginInfo",loginInfo);
    }
%>
<script>
    var msg = <%= request.getAttribute("loginInfo")%>
    if(msg!=null)
        alert(msg);
</script>
<%--顶部导航栏--%>
<header class="main-header">
    <!-- Logo -->
    <a href="/jsp/main_home.jsp" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>管理</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>SJTU</b></span>
    </a>
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/images/username.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">${user.username}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="/images/username.jpg" class="img-circle" alt="User Image">

                            <p>
                                ${user.username}
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">设置</a>
                            </div>
                            <div class="pull-right">
                                <a href="${pageContext.request.contextPath}/user?method=logout" class="btn btn-default btn-flat">退出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<%--侧边用户面板--%>
<aside class="main-sidebar">
    <section class="sidebar">
        <!-- 侧边用户面板 -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/images/username.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${user.username}</p>
                <a href="/jsp/main_home.jsp"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <%--<!-- 搜索表单 -->--%>
        <%--<form action="#" method="get" class="sidebar-form">--%>
            <%--<div class="input-group">--%>
                <%--<input type="text" name="q" class="form-control" placeholder="搜索...">--%>
                <%--<span class="input-group-btn">--%>
                <%--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
                <%--</button>--%>
              <%--</span>--%>
            <%--</div>--%>
        <%--</form>--%>
        <%--面板选项--%>
        <ul class="sidebar-menu">
            <li class="header">主导航</li>
            <%--挖掘机设备管理--%>
            <li class="active treeview">
                <a href="${pageContext.request.contextPath}/page?method=findMainhome">
                    <i class="fa  fa-user"></i> <span>首页</span>
                </a>
            </li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-laptop"></i> <span>设备管理</span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="${pageContext.request.contextPath}/page?method=showDevInfo"><i class="fa fa-circle-o"></i> 设备查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/page?method=findDeviceInfo"><i class="fa fa-circle-o"></i> 信息修改与添加</a></li>
                </ul>
            </li>
            <%--在线工作--%>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i>
                    <span>在线工作</span>
                    <span class="pull-right-container">
                        <%--显示正常工作设备数量--%>
                        <span class="label label-primary pull-right" id="devsize"></span>
                    </span>
                </a>
                <ul class="treeview-menu" id = "realtimeDev">
                    <li class="active"><a href="${pageContext.request.contextPath}/page?method=deviceMonitorInfo"><i class="fa fa-circle-o"></i> 设备监控</a></li>
                    <%--<li><a href="${pageContext.request.contextPath}/page?method=realtimeWorkInfo"><i class="fa fa-circle-o"></i> 设备1</a></li>--%>
                </ul>
            </li>
            <%--健康状态--%>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/page?method=getHealthStatus">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>健康状态</span>
                    <span class="pull-right-container"></span>
                </a>
            </li>
            <%--性能趋势--%>
            <li class="treeview">
                <a href="${pageContext.request.contextPath}/page?method=getPerformanceInfo">
                    <i class="fa fa-line-chart"></i>
                    <span>性能趋势</span>
                    <span class="pull-right-container"></span>
                </a>
            </li>
            <%--设备维护--%>
            <li class="treeview">
                <a href="/jsp/maintain_info.jsp">
                    <i class="fa fa-edit"></i>
                    <span>设备维护</span>
                    <span class="pull-right-container">
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 维护记录</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 维护手册</a></li>
                </ul>
            </li>

            <%--维修报告--%>
            <li class="treeview">
                <a href="/jsp/maintain_report.jsp">
                    <i class="fa  fa-file"></i>
                    <span>维修报告</span>
                    <span class="pull-right-container">
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="#"><i class="fa fa-circle-o"></i> 维修报告</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 维修记录</a></li>
                </ul>
            </li>

            <%--历史记录查询--%>
            <li class="treeview">
                <a href="/jsp/history_list.jsp">
                    <i class="fa fa-book"></i>
                    <span>历史记录查询</span>
                    <span class="pull-right-container">
            </span>
                    <%--查询设备历史信息--%>
                </a>

            </li>
            <%--账户设置--%>
            <li class="treeview">
                <a href="/jsp/user_info.jsp">
                    <i class="fa fa-gears"></i>
                    <span>账户设置</span>
                    <span class="pull-right-container">
            </span>
                </a>
            </li>
        </ul>
    </section>
</aside>

<%--动态加载实时工作设备--%>
<script>
    $.ajax({
        //后台查询在线工作的设备；
        url:"${pageContext.request.contextPath}/device?method=findRealtimeWorkDevice",
        type:"get",
        success:function(data){
            var dev = JSON.parse(data);
            var $ul = $("#realtimeDev");
            var size = 0;
            $(dev).each(function () {
                size++;
                $ul.append($("<li><a href=${pageContext.request.contextPath}/page?method=realtimeWorkInfo&mid="+ this.mid +">"+"<i class=\"fa fa-circle-o\"></i> "+this.dname+"</a></li>"));
            })
            document.getElementById("devsize").innerHTML=size;
        },
        error:function () {
            alert("实时在线设备查询失败！")
        }
    })
</script>

<div class="control-sidebar-bg"></div>

<!-- Bootstrap 3.3.6 -->
<script src="/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/js/app.min.js"></script>
<!-- Sparkline -->
<script src="/js/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/js/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="/js/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="/js/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/js/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
