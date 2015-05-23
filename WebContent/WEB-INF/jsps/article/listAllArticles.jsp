<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<h3>文章列表</h3>
	<table class="table table-hover table-bordered" style="font-size: 14px;">
		<thead>
			<tr>
<!-- 				<th><b>文章ID</b></th> -->
				<th><b>文章标题</b></th>
				<th><b>文章频道</b></th>
				<th><b>创建时间</b></th>
				<th><b>文章状态</b></th>
				<th><b>文章操作</b></th>
			</tr>
		</thead>
		<tbody>
		
		
		<c:forEach items="${pageArticle.list }" var="article">
			<tr>
<%-- 				<td>${article.articleId }&nbsp;</td> --%>
				<td>${article.title }&nbsp;</td>
				<td>${article.channel }</td>
				<td>${article.createDate }</td>
				<td>
					<c:if test="${article.status  == 0}">
						未发布
					</c:if>
					<c:if test="${article.status  ==1 }">
						已发布
					</c:if>
				
				</td>
				<td>
					<a href="<%=basePath %>/admin/article/update/${article.articleId}" class="dredirect">更新</a>
				&nbsp;
					<a href="<%=basePath %>/admin/article/delete/${article.articleId }"  class="redirect">删除</a>
				&nbsp;
				</td>
			</tr>
		</c:forEach>
		
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="text-align:right;font-size: 12px;padding-right: 20px;">
				    <a class="previous" href="<%=basePath %>/admin/article/listAllArticles?pageNoStr=${pageArticle.pageNo-1}">上一页</a> 
				    &nbsp;
				    <a class="next" href="<%=basePath %>/admin/article/listAllArticles?pageNoStr=${pageArticle.pageNo+1}">下一页</a> 
				    &nbsp;
				          当前第<span class="currentNo">${pageArticle.pageNo }</span>页
				    &nbsp;
				         共<span class="totalPageNum">${pageArticle.totalPageNum }</span>页
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
	
	
	$(".redirect").click(function(e) {
		e.stopPropagation();
		var loadPage = $(this).attr("href");
		$(this).closest("tr").remove();
		$.ajax({asyn:false,url:loadPage});
		
		$(".contentpanel").load('${ctx}/admin/article/listAllArticles');
		return false
	});
	
	$(".dredirect").click(function(e) {
		var loadPage = $(this).attr("href");
		$(".contentpanel").load(loadPage);
		return false;
	});
	
	
	

</script>
</body>
</html>
