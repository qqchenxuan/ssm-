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
		<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/dialog.js"></script>
</head>

<script type="text/javascript">
	
	//保存
    $(function() {
    $('#save').on('click', function() {
        
	if($("#SID").val()==""){
				
				$("#SID").tips({
					side:3,
		            msg:'请输入称号WW',
		            bg:'#AE81FF',
		            time:2
		        });;;
	
				$("#SName").focus();
				return false;
			}
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
		var SName=document.getElementById("SName");
		var sname=SName.value;
		var ClientIP=document.getElementById("ClientIP");
		var clientip=ClientIP.value;
		var SAddTiem=document.getElementById("SAddTiem");
		var saddtiem=SAddTiem.value;
		var SRamark=document.getElementById("SRamark");
		var sramark=SRamark.value;
	    document.getElementById("welcomeForm").action="toAdd?role="+role1+"&SID="+sid+"&SName="+sname+"&ClientIP="+clientip+"&SAddTiem="+saddtiem+"&SRamark="+sramark; 	
		$("#welcomeForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	    parent.location.reload(); 
	    
    });
    });
</script>


<body>

	<div class="container">
	
		<form  class="form-horizontal" action="" enctype="multipart/form-data" name="welcomeForm" id="welcomeForm" method="post" >
			<div id="zhongxin">	
		
			<fieldset>
			<legend>添加网络配置物料</legend>
				<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="前排坐垫面套;"><span class="lbl">前排坐垫面套&#12288</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="前排靠背面套;"><span class="lbl">前排靠背面套&#12288</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="前排坐垫骨架;"><span class="lbl">前排坐垫骨架&#12288</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="前排靠背骨架;"><span class="lbl">前排靠背骨架&#12288</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="插单物料排序单;"><span class="lbl">插单物料排序单</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="前排线束;"><span class="lbl">前排线束</span>
					</label>
					<label class="control-label">
						<input name="SRole"  class="ace-checkbox-2" type="checkbox" value="前排大背板;"><span class="lbl">前排大背板</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后40靠背面套;"><span class="lbl">后40靠背面套</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后60靠背面套;"><span class="lbl">后60靠背面套</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后排坐垫面套;"><span class="lbl">后排坐垫面套</span>
					</label>
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后60扶手套;"><span class="lbl">后60扶手</span>
					</label>		
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2" type="checkbox" value="后60中头枕;"><span class="lbl">后60中头枕</span>
					</label>	
															<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后40侧头枕;"><span class="lbl">后40侧头枕</span>
					</label>	
					<label class="control-label">
						<input name="SRole" class="ace-checkbox-2"  type="checkbox" value="后60侧头枕;"><span class="lbl">后60侧头枕</span>
					</label>
					<legend>添加网络配置信息</legend>
					<div class="control-group">
					
						<div class="controls">
							<input type="text" name="SID" id="SID" placeholder="这里输入手持端ID" title="手持端ID"/>
						</div>
				</div>
				<div class="control-group">
					
						<div class="controls">
							<input type="text" name="SName" id="SName" placeholder="这里输入手持端名称" title="手持端名称 "/>
						</div>
				</div>	
				<div class="control-group">
					
						<div class="controls">
							<input type="text" name="ClientIP" id="ClientIP" placeholder="这里输入手持端IP" title="手持端IP "/>
						</div>
				</div>
				<div class="control-group">
					
						<div class="controls">
							<input type="text" name="SAddTiem" id="SAddTiem" placeholder="这里输入添加时间" title="添加时间 "/>
						</div>
				</div>
				<div class="control-group">
			
						<div class="controls">
							<input type="text" name="SRamark" id="SRamark" placeholder="这里输入终端" title="终端 "/>					
						</div>
				</div>
				</fieldset>
					<div class="form-actions">
							<a class="btn btn-mini btn-primary" id="save" onclick="save();">保存</a>
					</div>

			</div>
				

			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		</form>
	</div>
</body>
</html>