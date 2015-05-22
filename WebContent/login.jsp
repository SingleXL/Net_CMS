<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path ;
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="resources/css/validationEngine.jquery.css" type="text/css"/>
<link rel="icon" href="<%=basePath %>/resources/imgs/favcion.png" />	

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/cusvalidation.js"></script>
<script type="text/javascript" src="resources/js/cusvalidation-en.js"></script>
<script type="text/javascript" src="resources/js/cusvalidation-zh.js"></script>

<title>CMS后台管理</title>
</head>
<body>


	<div class="container">

		<div class="row text-center" style="margin-top:20px;margin-bottom:20px">
			<h1>登录CMS后台</h1>
		</div>
		<br>

		<div class="row text-center">
			
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-default panel-primary" id="usermanagebox">
				   <div class="panel-heading text-left">
						<h2 class="panel-title"><b>Login</b></h2>
				   </div>
				   <div class="panel-body text-left">
						<form class="form-horizontal text-left" action="#" style="height: 200px">
							<br>
							<div class="form-group">
								<label class="col-sm-4 control-label text-info">Username</label>
								<div class="col-sm-6" style="margin-left:-15px">
									<input type="text" name="username" id="username" class="form-control" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label text-info">Password</label>
								<div class="col-sm-6" style="margin-left:-15px">
									<input type="password" name="pass" id="pass" class="form-control" >
								</div>
							</div>
							<br>
							<div class="col-sm-offset-7 col-sm-10">
								<button id="login" class="btn btn-default">Login</button>
							</div>		
						</form>

				   </div>
				</div>



			</div>

		</div>


	</div>
</body>

<script type="text/javascript">
$(function () {

	var checkParam = function() {
		
		var isRight = true;
		var username = $("#username").val();
		var pass = $("#pass").val();
		
		var rule = /^\w+$/;
		isRight = rule.test(username);
		if (isRight) {
			isRight = rule.test(pass);
		}
		return isRight;
		
	}
	
	$("#login").click(function(e) {
		if ( e && e.preventDefault ) 
			e.preventDefault(); 
		else
			window.event.returnValue = false; 
		
		if (checkParam()) {
			$.ajax({
				url:'<%=basePath %>/login',
				type:'POST',
				data:$("form").serialize(),
				success : function(data) {   
					window.location.href="<%=basePath %>/admin/index"; 					
				}
			});
			
		}else {
			$("#pass").validationEngine("showPrompt", "检查输入信息", "error", 'bottomLeft',false);
		}
	});
	
});


</script>




</html>



