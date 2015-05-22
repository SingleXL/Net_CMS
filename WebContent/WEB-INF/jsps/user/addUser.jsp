<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path ;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wuserIdth=device-wuserIdth, initial-scale=1.0, maximum-scale=1.0">
	<link rel="icon" href="<%=basePath %>/resources/imgs/favcion.png" />	
    <title>CMS后台管理</title>
</head>

<body>

<h3>添加用户</h3>

<div class="row">
	<div class="col-md-6 col-md-offset-2" style="max-width: 380px;">
	
	<sf:form class="form-horizontal" modelAttribute="user" method="post">
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >用户名</label>
	        <div class="col-sm-9">
	            <sf:input path="name" class="form-control" />
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >用户昵称</label>
	        <div class="col-sm-9">
	            <sf:input path="nickname" class="form-control"/>
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >密码</label>
	        <div class="col-sm-9">
	            <sf:input path="pass" class="form-control"/>
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >邮箱</label>
	        <div class="col-sm-9">
	            <sf:input path="email" class="form-control"/>
	        </div>
	    </div>
	    <button type="submit" class="btn btn-primary pull-right">添加</button>
	</sf:form>
	
</div>



</div>

<script type="text/javascript">
$(function(){
	
	//表单提交
	var options = {
		dataType:"json",
        success: function (e) {
        	$(".contentpanel").load("<%=basePath %>/admin/user/listPageUser");
        }
    };
 
	$('form').ajaxForm(options);
	
});
</script>
</body>
</html>
