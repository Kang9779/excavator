<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./css/AdminLTE.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">

<%--动态包含导航栏--%>
<jsp:include page="/jsp/head.jsp"></jsp:include>
<%--背景需要做适当修改--%>
<div class="container" style="width:100%;height:100%;background:#797a6b url('images/loginbg.jpg') no-repeat;">
    <div class="row">
        <div class="col-md-7">
            <!---->
        </div>

        <div class="col-md-5">
            <div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:10px;margin-top:60px;background:#fff;">
                <h4>
                    用户登陆 USER LOGIN
                </h4>

                <div>&nbsp;</div>
                <form class="form-horizontal" action="${pageContext.request.contextPath}/user?method=login" method="post" onsubmit="return login(this)">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input name="username" type="text" class="form-control" id="username" placeholder="请输入用户名" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input name="password" type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-4">
                            <input name="code" type="text" class="form-control" id="code"placeholder="请输入验证码">
                        </div>
                        <div class="col-sm-0">
                            <img src="${pageContext.request.contextPath}/drawCode?createTypeFlag=n" onclick="changeImg(this,'n')"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input  name="checkbox" id ="checkbox" type="checkbox"> 自动登录
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="checkbox"> 记住用户名
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input class="btn btn-primary btn-block btn-flat" type="submit"  width="100" value="登录" name="submit" border="0">
                        </div>
                    </div>
                </form>
                <a href="#">忘记密码</a><br>
                <a href="./jsp/register.jsp" class="text-center">注册</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
 //刷新验证码
 function changeImg(obj,createTypeFlag){
     document.getElementById(obj.id).src="${pageContext.request.contextPath}/drawCode?createTypeFlag="+createTypeFlag+"&"+Math.random();
 }
 function login(form) {
     if(form.username.value==""){
         alert("请输入用户名！");
         return false;
     }
     if(form.password.value==""){
         alert("请输入密码！");
         return false;
     }
     if(form.code.value==""){
         alert("请输入验证码");
         return false;
     }
     return true;
 }
</script>
<script>

</script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery-2.2.3.min.js"></script>
</body>
</html>
