<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body class="hold-transition skin-yellow sidebar-mini">
<jsp:include page="mainboard.jsp"></jsp:include>
<div class="control-sidebar-bg"></div>
<%--首页内容区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            挖掘机液压系统智能管理平台
        </h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">控制台</li>
        </ol>
    </section>
    <%--主界面content--%>

</div>
<%--页脚--%>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.12
    </div>
    <strong>Copyright &copy; 2017-2018 <a href="http://mi.sjtu.edu.cn">上海交通大学机电物流所</a>.</strong> All rights
    reserved.
</footer>
</body>
</html>

