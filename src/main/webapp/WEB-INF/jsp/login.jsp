<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from condorthemes.com/cleanzone/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:32 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="l_static/images/favicon.png">

    <title>物料订单排序管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="l_static/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link href="l_static/css/style.css" rel="stylesheet" />

</head>

<body class="texture">

<div id="cl-wrapper" class="login-container">

    <div class="middle-login">
        <div class="block-flat">
            <div class="header">
                <h3 class="text-center">物料订单排序管理系统</h3>
            </div>
            <div>
                <form style="margin-bottom: 0px !important;" class="form-horizontal" action="">
                    <div class="content">
                        <h4 class="title">填写登录信息：</h4>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" placeholder="Username" name="username" id="username" value="admin" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="password" placeholder="Password" name="password" id="password" class="form-control">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="foot">
                        <i id="errorInfo" style="color: red"></i>
                        <a class="btn btn-primary" data-dismiss="modal" onclick="javascript:subTo()">Log me in</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="text-center out-links"><a href="#">&copy; 2013 Your Company</a></div>
    </div>

</div>

<script src="l_static/js/jquery.js"></script>
<script type="text/javascript" src="l_static/js/behaviour/general.js"></script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="l_static/js/behaviour/voice-commands.js"></script>
<script src="l_static/js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="l_static/js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="l_static/js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="l_static/js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="l_static/js/jquery.flot/jquery.flot.labels.js"></script>
</body>

<!-- Mirrored from condorthemes.com/cleanzone/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:32 GMT -->
</html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="application/javascript">
    function subTo(){
        var username=$("#username").val();
        var password=$("#password").val();
        var  data={username:username,password:password};
        console.log(data);
        $.post("<%=basePath%>login",data,function (dataa) {
            console.log(dataa);
            if (dataa.isok==true){
                window.location.href=("<%=basePath%>index");
            }else{
                $("#errorInfo").empty();
                $("#errorInfo").append(dataa.errorInfo);
            }
        })
    }
</script>
