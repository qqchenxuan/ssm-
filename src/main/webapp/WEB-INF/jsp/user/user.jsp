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
<script type="text/javascript">
$(top.hangge());	
	//新增
	function add(url){
	location.href=url; 
	}
	//修改
	function edit(url){
	location.href=url;
	}	
	//删除
	function del(url){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			
			location.href=url; 
		}
	}	
</script>
</head> 
 <body style="height: 213px; ">
 <h3 class="page-header">用户管理</h3>

 <table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<!-- <th class="center"  style="width: 50px;">ID</th> -->
			<th class='center'>机器ID</th>
			<th class="center">机器名称</th>
			<th class="center">机器IP</th>
			<th class="center">插入时间</th>
			<th class="center">打印权限</th>
			<th class="center">终端</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="record" varStatus="vs">
				<tr>
				<td class="center" >${record.id} </td>
				<td class="center" >${record.realname} </td>
				<td class="center" >${record.username} </td>
				<td class="center" >${record.password} </td>
				<td class="center" >${record.rolr} </td>
				<td class="center" >${record.remarks} </td>
				<td style="width: 68px;">
				<a class='btn btn-mini btn-info' title="编辑" onclick="edit('turnupdate?id=${record.id }&realname=${record.realname }&username=${record.username }&password=${record.password}&role=${record.role }&remarks=${record.remarks}')" ><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-danger' title="删除"  onclick="del('internetprinterdelete?id=${record.id }')"><i class='icon-trash'></i></a>
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
    <%@include file="/WEB-INF/jsp/page.jsp" %> 
	<div class="page_and_btn">
		<div>
			&nbsp;&nbsp;<a class="btn btn-small btn-success" onclick="add('turninternetPrinterAdd');">新增</a>
		</div>
	</div>
  </body>
</html>
