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
				<input type="checkbox" sn="${right.rightId}" checked="checked"> 
			</c:if>
			<c:if test="${ !right.checked }">
				<input type="checkbox" sn="${right.rightId}" > 
			</c:if>
			${right.rightName }
			</span> 	
		</c:if>			
	</c:forEach>	
	
	<br><br>
	<button class="btn btn-primary update">更新</button>
</div>
		
	

<script type="text/javascript">
$(function(){
	
	$(".update").click(function(){
		
		var roleId = $(".roleId").val();
		var rights = new Array();
	
		$("input:checkbox:checked").each(function () {
		   rights.push($(this).attr("sn"));
		})
		$.ajax({
			type:'POST',
			url:'${ctx}/admin/right/editRight',
			data:{roleId:roleId,rights:rights.join("|")},
			success:function(data){
				$(".contentpanel").load("<%=basePath %>/admin/right/allocRight");
			}
		});
		
	});	
	
});
</script>
</body>
</html>
