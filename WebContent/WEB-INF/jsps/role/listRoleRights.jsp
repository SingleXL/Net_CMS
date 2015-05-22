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


<h3>权限编辑</h3>

<line>
   <div>
   	<input type="text" class="roleId" value="${roleId}" style="display: none;">
	<c:forEach items="${rights}" var="right">
	
		<c:if test="${ right.category.equals(\"category\") }">
			<line><b>${right.rightName }</b> <line>
		</c:if>		
		&nbsp;&nbsp;
		<c:if test="${ right.category.equals(\"action\") }">
			<span>
			<c:if test="${ right.checked }">
				${right.rightName }
			</c:if>
			</span> 	
		</c:if>			
	</c:forEach>	
	
	<br><br>
	<button class="btn btn-primary back">回退</button>
</div>
		
	

<script type="text/javascript">
$(function(){
	
	$(".back").click(function(){
		$(".contentpanel").load("<%=basePath %>/admin/role/listAllRoles");
	});	
	
	
});
</script>
</body>
</html>
