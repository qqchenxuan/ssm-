<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>My JSP 'internetprinteredit.jsp' starting page</title>   
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
<script type="text/javascript">
$(top.hangge());
	//保存
	function save(){	
		var role=document.getElementsByName("IRole");
		var role1="";
		for(var i=0;i<role.length;i++)
		{
		if(role[i].checked==true)
		{
		role1+=role[i].value;
		}
		}
		alert(role1);		
		var IID=document.getElementById("IID");
		var iid=IID.value;
		var IName=document.getElementById("IName");
		var iname=IName.value;
		var PrintIP=document.getElementById("PrintIP");
		var printIP=PrintIP.value;
		var IAddTiem=document.getElementById("IAddTime");
		var iaddtiem=IAddTiem.value;
		var IRamark=document.getElementById("IRamark");
		var iramark=IRamark.value;
		alert(IID.value);
	    document.getElementById("welcomeForm").action="internetPrinterupdate?role="+role1+"&IID="+iid+"&IName="+iname+"&PrintIp="+printIP+"&IAddTiem="+iaddtiem+"&IRamark="+iramark; 
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
  </head>
  <body>
<form action="internetPrinterupdate" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post">
			<div id="zhongxin">
			<table>
			<tr>
					<strong><p>修改网络配置物料</p></strong>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="前排坐垫面套;" ${status.前排坐垫面套} type="checkbox"><span class="lbl">前排坐垫面套</span>
					</label>
						<input name="IRole" class="ace-checkbox-2" value="前排靠背面套;" ${status.前排靠背面套} type="checkbox"><span class="lbl">前排靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="前排坐垫骨架;" ${status.前排坐垫骨架} type="checkbox"><span class="lbl">前排坐垫骨架</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="前排靠背骨架;" ${status.前排靠背骨架} type="checkbox"><span class="lbl">前排靠背骨架</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="插单物料排序单;" ${status.插单物料排序单} type="checkbox"><span class="lbl">插单物料排序单</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="前排线束;" ${status.前排线束} type="checkbox"><span class="lbl">前排线束</span>
					</label>
					<label>
						<input name="IRole"  class="ace-checkbox-2" value="前排大背板;" ${status.前排大背板} type="checkbox"><span class="lbl">前排大背板</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后40靠背面套;" ${status.后40靠背面套} type="checkbox"><span class="lbl">后40靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后60靠背面套;" ${status.后60靠背面套} type="checkbox"><span class="lbl">后60靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后坐垫坐垫面套;" ${status.后坐垫坐垫面套} type="checkbox"><span class="lbl">后坐垫坐垫面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后60扶手;" ${status.后60扶手} type="checkbox"><span class="lbl">后60扶手</span>
					</label>		
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后60中头枕;" ${status.后60中头枕} type="checkbox"><span class="lbl">后60中头枕</span>
					</label>	
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后40侧头枕;" ${status.后40侧头枕} type="checkbox"><span class="lbl">后40侧头枕</span>
					</label>	
					<label>
						<input name="IRole" class="ace-checkbox-2" value="后60侧头枕;" ${status.后60侧头枕} type="checkbox"><span class="lbl">后60侧头枕</span>
					</label>
					</tr>
				<input type="hidden" name="IID" id="IID" placeholder="IID" value="${internetprinter1.IID}" title="机器ID"/>
				<tr>
				<td>机器名称:</td>
				<td><input type="text" name="IName" id="IName" placeholder="IName" value="${internetprinter1.IName}" title="机器名称"/></td>
				</tr>
				<tr>
				<td>机器 IP:</td>
				<td><input type="text" name="PrintIP" id="PrintIP" placeholder="PrintIP" value="${internetprinter1.printIP}" title="机器IP"/>	</td>			
				</tr>
				<tr>
				<td>时间:</td>
				<td><input type="text" name="IAddTime" id="IAddTime" placeholder="IAddTime" value="${internetprinter1.IAddTime}" title="添加时间"/></td>	
				</tr>
				<tr>
				<td>终  端:</td>
				<td><input type="text" name="IRamark" id="IRamark" placeholder="IRamark" value="${internetprinter1.IRamark}" title="终端"/></td>
				</tr>
				<tr>
				<td style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form>
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->	
</body>
</html>
