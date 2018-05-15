<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <jsp:include page="/jsp/mainboard.jsp" flush="true"></jsp:include>
    <%--设备信息管理区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            设备信息管理
        </h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">设备管理</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">模块注册</h3>
                    </div>
                    <form action="${pageContext.request.contextPath}/device?method=addModule" method="post" onsubmit="return addModule(this)">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="mid">模块号</label>
                                <input type="text" name="mid" class="form-control" placeholder="请输入模块号">
                            </div>
                            <div class="form-group">
                                <label for="modsim">Sim卡号</label>
                                <input type="text" name="modsim" class="form-control" id="modsim" placeholder="请输入卡号">
                            </div>
                            <div class="form-group">
                                <label>模块状态：</label>
                                <select name="modstatus">
                                    <option>--请选择--</option>
                                    <option value="0">待绑定设备</option>
                                    <option value="1">已绑定设备</option>
                                </select>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">注册</button>
                        </div>
                    </form>
                </div>
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">信息修改</h3>
                    </div>
                    <form action="${pageContext.request.contextPath}/device?method=changeDeviceMod" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label>设备型号：</label>
                                <select name="mdname" id="mdname" class="form-control" onfocus="return findDevice()" onchange="return findModuleIdByDevice(this)">
                                    <option value=" ">--请选择--</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>当前设备绑定模块号：</label>
                                <input name="device_mid" type="text" id="device_mid" readonly>
                            </div>
                            <div class="form-group">
                                <label>模块号修改</label>
                                <select class="form-control" name="changeMid" id="changeMid" onfocus="return findChangeModule()">
                                    <option value="">--请选择--</option>
                                </select>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn-facebook">修改</button>
                        </div>
                    </form>

                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">设备注册</h3>
                    </div>
                    <form action="${pageContext.request.contextPath}/device?method=addDevice" method="post" onsubmit="return addDevice(this)">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="dname">设备型号</label>
                                <input type="text" name="dname" class="form-control" id="dname" placeholder="请输入设备型号">
                            </div>
                            <div class="form-group">
                                <label for="manufacturer">生产厂商</label>
                                <input type="text" name="manufacturer" class="form-control" id="manufacturer" placeholder="请输入生产厂商">
                            </div>
                            <div class="form-group">
                                <label for="mid">绑定模块号</label>
                                <select name="mid" class="form-control" id="mid" onfocus="return findModule()">
                                    <option value="">--请选择--</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="power">净功率(/kw)</label>
                                <input type="text" name="power" class="form-control" id="power" placeholder="请输入净功率">
                            </div>
                            <div class="form-group">
                                <label for="capacity">工作容量(/L)</label>
                                <input type="text" name="capacity" class="form-control" id="capacity" placeholder="请输入工作容量">
                            </div>
                            <div class="form-group">
                                <label for="work_weight">额定负载(/kg)</label>
                                <input type="text" name="work_weight" class="form-control" id="work_weight" placeholder="请输入额定负载">
                            </div>
                            <div class="form-group">
                                <label for="work_hours">工作时长(/h)</label>
                                <input type="text" name="work_hours" class="form-control" id="work_hours" placeholder="请输入工作时长">
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">注册</button>
                        </div>
                    </form>
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
        //输入信息验证
        function addModule(form) {
            if(form.mid.value==""){
                alert("模块号不能为空！")
                return false;
            }
            if(form.modsim.value==""){
                alert("卡号不能为空！")
                return false;
            }
            if(form.modstatus.value==""){
                alert("请确定状态")
                return false;
            }
            return true;
        }
        function addDevice(form) {
            if(form.dname.value==""){
                alert("设备型号不能为空！")
                return false;
            }
            if(form.manufacturer.value==""){
                alert("生产厂家不能为空！")
                return false;
            }
            if(form.mid.value==""){
                alert("请绑定模块号！")
                return false;
            }
            if(form.power.value==""){
                alert("净功率不能为空！")
                return false;
            }
            if(form.capacity.value==""){
                alert("净功率不能为空！")
                return false;
            }
            if(form.work_weight.value==""){
                alert("负载重量不能为空！")
                return false;
            }
            if(form.work_hours.value==""){
                alert("工作时长不能为空！")
                return false;
            }
        }
        /**
         * 动态获取可用Module
         */
        function findModule() {
            $.ajax({
                url:"${pageContext.request.contextPath}/device?method=findModule",
                type:"get",
                success:function (data) {
                    var obj = JSON.parse(data);//解析json对象
                    var select = document.getElementById("mid");
                    if($.isEmptyObject(obj)){
                        var inner = "<option value=''>--没有可用Module，请先注册Module!---</option>";
                        select.innerHTML=inner;
                        return true;
                    }
                    $(obj).each(function (index){
                        var objoption = document.createElement("OPTION");
                        var var1 = obj[index];
                        objoption.text=var1.mid;
                        objoption.value = var1.mid;
                        select.options.add(objoption);
                    })
                    return true;
                },
                error:function () {
                    alert("获取失败！")
                }
            })
        }
        function findChangeModule() {
            $.ajax({
                url:"${pageContext.request.contextPath}/device?method=findModule",
                type:"get",
                success:function (data) {
                    var obj = JSON.parse(data);//解析json对象
                    var select = document.getElementById("changeMid");
                    if($.isEmptyObject(obj)){
                        var inner = "<option value=''>--没有可用Module，请先注册Module!---</option>";
                        select.innerHTML=inner;
                        return true;
                    }
                    $(obj).each(function (index){
                        var objoption = document.createElement("OPTION");
                        var var1 = obj[index];
                        objoption.text=var1.mid;
                        objoption.value = var1.mid;
                        select.options.add(objoption);
                    })
                    return true;
                },
                error:function () {
                    alert("获取失败！")
                }
            })

        }
        function findDevice() {
            $.ajax({
                url:"${pageContext.request.contextPath}/device?method=findDeviceByUserID",
                type:"get",
                success:function (data) {
                    var obj = JSON.parse(data);//解析json对象
                    var select = document.getElementById("mdname");
                    if($.isEmptyObject(obj)){
                        var inner = "<option value=''>--没有可用设备，请先注册设备!---</option>";
                        select.innerHTML=inner;
                        return true;
                    }
                    $(obj).each(function (index){
                        var objoption = document.createElement("OPTION");
                        var var1 = obj[index];
                        objoption.text=var1.dname;
                        objoption.value = var1.dname;
                        select.options.add(objoption);
                    })
                    return true;
                },
                error:function () {
                    alert("获取失败！")
                }
            })
        }
        function findModuleIdByDevice(select) {
            var dname = select.value;
            $.ajax({
                url:"${pageContext.request.contextPath}/device?method=findModuleIdByDevice&Devicename="+dname,
                type:"get",
                success:function (data) {
                    var module = JSON.parse(data)
                    document.getElementById("device_mid").value=module.mid;
                }
            })
        }

        <%--提示信息栏--%>
        <%--info = ${info};--%>
        <%--alert(info);--%>
    </script>
</body>
</html>

