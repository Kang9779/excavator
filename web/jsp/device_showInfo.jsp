<%@ page import="bean.User" %>
<%--设备管理下的设备查询--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
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
<jsp:include page="/jsp/mainboard.jsp"></jsp:include>
   <div class="content-wrapper">
       <section class="content-header">
           <h1>
               用户设备查询
           </h1>
           <ol class="breadcrumb">
               <li><a href="${pageContext.request.contextPath}/page?method=findMainhome"><i class="fa fa-user"></i> 首页</a></li>
               <li class="active">设备管理</li>
           </ol>
       </section>
       <section class="content">
           <div class="box">
               <div class="box-header">
                   <h3 class="box-title">设备基本信息</h3>
               </div>
               <!-- /.box-header -->
               <div class="box-body">
                   <table id="example" class="table table-bordered table-striped">
                       <thead>
                           <tr>
                               <%--<th>编号</th>--%>
                               <th style="text-align: center">设备型号</th>
                               <th style="text-align: center">生产商</th>
                               <th style="text-align: center">模块号</th>
                               <th style="text-align: center">铲斗容量(/L)</th>
                               <th style="text-align: center">净功率(/kw)</th>
                               <th style="text-align: center">负载重量(/kg)</th>
                               <th style="text-align: center">工作时长(/h)</th>
                           </tr>
                       </thead>
                       <tbody align="center">

                       </tbody>
                       <%--<tbody id="tableID">--%>
                       <%--&lt;%&ndash;数据填充&ndash;%&gt;--%>
                       <%--</tbody>--%>
                   </table>
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
</body>
<%--请求获取个人用户所有的设备信息--%>
<%--<script type="text/javascript">--%>
    <%--$.ajax({--%>
        <%--url:"${pageContext.request.contextPath}/device?method=findDeviceByUserID",--%>
        <%--type:"get",--%>
        <%--success: function(data){--%>
            <%--var obj=eval(data);--%>
            <%--var tbody=$('<tbody></tbody>');--%>
            <%--var id = 1;--%>
            <%--$(obj).each(function (index){--%>
                <%--var val=obj[index];--%>
                <%--var tr=$('<tr></tr>');--%>
                <%--tr.append('<td>'+ id + '</td>' + '<td>'+ val.dname + '</td>' +'<td>'+ val.manufacturer + '</td>'+'<td>'+ val.mid + '</td>'+'<td>'+ val.power + '</td>'+--%>
                    <%--'<td>'+ val.capacity + '</td>'+'<td>'+ val.work_weight + '</td>'+'<td>'+ val.work_hours + '</td>');--%>
                <%--tbody.append(tr);--%>
                <%--id=id+1;--%>
            <%--});--%>
            <%--$('#tableID').replaceWith(tbody);--%>
        <%--},--%>
        <%--error:function () {--%>
            <%--alert('用户设备数据获取失败！');--%>
        <%--}--%>
    <%--});--%>
<%--</script>--%>
<!-- jQuery 2.2.3 -->
<script src="/js/jquery-2.2.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>
<script src="/DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
<script src="/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>

<!-- page script -->
<script>
    // $(document).ready(function () {
    //     $("#example").DataTable();
    // })
    //发送Ajax请求，返回Json数据，DataTable数据填充和分页
    $(document).ready(function () {
        $.ajax({
            type:'get',
            dataType:'json',
            url:"${pageContext.request.contextPath}/device?method=findDeviceByUserID",
            success:function (data) {
                $('#example').DataTable({
                    language: {
                        "infoEmpty":"暂无记录",
                        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                        "sSearch": "搜索:",
                        "sProcessing": "处理中...",
                        "sLengthMenu": "显示 _MENU_ 项结果",
                        "sZeroRecords": "没有匹配结果",
                        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                        "sEmptyTable": "表中数据为空",
                        "oPaginate": {
                            "sFirst": "首页",
                            "sPrevious": "上页",
                            "sNext": "下页",
                            "sLast": "末页"
                        },
                        "oAria": {
                            "sSortAscending": ": 以升序排列此列",
                            "sSortDescending": ": 以降序排列此列"
                        }
                    },
                    data:data,
                    columns:[
                        {data:'dname'},
                        {data:'manufacturer'},
                        {data:'mid'},
                        {data:'power'},
                        {data:'capacity'},
                        {data:'work_weight'},
                        {data:'work_hours'}
                    ]
                })
            },
            error:function () {
                alert("设备信息查询失败！")
            }
    })
    })
</script>
</html>
