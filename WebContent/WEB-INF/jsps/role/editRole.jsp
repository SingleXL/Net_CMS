<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path ;
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wuserIdth=device-wuserIdth, initial-scale=1.0, maximum-scale=1.0">
	<link rel="icon" href="<%=basePath %>/resources/imgs/favcion.png" />	
</head>

<body>


<h3>角色编辑</h3>

<div class="row">
	<div class="col-md-6 col-md-offset-2" style="max-width: 380px;">
	
	<sf:form action="${ctx}/admin/role/edit" class="form-horizontal" modelAttribute="role" method="post">
	
	    <div class="form-group form-group-md"  style="display: none;">
	        <div class="col-sm-9">
	            <sf:input path="roleId" class="form-control" />
	        </div>
	    </div>
	    <div class="form-group form-group-md" >
	        <label class="col-sm-3 control-label" >角色名称</label>
	        <div class="col-sm-9">
	            <sf:input path="roleName" class="form-control" />
	        </div>
	    </div>
	    <div class="form-group form-group-md" >
	        <label class="col-sm-3 control-label" >角色描述</label>
	        <div class="col-sm-9">
	            <sf:input path="roleDesc" class="form-control" />
	        </div>
	    </div>
	    
	    <button type="submit" class="btn btn-primary pull-right">更新</button>
	</sf:form>
	
</div>



</div>

<script type="text/javascript">
$(function(){
	
	//表单提交
	var options = {
		dataType:"json",
	 	success: function (e) {
        	$(".contentpanel").load("<%=basePath %>/admin/role/listAllRoles");
        }
    };
 
	$('form').ajaxForm(options);
	
});
</script>
</body>
</html>
