<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%--<div class="navbar-wrapper">--%>
    <%--<div class="container">--%>
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header" style="margin-left: 40px;margin-right: 20px">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Excavator</a>
                </div>
                <div >
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/jsp/home.jsp">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                Dropdown
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right"style="margin-right: 20px">
                        <c:if test="${empty user}">
                            <li><a href="/jsp/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                            <li><a href="/jsp/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                        </c:if>
                        <c:if test="${not empty user}">
                            <li><a href="${pageContext.request.contextPath}/user?method=logout"><span class="glyphicon glyphicon-user"></span> ${user.username}:您好,退出</a></li>
                            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><span class="glyphicon glyphicon-log-in"></span> 控制台</a></li>
                        </c:if>

                    </ul>
                </div>
                <div >

                </div>
            </div>
        </nav>
