<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="au" uri="http://www.cms.com/mytag/core"%>
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
</head>

<body>

<div>
<h3>爬虫列表</h3>
	
	
	<table class="table table-hover table-bordered" style="font-size: 15px;">
		<thead>
			<tr>
				<th style="max-width:70px;width:70px;"><b>序号</b></th>
				<th><b>栏目名称</b></th>
				<th><b>栏目状态</b></th>
				<th><b>栏目操作</b></th>
			</tr>
		</thead>
		
		<tbody >
			<c:forEach items="${channelTrees}" var="channelTree">
		
				<tr class="parent">
					<td>${channelTree.parent.sort}</td>
					<td>
						<span><b>
								<c:if test="${channelTree.childs.size() == 0}">
									&nbsp;&nbsp;
								</c:if>
								<c:if test="${channelTree.childs.size() > 0}">
									<i class="fa fa-plus-square-o channelName"></i>
								</c:if>
						&nbsp;${channelTree.parent.name}</b></span>
					</td>			
					<td>
						<span>
							<c:choose>
								<c:when test="${channelTree.parent.status == 0}">
									停用
								</c:when>
								<c:when test="${channelTree.parent.status == 1}">
									启用
								</c:when>
							</c:choose>
						</span>
					</td>			
					<td>
						<a href="<%=basePath %>/admin/channel/edit/${channelTree.parent.sn}" >编辑</a>
					&nbsp;
						<a href="<%=basePath %>/admin/channel/addChild/${channelTree.parent.sn}" >添加子栏目</a>
					&nbsp;
						<a href="<%=basePath %>/admin/channel/delete/${channelTree.parent.sn}" class="redirect" >删除栏目</a>
					</td>
				</tr>
			
				<c:forEach items="${channelTree.childs}" var="child">
					<tr class="child">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${child.sort}</td>
						<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right"></i>
						${child.name}
						</td>			
						<td>
							<span>
								<c:choose>
									<c:when test="${child.status == 0}">
										停用
									</c:when>
									<c:when test="${child.status == 1}">
										启用
									</c:when>
								</c:choose>
							</span>
						</td>			
						<td>
							<a href="<%=basePath %>/admin/channel/edit/${child.sn}" >编辑</a>
						&nbsp;
							<a href="<%=basePath %>/admin/channel/delete/${child.sn}" class="redirect">删除栏目</a>
						</td>
					</tr>
			
				</c:forEach>
			
			</c:forEach>
			<tr class="parent"></tr>
		</tbody>
		
	</table>
</div>


<script type="text/javascript">

	$(function(){
		
		$(".redirect").click(function(e) {
			var loadPage = $(this).attr("href");
			$(this).closest("tr").remove();

			$.ajax({asyn:false,url:loadPage});
			$(".contentpanel").load('${ctx}/admin/channel/listAllChannels');
			return false
		});
		
		$("table a:not([class='redirect'])").click(function(e) {
			var loadPage = $(this).attr("href");
			$(".contentpanel").load(loadPage);
			return false;
		});
		
		//表格折叠
	 	$(function(){
	 		$(".child").hide();
	 		$(".parent").click(function(){
	 			var check = $(this).hasClass("clicked");
	 			if(check){
	 				$(this).find(".channelName").removeClass("fa-minus-square-o");
	 				$(this).find(".channelName").addClass("fa-plus-square-o");
	 				$(this).removeClass("clicked");
	 				$(this).nextUntil(".parent").slideUp(30);
	 			}else{
	 				$(this).find(".channelName").addClass("fa-minus-square-o");
	 				$(this).find(".channelName").removeClass("fa-plus-square-o");
	 				$(this).addClass("clicked");
	 				$(this).nextUntil(".parent").show();
	 				$(this).nextUntil(".parent").slideDown(30);
	 			}
	 			
	 		});
	 	});
		
	});

</script>
</body>
</html>
