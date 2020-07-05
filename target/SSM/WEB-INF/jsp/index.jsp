<%@ page import="com.ssm.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>物料订单排序管理系统</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="model/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="model/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="model/css/animate.min.css" rel="stylesheet">
    <link href="model/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script src="model/js/jquery.min63b9.js?v=2.1.4"></script>
    <script src="model/js/bootstrap.min14ed.js?v=3.3.6"></script>
    <script src="model/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="model/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="model/js/plugins/layer/layer.min.js"></script>
    <script src="model/js/hplus.min862f.js?v=4.1.0"></script>
    <script type="text/javascript" src="model/js/contabs.min.js"></script>
    <script src="model/js/plugins/pace/pace.min.js"></script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <%@ include file="menu.jsp"%>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" style="margin: 10px"  name="mainFrame" id="mainFrame"  frameborder="0" width="100%" height="100%" src="<%=basePath%>welcome"></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="http://www.zi-han.net/" target="_blank"></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>