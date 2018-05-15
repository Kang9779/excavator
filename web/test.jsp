<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
</head>
<body class="hold-transition skin-yellow sidebar-mini">
<jsp:include page="/jsp/mainboard.jsp"></jsp:include>
<%--设备信息管理区域--%>
<div class="content-wrapper">
    <%--区域header栏目--%>
    <section class="content-header">
        <h1>
            历史记录查询
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">控制台</li>
        </ol>
    </section>
    <%--主界面content--%>
    <section class="content">
        <%--主界面content--%>
        <div class="row">
            <form action="#" method="post" onsubmit="return findSensorByPage()">
            <%--<form action="${pageContext.request.contextPath}/sensor?method=findSensorHistoryInfo&currPage=1" method="post">--%>
                <div class="col-md-12 text-left" style="padding-top: 8px" >
                    <label><b>选择设备型号:</b></label>
                    <select id="devicename" name="devicename">
                        <%--设备型号动态获取--%>
                    </select>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <label><b>选择设备部件:</b></label>
                    <select id="devicepartsID" name="devicepartsID">
                        <option value="斗杆">斗杆</option>
                        <option value="动臂">动臂</option>
                        <option value="铲斗">铲斗</option>
                    </select>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <label><b>输入查询时间段：</b></label>
                    <input size="16" value="" type="text" id="datetimeStart" name="datetimeStart" onclick="Datetime()">
                    --
                    <input size="16" value="" type="text" id="datetimeEnd" name="datetimeEnd" onclick="Datetime()">
                    <button type="submit" class="btn-dropbox">查询</button>
                </div>
            </form>
        </div>
        <div class="row" style="padding-top: 20px;padding-right: 10px;padding-left: 10px">
            <div class="box">
                <div class="box-body">
                    <table id="example" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <%--<th style="text-align: center">序列</th>--%>
                            <th style="text-align: center">时间</th>
                            <th style="text-align: center">有杆腔压力</th>
                            <th style="text-align: center">无杆腔压力</th>
                            <th style="text-align: center">位移</th>
                            <th style="text-align: center">倾角（X）</th>
                            <th style="text-align: center">倾角（Y）</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
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

<!-- jQuery 2.2.3 -->
<script src="/js/jquery-2.2.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>
<script src="/DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
<script src="/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
    var table;
    function tableProcess(url) {
        table = $('#example').DataTable({
            processing: true,                   // 是否显示取数据时的那个等待提示
            serverSide: true,                    //这个用来指明是通过服务端来取数据
            searching:false,
            lengthChange:true,
            destroy: true,
            paginationType:"full_numbers",
            deferRender:true,
            ajax:{
                type:'post',
                url:url,
                dataType:'json',
                dataSrc:
                    function (result) {
                        var data =result.data;
                        return data;
                }
            },
            columns:[
                {data:'date'},
                {data:'dgyp'},
                {data:'dgwp'},
                {data:'dgwy'},
                {data:'dgX'},
                {data:'dgY'}
            ]
        });
    }
    function findSensorByPage() {
        var devicename = $('#devicename').val();
        var devicepartsID = $("#devicepartsID").val();
        var datetimeStart = $("#datetimeStart").val();
        var datetimeEnd = $("#datetimeEnd").val();
        if(datetimeEnd <datetimeStart||datetimeStart==""||datetimeEnd==""){
            alert("请确认时间是否正确！");
            return false;
        }
        var url = "${pageContext.request.contextPath}"+"/sensor?method=findSensorHistoryInfo&devicename="+devicename+"&datetimeStart="+datetimeStart+"&datetimeEnd="+datetimeEnd;
        if(table!=null||table!=undefined){
            table.ajax.reload();
        }
        else {
            tableProcess(url);
        }
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

</body>
</html>




