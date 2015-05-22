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


<h3>权限分配</h3>

<div class="row">
	<div class="col-md-6 col-md-offset-2">
		<table class="table table-hover table-bordered" style="font-size: 15px;max-width: 500px;">
			<thead>
				<tr>
					<th><b>角色列表</b></th>
					<th><b>权限管理</b></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roles }" var="role">
					<tr>
						<td>${role.getRoleName() }</td>
						<td>
							<a href="<%=basePath %>/admin/right/editRight/${role.roleId}" >编辑</a>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
			
		</table>
	</div>

</div>

<script type="text/javascript">
$(function(){
	
	$("table a").click(function(e) {
		var loadPage = $(this).attr("href");
		$(".contentpanel").load(loadPage);
		return false;
	});
	
	//表单提交
	var options = {
		dataType:"json",
        success: function (e) {
        	$(".contentpanel").load("<%=basePath %>/admin/channel/listAllChannels");
        }
    };
 
	$('form').ajaxForm(options);
	
});
</script>
</body>
</html>
