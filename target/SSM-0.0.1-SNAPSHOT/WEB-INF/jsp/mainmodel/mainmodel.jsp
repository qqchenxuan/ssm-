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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
             $(top.hangge());
			function getSingle(para)
			{
				$.post("<%=basePath%>ordermanagement/printOne",{para:para});
				location.reload()
			} 
			
			function getSingleo(para){            
	            $.ajax({
	                type:"POST",
	                url:'<%=basePath%>ordermanagement/printOne',
	                //paraschuanjilaide cahsnhu 
	                data:{"para":para},
	                success:function(msg){

alert(msg);
	                },
	                error:function(e){
	                    alert("fff！");                   
	                }
	            });
	        }
			function add(url){
				location.href=url
			}

			
	    </script>

    </script>

  </head>
  
  <body>
  <br>
  <br>
  
  <form action="<%=basePath%>searchOrder.do" method="post">
 <table>
 <tr>
   <td>输入要查询的车身号：</td>
   <td><input id="co_no" name="co_no"></td>
   <br>
    <td>输入开始时间：</td>
    <td><input id="co_strarttime" name="co_strarttime" width="100" type="date" /></td>&nbsp;&nbsp;&nbsp;
    <td>输入结束时间：</td>
    <td><input id="co_endtime" name="co_endtime"  width="100" type="date" /></td>    
   <td style="vertical-align:top;"><button
	class="btn btn-mini btn-info" type="submit">查询</button></td>
  </tr>
  </table>
 </form>
  
      <!--  车身号：<input id="csh"  name="csh" type="text"/>&nbsp;&nbsp;&nbsp;
       时间选择：<input name="starttime"  width="150" type="date" />&nbsp;&nbsp;至&nbsp;&nbsp;
        <input name="endtime" width="100" type="date" />
        <a class="btn btn-small btn-success" onclick="Search();">查询</a> -->
        <br>
          <br>
        <a class="btn btn-small btn-success" onclick="add('toadd');">新增</a>
        <a class="btn btn-small btn-success" href="ordermanagement">刷新</a>
        <br>
          <br>
   <table id="table_report" class="table table-striped table-bordered table-hover">
   
		<thead>

		<tr>

			<th class='center' rowspan="2">序号</th>
			<th class="center" rowspan="2">车身号</th>
			<th class="center" rowspan="2">车型</th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=靠背面套">前排靠背面套</a></th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=坐垫面套">前排坐垫面套</a> </th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=坐垫骨架">前排坐盆骨架</a></th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=靠背骨架">前排靠背骨架</a></th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=线束">前排线束</a> </th>
			<th class="center" colspan="2"><a href="<%=basePath%>printOne?para=大背板">大背板</a> </th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=40靠背">后排40%靠背面套</a> </th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=60靠背">后排60%靠背面套 </a></th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=后坐垫">后排坐垫面套 </a></th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=后排中央扶手">后排中央扶手</a> </th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=后排中央头枕">后排中央头枕</a></th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=40侧头枕">后排40%侧头枕</a> </th>
			<th class="center" rowspan="2"><a href="<%=basePath%>printOne?para=60侧头枕">后排60%侧头枕</a> </th>
			<th class="center" rowspan="2">查单打印</th>
		</tr>
			<tr>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
			<th class="center">主驾</th>
			<th class="center">副驾</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				 <c:forEach items="${list}" var="record" varStatus="vs">
					<tr>
						<td>
						${record.序号}
						</td>
						<td>
						${record.车身号}
						</td>
						<td>
						${record.车型}
						</td>
						<td>
						${record.靠背面套主驾}
						</td>
						<td>
						${record.靠背面套副驾}
						</td>
						<td>
						${record.坐垫面套主驾}
						</td>              
						<td>               
						${record.坐垫面套副驾}
						</td>
						<td>
						${record.坐垫骨架主驾}
						</td>              
						<td>               
						${record.坐垫骨架副驾}
						</td>
						<td>
						${record.靠背骨架主驾}
						</td>              
						<td>               
						${record.靠背骨架副驾}
						</td>
						<td>
						${record.线束主驾}
						</td>          
						<td>           
						${record.线束副驾}
						</td>
						<td>
						${record.大背板主驾}
						</td>            
						<td>             
						${record.大背板副驾}
						</td>
						<td>
						${record._40靠背}
						</td>
						<td>
						${record._60靠背}
						</td>
						<td>
						${record.后坐垫}
						</td>
						<td>
						${record.后排中央扶手}
						</td>
						<td>
						${record.后排中央头枕}
						</td>
						<td>
						${record._40侧头枕}
						</td>
						<td>
						${record._60侧头枕}
						</td>
						<td>
                        <a class="btn btn-small btn-success" href="<%=basePath%>printRow?para=${record.车身号}">打印</a></td>
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
  
  </body>
</html>
