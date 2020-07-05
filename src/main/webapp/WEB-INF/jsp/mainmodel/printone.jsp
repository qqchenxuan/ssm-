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
		<title>菜单</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/JsBarcode.all.js"></script>
		<script  type="text/javascript" src="static/js/JsBarcode.all.min.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/dialog.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());
	$(JsBarcode("#barcode", "Hi!"));
	//下发
	$(function(){
		$('#')
	})
	function print(url){
		var d = dialog({
	         title: '打印成功',
	         content: '<'+'iframe id="newFream" frameborder="0" src="http://localhost:8080/SSM/'+url+'" height="60" width="150"></'+'iframe>',
	         okValue: '确定',
           	 ok: function() {}
	     });
		d.showModal();
	}
	function issued(url){
		var d = dialog({
	         title: '下发成功',
	         content: '<'+'iframe id="newFream" frameborder="0" src="http://localhost:8080/SSM/'+url+'" height="60" width="150"></'+'iframe>',
	         okValue: '确定',
           	 ok: function() {}
	     });
		d.showModal();
	}
</script>


<body>

	<form  action="" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post" >
		
		<div id="zhongxin">

		<div id="barcode" style="widows: 200px;height: 100px;"></div>
		<h1>${eCode}</h1>
		<br>
		<br>
             <h2>  <c:forEach items="${list1}" var="record" varStatus="vs" begin="1" end="1">
				<tr>
				<td class="center" >物料名称：${record.ljhms}</td>
				
				</tr>
				</c:forEach>
			</h2>
			<br>
			<br>
  
        <a class="btn btn-small btn-success"  href="http://localhost:8080/SSM/ordermanagement">返回</a>
        <a class="btn btn-small btn-success" onclick="print('printmaterial?para=${para}')">手动打印</a>
        <a class="btn btn-small btn-success" onclick="issued('issuedmaterial?para=${para }')">手动下发</a>
		<br>
		<br>
		 <table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class='center'>序号</th>
			<th class="center">车身号</th>
			<th class="center">车型</th>
			<c:if test="${isseat==true}">
				<th class="center">主副驾</th>
			</c:if>
			<th class="center">零件号</th>
			<th class="center">数量</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list1}">
				<c:forEach items="${list1}" var="record" varStatus="vs">
				<tr>
				<td class="center" >${record.xh} </td>
				<td class="center" >${record.csh} </td>
				<td class="center" >${record.cx} </td>
				<c:if test="${isseat==true}">
				<td class="center" >${record.zfj} </td>
			    </c:if>
				<td class="center" >${record.ljh} </td>
				<td class="center" >${record.sl} </td>
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
	
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<div style="float:right; " >
	<span style="background: white;color: black;text-align: center;font-size: larger;">当前第${pd.page}页&nbsp;&nbsp;共${pd.count}页 </span>
		&nbsp;&nbsp;
	<c:if test="${pd.page==1}">
	<a href="${pd.url}&page=1&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >第一页</a>
	</c:if>
	<c:if test="${pd.page!=1}">
	<a href="${pd.url}&page=1&pageSize=${pd.pageSize}" class="btn btn-small btn-success">第一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page<=1}">
	<a href="${pd.url}&page=${pd.page-1}&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >上一页</a>
	</c:if>
	<c:if test="${pd.page>1}">
	<a href="${pd.url}&page=${pd.page-1}&pageSize=${pd.pageSize}" class="btn btn-small btn-success" >上一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page>=pd.count}">
	<a href="${pd.url}&page=${pd.page+1}&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success">下一页</a>
	</c:if>
	<c:if test="${pd.page<pd.count}">
	<a href="${pd.url}&page=${pd.page+1}&pageSize=${pd.pageSize}" class="btn btn-small btn-success" >下一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page==pd.count||pd.count==0}">
	<a href="${pd.url}&page=${pd.page}&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >末一页</a>
	</c:if>
	<c:if test="${pd.page!=pd.count&&pd.count!=0}">
	<a href="${pd.url}&page=${pd.count}&pageSize=${pd.pageSize}" class="btn btn-small btn-success">末一页</a>
	</c:if>
	</div>
	
</body>
</html>