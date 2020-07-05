<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'parameteredit.jsp' starting page</title>
    
			<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
$(top.hangge());
	//保存
	function save(){
		
		var IID = document.getElementById("SerialID");
		var Name = document.getElementById("Name");
		var Number = document.getElementById("Number");
		
		var iid=IID.value;
		var name=Name.value;
		var number=Number.value;
		alert(Number.value);
	    document.getElementById("welcomeForm").action="parameterupdate?SerialID="+iid+"&Name="+name+"&Number="+number;
		
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		parent.location.reload();
	}
	
</script>


  </head>
  
  <body>
<div class="container">
	<form:form commandName="parameter1" action="parameterupdate" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post">
			<div id="zhongxin">
			<fieldset>
			
				<form:hidden path="SerialID" id="SerialID" placeholder="SerialID"  title="机器ID"/>
				<div class="control-group">
					<label class="control-label" for="Name">物料名称</label>
						<div class="controls">
							<form:input path="Name" id="Name" placeholder="Name" readonly="true"  title="物料名称"/>
						</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="Number">物料名称</label>
						<div class="controls">
							<form:input path="Number" id="Number" placeholder="Number" title="摆放数量"/>
						</div>
				</div>
				
				</fieldset>
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>	
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form:form>
	</div>
  </body>
</html>
