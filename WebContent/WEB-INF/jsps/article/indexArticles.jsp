<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path ;
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  

</head>

<div class="panel panel-default">
	<div class="panel-heading">
		<span class="category">文章类别</span>
		<span class="title"><a href="http://www.baidu.com" target="_blank">文章标题</a></span>
	</div>
	<div class="panel-body">
			<div class="row">
				<div class="col-sm-2 visible-lg">
					<img src="<%=basePath %>/resources/imgs/default_thumb.jpg">
				</div>
				<div class="col-sm-10" style="padding-left: 30px;font-size: 14px;color:#3E3E3E;" >
					<div style="height: 60px; word-break:break-all;word-wrap:break-word;overflow: hidden;">
					刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学刚刚过去的是清明节，三天的假期，同学们都在朋友圈里各种晒出门旅行的照片，http://www.wojilu.com/Forum1/Topic/4287所以也就呆在宿舍里面整整宅了三天。不过也没闲着，因为实在太无聊，
						所以在网上下载了各种技术教学视频，蹲在宿舍里面……
					</div>
					<div class="visible-lg" style="margin-top: 8px;"> 2015年04月07日  3 条评论  107 PHP / ThinkPHP</div>
				</div>
			</div>
	</div>
</div>


<nav>
    <ul class="pagination">
        <li>
            <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>


</html>