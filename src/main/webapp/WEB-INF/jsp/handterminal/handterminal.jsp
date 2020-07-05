 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
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
		<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/dialog.js"></script>
<script type="text/javascript">
	$(top.hangge());	
	 
 
	function add(){
		var d = dialog({
	         title: '手持端添加页面',
	         content: '<'+'iframe id="newFream" frameborder="0" src="handterminalAdd" height="650" width="350"></'+'iframe>',
	         cancelValue: '取消',
             cancel: function() {}
	     });
		d.showModal();
	} 

	//修改
	/* function edit(url){
	location.href=url;
	} */
	function edit(url){
		var d = dialog({
	         title: '手持端修改页面',
	         content: '<'+'iframe id="newFream" frameborder="0" src="'+url+'" height="650" width="350"></'+'iframe>',
	         cancelValue: '取消',
             cancel: function() {}
	     });
		d.showModal();
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
	
	//跳转到添加对话框
	$(function(){
		$('#login-model').model({
			show: false,
			backdrop: false,
			remote :'handterminalAdd'
		})
	})
	

	
</script>

  </head>
  
  <body style="height: 213px; ">
  
  	<h3 class="page-header">手持终端管理</h3>
  
  
  	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<!-- <th class="center"  style="width: 50px;">ID</th> -->
			<th class='center'>手持端ID</th>
			<th class="center">手持端名称</th>
			<th class="center">手持端IP</th>
			<th class="center">插入时间</th>
			<th class="center">权限范围</th>
			<th class="center">终端</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="record" varStatus="vs">
				<tr>
				<td class="center" >${record.SID} </td>
				<td class="center" >${record.SName} </td>
				<td class="center" >${record.clientIP} </td>
				<td class="center" >${record.SAddTime} </td>
				<td class="center" >${record.SRole} </td>
				<td class="center" >${record.SRamark} </td>
				<td style="width: 68px;">
				<a class='btn btn-mini btn-info' title="编辑" onclick="edit('toupdate?SID=${record.SID }&SName=${record.SName }&clientIP=${record.clientIP }&SAddTime=${record.SAddTime}&SRole=${record.SRole }&SRamark=${record.SRamark}')" ><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-danger' title="删除"  onclick="del('handterminaldelete?SID=${record.SID }')"><i class='icon-trash'></i></a>
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
			&nbsp;&nbsp;<button class="btn btn-small btn-success" onclick="add()">新增</button>
	
		</div>
	</div>
	<div class="modal fade" id="login-modal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
			</div>
		</div>
	</div>
	
	
  </body>
</html>
