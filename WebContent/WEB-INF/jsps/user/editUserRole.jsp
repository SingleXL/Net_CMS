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
	 <style type="text/css">
    	line{display: block;margin-top: 5px;margin-bottom: 5px;}
    </style>
	
</head>

<body>


<h3>角色编辑</h3>

<line>
   <div>
   	<input type="text" class="userId" value="${userId}" style="display: none;">
	<c:forEach items="${roles}" var="role">
		<span>
			<c:if test="${ role.selected }">
				<input type="checkbox" sn="${role.roleId}" checked="checked"> 
			</c:if>
			<c:if test="${ !role.selected }">
				<input type="checkbox" sn="${role.roleId}" > 
			</c:if>
			${role.roleName }
		</span> 	
	</c:forEach>	
	
	<br><br>
	<button class="btn btn-primary update">更新</button>
</div>
		
	


<script type="text/javascript">
$(function(){
	
	$(".update").click(function(){
		
		var userId = $(".userId").val();
		var roles = new Array();
	
		$("input:checkbox:checked").each(function () {
			roles.push($(this).attr("sn"));
		})
		$.ajax({
			type:'POST',
			url:'${ctx}/admin/user/editUserRole',
			data:{userId:userId,roles:roles.join("|")},
			success:function(data){
				$(".contentpanel").load("<%=basePath %>/admin/user/allocRole");
			}
		});
		
	});	
	
});
</script>
</body>
</html>
