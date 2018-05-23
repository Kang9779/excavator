<%@ page import="bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
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
<%--设备信息管理区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            历史记录查询
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-user"></i> 首页</a></li>
            <li class="active">控制台</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <%--主界面content--%>
        <div class="row">
            <form action="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=1" method="post" onsubmit="return checkhistoryform()">
                <div class="col-md-12 text-left" style="padding-top: 8px" >
                    <label><b>选择设备型号:</b></label>
                    <select id="devicename" name="devicename" class="form-group">
                        <option>--请选择--</option>
                        <%--设备型号动态获取--%>
                    </select>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <label><b>选择设备部件:</b></label>
                    <select id="devicepartsID" name="devicepartsID"class="form-group">
                        <option>--请选择--</option>
                        <option value="斗杆">斗杆</option>
                        <option value="动臂">动臂</option>
                        <option value="铲斗">铲斗</option>
                    </select>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <label><b>输入查询时间段：</b></label>
                    <input class="form-group" size="16" value="" readonly type="text" id="datetimeStart" name="datetimeStart" onclick="Datetime()">
                    <span>&nbsp;&nbsp;至 &nbsp;&nbsp;</span>
                    <input class="form-group" size="16" value="" readonly type="text" id="datetimeEnd" name="datetimeEnd" onclick="Datetime()">
                    <button type="submit" class="btn-dropbox">查询</button>
                </div>
            </form>
        </div>
        <div class="row" style="padding-top: 20px;padding-right: 10px;padding-left: 10px">
            <div class="box">
                <div class="box-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th style="text-align: center">序列</th>
                            <th style="text-align: center">设备型号</th>
                            <th style="text-align: center">部件名称</th>
                            <th style="text-align: center">有杆腔压力(/Pa)</th>
                            <th style="text-align: center">无杆腔压力(/Pa)</th>
                            <th style="text-align: center">位移(/mm)</th>
                            <th style="text-align: center">倾角(X)</th>
                            <th style="text-align: center">倾角(Y)</th>
                            <th style="text-align: center">时间</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:if test="${sensorbean.totalPage==0}">
                                <tr>
                                    <td colspan="7"style="text-align:center">暂无数据</td>
                                </tr>
                            </c:if>
                            <c:if test="${devicepartsID=='斗杆'}">
                                <c:forEach items="${sensorbean.list}" var="sensor" varStatus="count">
                                    <tr>
                                        <td align="center">${(sensorbean.currPage-1)*sensorbean.pageSize+count.index+1}</td>
                                        <td align="center">${devicename}</td>
                                        <td align="center">${devicepartsID}</td>
                                        <td align="center">${sensor.dgyp}</td>
                                        <td align="center">${sensor.dgwp}</td>
                                        <td align="center">${sensor.dgwy}</td>
                                        <td align="center">${sensor.dgX}</td>
                                        <td align="center">${sensor.dgY}</td>
                                        <td align="center">${sensor.date}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${devicepartsID=='动臂'}">
                                <c:forEach items="${sensorbean.list}" var="sensor" varStatus="count">
                                    <tr>
                                        <td align="center">${(sensorbean.currPage-1)*sensorbean.pageSize+count.index+1}</td>
                                        <td align="center">${devicename}</td>
                                        <td align="center">${devicepartsID}</td>
                                        <td align="center">${sensor.dbyp}</td>
                                        <td align="center">${sensor.dbwp}</td>
                                        <td align="center">${sensor.dbwy}</td>
                                        <td align="center">${sensor.dbX}</td>
                                        <td align="center">${sensor.dbY}</td>
                                        <td align="center">${sensor.date}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${devicepartsID=='铲斗'}">
                                <c:forEach items="${sensorbean.list}" var="sensor" varStatus="count">
                                    <tr>
                                        <td align="center">${(sensorbean.currPage-1)*sensorbean.pageSize+count.index+1}</td>
                                        <td align="center">${devicename}</td>
                                        <td align="center">${devicepartsID}</td>
                                        <td align="center">${sensor.cdyp}</td>
                                        <td align="center">${sensor.cdwp}</td>
                                        <td align="center">${sensor.cdwy}</td>
                                        <td align="center">${sensor.cdX}</td>
                                        <td align="center">${sensor.cdY}</td>
                                        <td align="center">${sensor.date}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                    <%--分页--%>
                    <nav class="pagination-sm text-right" style="padding-right: 10px">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=1">首页</a>
                            </li>
                            <c:if test="${sensorbean.totalPage!=0}">
                                <%--判断当前页是否为首页--%>
                                <c:if test="${sensorbean.currPage==1}">
                                    <li class="disabled">
                                        <a class="page-link" href="javascript:void(0)">上一页</a>
                                    </li>
                                </c:if>

                                <c:if test="${sensorbean.currPage!=1}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=${sensorbean.currPage-1}">上一页</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${sensorbean.currPage-5>=0?sensorbean.currPage-1:1}" end="${sensorbean.currPage+4>sensorbean.totalPage?sensorbean.totalPage:sensorbean.currPage+4 }" var="n">
                                    <%--判断是否是当前页--%>
                                    <c:if test="${sensorbean.currPage==n}">
                                        <li class="active"><a href="javascript:void(0)">${n}</a> </li>
                                    </c:if>
                                    <c:if test="${sensorbean.currPage!=n}">
                                        <li class="page-item"><a href="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=${n}">${n}</a></li>
                                    </c:if>
                                </c:forEach>

                                <%--判断是否是最后一页--%>
                                <c:if test="${sensorbean.currPage==sensorbean.totalPage}">
                                    <li class="disabled">
                                        <a class="page-link" href="javascript:void(0)">下一页</a>
                                    </li>
                                </c:if>
                                <c:if test="${sensorbean.currPage!=sensorbean.totalPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=${sensorbean.currPage+1}">下一页</a>
                                    </li>
                                </c:if>
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=${sensorbean.totalPage}">尾页</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
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
    function Datetime() {
        $('#datetimeStart').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd hh:mm:ss',//显示格式
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });
        $('#datetimeEnd').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd hh:mm:ss',//显示格式
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });
    }
    function checkhistoryform() {
        var datetimeStart = $("#datetimeStart").val();
        var datetimeEnd = $("#datetimeEnd").val();
        if(datetimeEnd <datetimeStart||datetimeStart==""||datetimeEnd==""){
            alert("请确认时间是否正确！");
            return false;
        }
        var devicename = $("#devicename").val();
        var devicepartsID = $("#devicepartsID").val();
        if(devicename=="--请选择--"){
            alert("请输入设备型号！")
            return false;
        }
        if(devicepartsID=="--请选择--"){
            alert("请输入查询部件！")
            return false;
        }
        return true;
    }
</script>
<%--请求获取个人用户所有的设备信息--%>
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
<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
</body>
</html>




