<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>
<div>
	<table class="table table-hover table-bordered" style="font-size: 14px;">
		<thead>
			<tr>
				<th><b>角色名称</b></th>
				<th><b>角色描述</b></th>
				<th><b>角色操作</b></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${roles }" var="role">
			<tr>
				<td>${role.roleName }&nbsp;</td>
				<td>${role.roleDesc }&nbsp;</td>
				<td>
					<a class="forward" href="<%=basePath %>/admin/role/edit/${role.roleId }" >编辑</a>
				&nbsp;
					<a class="redirect" href="<%=basePath %>/admin/role/deleteRole/${role.roleId }" >删除</a>
				&nbsp;
					<a class="forward" href="<%=basePath %>/admin/role/listRoleRights/${role.roleId }" >查看权限</a>
				&nbsp;
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>


<script type="text/javascript">

	$(".forward").click(function(e) {
		var loadPage = $(this).attr("href");
		$(".contentpanel").load(loadPage);
		return false;
	});
		
	$(".redirect").click(function(e) {
		var loadPage = $(this).attr("href");
		
		$(this).closest("tr").remove();
		$.ajax({url:loadPage});
		
		return false
	});
		
	

</script>
</body>
</html>
