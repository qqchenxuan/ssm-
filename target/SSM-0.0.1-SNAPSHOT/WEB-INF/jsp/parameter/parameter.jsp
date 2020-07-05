<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title></title>
    
	<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/dialog.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
             $(top.hangge());	
     //修改
	function edit(url){
		var d = dialog({
	         title: '物料摆放数量修稿',
	         content: '<'+'iframe id="newFream" frameborder="0" src="'+url+'" height="180" width="240"></'+'iframe>',
	         cancelValue: '取消',
           cancel: function() {}
	     });
		d.showModal();
	}
	
		//function up(SerialID){
		//alert("sssssss");
		  // window.location.href="<%=basePath%>parameter/up?serialID="+serialID;
//	}
	
	//function down (SerialID){
	//	alert("sssssss");
	//	   window.location.href="<%=basePath%>parameter/down?serialID="+serialID;
//	}

    


	
</script>

  </head>
  
  <body>
  <h3 class="page-header">物料订单参数配置</h3>

  <table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>

			<th class='center'>序号</th>
			<th class="center">物料名称</th>
			<th class="center">摆放数量</th>
			<th class="center">操作</th>
			<th class="center">调整顺序</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="record" varStatus="vs">
				<tr>
				<td class="center" >${record.serialID} </td>
				<td class="center" >${record.name} </td>
				<td class="center" >${record.number} </td>

				<td style="width: 200px;">
				<!-- <a class='btn btn-mini btn-info' title="编辑" onclick="edit('${record.serialID }')" ><i class='icon-edit'></i></a> -->
				<a class="btn btn-small btn-success" onclick="edit('turnparameterupdate?serialID=${record.serialID}&name=${record.name}&number=${record.number}')">编辑</a>
				</td>
				
				<td style="width: 200px;">

				<a class="btn btn-small btn-success" href="move?serialID=${record.serialID}&direction=up" >上升</a>
				<a class="btn btn-small btn-success" href="move?serialID=${record.serialID}&direction=down">下降</a>
				</td>

				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
    
  </body>
</html>
