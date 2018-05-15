
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body>
<jsp:include page="mainboard.jsp"></jsp:include>
<%--维修报告--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            维护记录查询
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">设备维护</li>
        </ol>
    </section>
    <section class="content">
        <%--主界面content--%>
        <div class="row">
           <form action="#">
               <div class="col-md-6 text-left" style="padding-top: 8px" >
                   <span><b>选择查询的设备型号:</b></span>
                   <input list="deviceID" type="text">
                   <datalist id="deviceID">
                       <option value="QYUX1">QYUX1</option>
                       <option value="QYUX2">QYUX2</option>
                       <option value="QYUX3">QYUX3</option>
                       <option value="QYUX4">QYUX4</option>
                   </datalist>
               </div>
               <div class="col-md-6 text-left" style="padding-top: 8px" action="#">
                   <span><b>输入查询时间段：</b></span>
                   <input size="16" value="" type="text" id="datetimeStart" onclick="Datetime()">
                   --
                   <input size="16" value="" type="text" id="datetimeEnd" onclick="Datetime()">
                   <input type="button" class="bg-red-gradient text-black" value="查询">
               </div>
           </form>

        </div>
        <div class="row" style="padding-top: 40px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table text-center" style="background:rgb(255,255,255)">
                            <thead>
                            <tr>
                                <th>
                                    序列
                                </th>
                                <th>
                                    时间
                                </th>
                                <th>
                                    维护部件
                                </th>
                                <th>
                                    维护方式
                                </th>
                                <th>
                                    维护人员
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    #
                                </td>
                                <td>
                                    #
                                </td>
                                <td>
                                    #
                                </td>
                                <td>
                                    #
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <nav class="pagination-sm" style="padding-right: 20px">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#">Previous</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">5</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
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
    function Datetime() {
        $('#datetimeStart').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd hh:mm',//显示格式
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });
        $('#datetimeEnd').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd hh:mm',//显示格式
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
        });
    }
</script>
<script type="text/javascript" src="/js/jquery-2.2.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
</body>
</html>
