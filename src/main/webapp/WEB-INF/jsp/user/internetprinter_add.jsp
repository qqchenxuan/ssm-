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
    <title>添加</title> 
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
  </head>
  <script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#IID").val()==""){
			
			$("#IID").tips({
				side:3,
	            msg:'请输入称号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#IName").focus();
			return false;
		}		
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
	var IAddTiem=document.getElementById("IAddTiem");
	var iaddtiem=IAddTiem.value;
	var IRamark=document.getElementById("IRamark");
	var iramark=IRamark.value;
    document.getElementById("welcomeForm").action="internetPrinterAdd?role="+role1+"&IID="+iid+"&IName="+iname+"&PrintIp="+printIP+"&IAddTiem="+iaddtiem+"&IRamark="+iramark;
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	function close(url){
		alert(1)
		var flag = false;
		if(confirm("确定退出添加界面?")){
			flag = true;
		}
		if(flag){
			location.href=url; 
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		}
	}	
</script>
 <body>
	<form  action="" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post" >
		
		<div id="zhongxin" >
		<table>
			<tr>
			   <td><input type="text" name="IID" id="IID" placeholder="这里输入手持端ID" title="机器ID"/></td></tr>
			<tr>
				<td><input type="text" name="IName" id="IName" placeholder="这里输入手持端名称" title="机器名称 "/></td></tr>
			<tr>
				<td><input type="text" name="PrintIP" id="PrintIP" placeholder="这里输入手持端IP" title="机器IP "/></td></tr>
			<tr>
				<td><input type="text" name="IAddTiem" id="IAddTiem" placeholder="这里输入添加时间" title="添加时间 "/></td></tr>
			<tr>
				<strong><p>请选择添加的物料</p></strong>
				<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="前排坐垫面套;"><span class="lbl">前排坐垫面套</span>
					</label>
			
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="前排靠背面套;"><span class="lbl">前排靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="前排坐垫骨架;"><span class="lbl">前排坐垫骨架</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="前排靠背骨架;"><span class="lbl">前排靠背骨架</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="插单物料排序单;"><span class="lbl">插单物料排序单</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="前排线束;"><span class="lbl">前排线束</span>
					</label>
					<label>
						<input name="IRole"  class="ace-checkbox-2" type="checkbox" value="前排大背板;"><span class="lbl">前排大背板</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后40靠背面套;"><span class="lbl">后40靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后60靠背面套;"><span class="lbl">后60靠背面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后坐垫坐垫面套;"><span class="lbl">后坐垫坐垫面套</span>
					</label>
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后60扶手套;"><span class="lbl">后60扶手</span>
					</label>		
					<label>
						<input name="IRole" class="ace-checkbox-2" type="checkbox" value="后60中头枕;"><span class="lbl">后60中头枕</span>
					</label>	
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后40侧头枕;"><span class="lbl">后40侧头枕</span>
					</label>	
					<label>
						<input name="IRole" class="ace-checkbox-2"  type="checkbox" value="后60侧头枕;"><span class="lbl">后60侧头枕</span>
					</label>	
				</tr>
			<tr>
				<td><input type="text" name="IRamark" id="IRamark" placeholder="这里输入终端" title="终端 "/></td></tr>	
			</tr>
			<tr>
				<td style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="close('internetprinter');">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
</html>
