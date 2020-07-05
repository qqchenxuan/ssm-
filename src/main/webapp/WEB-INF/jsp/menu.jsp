<%@page import="com.ssm.entity.User"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="sidebar-collapse">
    <ul class="nav" id="side-menu">
        <li class="nav-header">
            <div class="dropdown profile-element">

                 <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">当前用户：
                                   <%  User cuser=((com.ssm.entity.User)session.getAttribute("curUser"));
                                       if (cuser!=null){%>
                                        <%=cuser.getUsername()%>
                                   <%}else{%>
                                        <script type="text/javascript">
                                            alert("登录已失效,请重新登录!");
                                            window.top.location.href='<%=basePath%>toLogin';
                                        </script>
                                   <%}%>
                               </strong></span>
                 </span>
                </a>
            </div>
            <div class="logo-element">物料订单排序管理系统
            </div>
        </li>

    </ul>
</div>

<script type="application/javascript">
    $.post("<%=basePath%>getMenu",null,function (data) {
        var result=data.result;
        for (var i = 0; i < result.length; i++) {
            var str="        <li>\n" +
                "            <a href=\"<%=basePath%>"+result[i].menuUrl+"\" target=\"mainFrame\">\n" +result[i].menuName+
                "            </a>\n" +
                "        </li>";
            $("#side-menu").append(str);
        }
    });
</script>