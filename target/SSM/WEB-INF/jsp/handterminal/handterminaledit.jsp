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
		
		
		var role=document.getElementsByName("SRole");
		var role1="";
		for(var i=0;i<role.length;i++)
		{
		if(role[i].checked==true)
		{
		role1+=role[i].value;
		}
		}
		alert(role1);
		
		var SID=document.getElementById("SID");
		var sid=SID.value;
		alert(SID.value);
		var SName=document.getElementById("SName");
		var sname=SName.value;
		var ClientIP=document.getElementById("ClientIP");
		var clientip=ClientIP.value;
		var SAddTiem=document.getElementById("SAddTiem");
		var saddtiem=SAddTiem.value;
		var SRamark=document.getElementById("SRamark");
		var sramark=SRamark.value;
	    document.getElementById("welcomeForm").action="handterminalupdate?role="+role1+"&SID="+sid+"&SName="+sname+"&ClientIP="+clientip+"&SAddTiem="+saddtiem+"&SRamark="+sramark; 	
			
			$("#welcomeForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			
			parent.location.reload();
		}
	
</script>
	</head>
<body>
<%


 %>
<div class="container">
		<form  class="form-horizontal" action="handterminalupdate" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post">
				<div id="zhongxin">
	              
					<fieldset>
						<legend>修改物料信息</legend>	
						<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="前排坐垫面套;" ${status.前排坐垫面套} type="checkbox"><span class="lbl">前排坐垫面套</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="前排靠背骨架;" ${status.前排靠背骨架} type="checkbox"><span class="lbl">前排靠背骨架</span>
						</label >
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="插单物料排序单;" ${status.插单物料排序单} type="checkbox"><span class="lbl">插单物料排序单</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="前排靠背面套;" ${status.前排靠背面套} type="checkbox"><span class="lbl">前排靠背面套</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="前排坐垫骨架;" ${status.前排坐垫骨架} type="checkbox"><span class="lbl">前排坐垫骨架</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="前排线束;" ${status.前排线束} type="checkbox"><span class="lbl">前排线束</span>
						</label>
											<label class="control-label">
							<input name="SRole"  class="ace-checkbox-2" value="前排大背板;" ${status.前排大背板} type="checkbox"><span class="lbl">前排大背板</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后40靠背面套;" ${status.后40靠背面套} type="checkbox"><span class="lbl">后40靠背面套</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后60靠背面套;" ${status.后60靠背面套} type="checkbox"><span class="lbl">后60靠背面套</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后排坐垫面套;" ${status.后排坐垫面套} type="checkbox"><span class="lbl">后排坐垫面套</span>
						</label>
											<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后60扶手;" ${status.后60扶手} type="checkbox"><span class="lbl">后60扶手</span>
						</label>		
																<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后60中头枕;" ${status.后60中头枕} type="checkbox"><span class="lbl">后60中头枕</span>
						</label>	
																<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后40侧头枕;" ${status.后40侧头枕} type="checkbox"><span class="lbl">后40侧头枕</span>
						</label>	
						<label class="control-label">
							<input name="SRole" class="ace-checkbox-2" value="后60侧头枕;" ${status.后60侧头枕} type="checkbox"><span class="lbl">后60侧头枕</span>
						</label>	
					<legend>修改手持端信息</legend>
					<input type="hidden" name="SID" id="SID" placeholder="SID" value="${handterminal1.SID}" title="ID"/>
					<div class="control-group">
						<label class="control-label" for="SName">手持端名称</label>
							<div class="controls">
								<input type="text" name="SName" id="SName" placeholder="SName" value="${handterminal1.SName}" title="手持端名称"/>
							</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="ClientIP">手持端IP</label>
							<div class="controls">
								<input type="text" name="ClientIP" id="ClientIP" placeholder="ClientIP" value="${handterminal1.clientIP}" title="手持端IP"/>	
							</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="SAddTiem">插入时间</label>
							<div class="controls">
								<input type="text" name="SAddTiem" id="SAddTiem" placeholder="SAddTiem" value="${SAddTime}" title="插入时间"/>
							</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="SRamark">终端</label>
							<div class="controls">
								<input type="text" name="SRamark" id="SRamark" placeholder="SRamark" value="${handterminal1.SRamark}" title="终端"/>
							</div>
					</div>					
					</fieldset>
						<div class="form-actions">
							<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						</div>
				
				</div>
				<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
			</form>
	</div>
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	
</body>
</html>