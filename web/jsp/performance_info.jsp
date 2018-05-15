<%@ page import="bean.User" %><%--
  Created by IntelliJ IDEA.
  User: KANG
  Date: 2018/4/18
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<body class="hold-transition skin-yellow sidebar-mini">
    <jsp:include page="mainboard.jsp"></jsp:include>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            模块待开发！
        </h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">性能趋势</li>
        </ol>
    </section>
</div>

</body>
</html>
