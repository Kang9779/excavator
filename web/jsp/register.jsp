
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/AdminLTE.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition register-page">

<jsp:include page="head.jsp"></jsp:include>

<div class="container" style="width:100%;background:url('image/regist_bg.jpg');">
    <div class="row">
        <div class="col-md-2">

        </div>

        <div class="col-md-7" style="background:#fff;padding:20px 50px;margin:30px;border:7px solid #ccc;">
            <h3>
                用户注册 USER REGISTER
            </h3>
            <form class="form-horizontal" action="${pageContext.request.contextPath}/user?method=regist" method="post" style="margin-top:40px;">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input name="username" type="text" class="form-control" id="username" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input name="password" type="password" class="form-control" id="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input name="confirpwd" type="password" class="form-control" id="confirpwd" placeholder="请确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-6">
                        <input name="email" type="email" class="form-control" id="email" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input name="telephone" type="text" class="form-control" id="telephone" placeholder="请输入电话">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-1 col-sm-7">
                        <input class="btn btn-primary btn-block btn-flat border-radius:20px" type="submit"  width="100" value="注册" name="submit" border="0">
                    </div>
                </div>
            </form>
            <a class="col-lg-offset-1"href="/jsp/login.jsp" class="text-center">返回登陆</a>
        </div>
    </div>
</div>
<!-- jQuery 2.2.3 -->
<script src="/js/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
