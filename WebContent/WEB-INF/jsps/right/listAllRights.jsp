<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <style type="text/css">
    	line{display: block;margin-top: 5px;margin-bottom: 5px;}
    </style>
    
</head>


<body>

<div>
<h3>栏目列表</h3>
${sessionScope.user.hasRight("article_add") }
${sessionScope.user.hasRight("channel_edit") }
	<line>
    <div>
		<c:forEach items="${rights}" var="right">
			<c:if test="${ right.category.equals(\"category\") }">
				<line><b>${right.rightName }</b> <line>
			</c:if>		
			
			<c:if test="${ right.category.equals(\"action\") }">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${right.rightName } 	
			</c:if>		
			
		</c:forEach>	
	</div>
</div>

</body>
</html>
