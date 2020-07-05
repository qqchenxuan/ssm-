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
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#SID").val()==""){
			
			$("#SID").tips({
				side:3,
	            msg:'请输入称号WW',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#SName").focus();
			return false;
		}


    document.getElementById("welcomeForm").action="ordermanagement/ordermanagementAdd.do?role="+role1; 	
		
		
		
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	
</script>


<body>
	<form  action="ordermanagement/add.do" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post" >
		
		<div id="zhongxin">
		<table>
			<tr>
			   <td><input type="text" name="co_no" id="co_no" placeholder="这里输入车身号" title="车身号"/></td></tr>
			<tr>
				<td><input type="text" name="all_no" id="all_no" placeholder="这里输入车型" title="车型 "/></td></tr>
			<tr>
				<td><input type="text" name="ClientIP" id="ClientIP" placeholder="这里输入后排坐垫面套:" title="后排坐垫面套: "/></td></tr>
			<tr>
				<td><input type="text" name="SAddTiem" id="SAddTiem" placeholder="这里输入后排40%靠背面套" title="后排40%靠背面套 "/></td></tr>
			<tr>
				<td><input type="text" name="SAddTiem" id="SAddTiem" placeholder="这里输入后排60%靠背面套" title="后排60%靠背面套 "/></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入后排中央扶手" title="后排中央扶手 "/></td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入后排中央头枕" title="后排中央头枕 "/></td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入后排40%侧头枕" title="后排40%侧头枕 "/></td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入后排60%侧头枕" title="后排60%侧头枕 "/></td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排靠背骨架-主驾" title="前排靠背骨架-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排靠背骨架-副驾" title="前排靠背骨架-副驾"/>
				</td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排线束-主驾" title="前排线束-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排线束-副驾" title="前排线束-副驾"/>
				</td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排坐垫面套-主驾" title="前排坐垫面套-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排坐垫面套-副驾" title="前排坐垫面套-副驾"/>
				</td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排坐盆骨架-主驾" title="前排坐盆骨架-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排坐盆骨架-副驾" title="前排坐盆骨架-副驾"/>
				</td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排靠背面套-主驾" title="前排靠背面套-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入前排靠背面套-副驾" title="前排靠背面套-副驾"/>
				</td></tr>
			<tr>
				<td><input type="text" name="SRamark" id="SRamark" placeholder="这里输入大背板-主驾" title="大背板-主驾"/>
				    <input type="text" name="SRamark" id="SRamark" placeholder="这里输入大背板-副驾" title="大背板-副驾"/>
				</td></tr>
			
	
			
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
</body>
</html>