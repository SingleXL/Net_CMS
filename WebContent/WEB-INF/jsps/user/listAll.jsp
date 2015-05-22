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
				<th><b>用户ID</b></th>
				<th><b>用户名</b></th>
				<th><b>用户昵称</b></th>
				<th><b>用户邮箱</b></th>
				<th><b>用户操作</b></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageUser.list }" var="user">
			<tr>
				<td>${user.userId }&nbsp;</td>
				<td>${user.nickname }&nbsp;</td>
				<td>${user.name }</td>
				<td>${user.email }</td>
				<td>
					<a href="admin/user/update/${user.userId }" >更新</a>
				&nbsp;
					<a href="admin/user/delete/${user.userId }" title="${user.userId }" >删除</a>
				&nbsp;
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="text-align:right;font-size: 12px;padding-right: 20px;">
				    <a class="previous" href="<%=basePath %>/admin/user/listPageUser?pageNoStr=${pageUser.pageNo-1}">上一页</a> 
				    &nbsp;
				    <a class="next" href="<%=basePath %>/admin/user/listPageUser?pageNoStr=${pageUser.pageNo+1}">下一页</a> 
				    &nbsp;
				          当前第<span class="currentNo">${pageUser.pageNo }</span>页
				    &nbsp;
				         共<span class="totalPageNum">${pageUser.totalPageNum }</span>页
				</td>
			</tr>
		</tfoot>
	</table>
</div>


<script type="text/javascript">

	var currentNO = $(".currentNo").html();
	var totalPageNum = $(".totalPageNum").html();

	$(".previous").click(function(){
		if(currentNO !=1 ){
			var loadPage = $(this).attr("href");
			$(".contentpanel").load(loadPage);
		}
		return false;
	});
	
	$(".next").click(function(){
		if(currentNO!=totalPageNum){
			var loadPage = $(this).attr("href");
			$(".contentpanel").load(loadPage);
		}
		return false;
	});
	
	

</script>
</body>
</html>
