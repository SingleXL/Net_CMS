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
<link rel="stylesheet" href="<%=basePath %>/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>/resources/css/f_index.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>/resources/css/font-awesome.min.css" type="text/css" />
<link rel="icon" href="<%=basePath %>/resources/imgs/favcion.png" />

<script type="text/javascript" src="<%=basePath %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/resources/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/resources/js/jquery.ui.min.js"></script>

</head>
<body>
<div class="header">
	<nav class="navbar navbar-inverse navbar-static-top">
	    <div class="container">
	        <div class="navbar-header">
	        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		        </button>
	            <a class="navbar-brand" href="#" style="width:50px; color: green;background: url('../resources/imgs/nav.png');cursor: default;">
	            </a>
	        </div>
	
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			    <ul class="nav navbar-nav">
			
			        <li><a href="<%=basePath %>">首页</a></li>
					<c:forEach items="${channelTrees}" var="channelTree">
<!-- 						//判断类型和是否有子类 -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${channelTree.parent.name}<span class="caret"></span></a>
			
							<ul class="dropdown-menu" role="menu">
								<c:forEach items="${channelTree.childs}" var="child">
									<li><a href="#">${child.name}</a></li>
								</c:forEach>
							</ul>
			
						</li>
					
					</c:forEach>
			
<!-- 			        <li><a href="#">理科</a></li> -->
<!-- 			        <li><a href="#">理科</a></li> -->
			
<!-- 			        <li class="dropdown"> -->
<!-- 			            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">文科<span class="caret"></span></a> -->
<!-- 			            <ul class="dropdown-menu" role="menu"> -->
<!-- 			                <li><a href="#">历史</a></li> -->
<!-- 			                <li><a href="#">生物</a></li> -->
<!-- 			            </ul> -->
<!-- 			        </li> -->
			        <li><a href="http://www.baidu.com" target="_blank">百度</a></li>
			        
			    </ul>
			    
			    <ul class="nav navbar-nav navbar-right">
			        <li class="search visible-lg">
					   <form class="navbar-form navbar-left" role="search">
					       <div class="form-group form-group-sm">
					            <input type="text" class="form-control" placeholder="搜索...">
					       </div>
				           <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				       </form>
					</li>
					<li><a href="${ctx}/login.jsp" target="_blank">登陆</a></li>
			    </ul>
			    
			</div>
	    </div>
	</nav>
</div>


<div class="container" style="max-width: 1124px;">

	<div class="row">
		<!-- 左侧 -->
		<div class="col-sm-8" style="border: 1px solid #E7E4E6;padding-bottom: 20px;">
		
			<div><center><h1>${article.title }</h1></center></div>
			<hr style="height:2x;border:none;border-top:2px groove #E7E4E6;" />
			<div style="padding-left: 10px;">${article.content }</div>
			<br>
			<div>
			<br>
			<b>相关附件</b>
			<br>
			<mbr/>
				<c:forEach items="${attachs }" var="attach">
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/resources/upload/files/${attach.newName}">${attach.oldName}</a><br>
				</c:forEach>
			</div>
			
		</div>
		
		
		<!--右侧 -->
		<div class="col-sm-4 hidden-xs">
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon-th-large" style="margin-right: 2px;font-size: 12px"></span>&nbsp;<b>本站介绍</b></h3>
  				</div>
  				<div class="panel-body" style="padding-left: 8px;">
   					<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>Net_CMS是一套基于J2EE和插件技术的、面向高端用户的网站内容管理软件，
   					集内容规划、内容创作、内容编辑、内容审核、基于模板的内容发布等功能于一身，并提供互动组件、可视化专题、内容采集、内容检索、访问统计等扩展功能<br>
   					<mbr/>
   					<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>Net_CMS内容管理系统是一种位于WEB前端（Web 服务器）和后端办公系统或流程（内容创作、编辑）之间的软件系统。内容管理解决方案重点解决各种非结构化或半结构化的数字资源的采集、管理、利用、传递和增值，并能有机集成到结构化数据的商业智能环境中，如OA,CRM等。<br>
   					<mbr/>
  				</div>
			</div>
			
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon glyphicon-list" style="margin-right: 2px;"></span>&nbsp;<b>最新文章</b></h3>
  				</div>
  				<div class="panel-body">
  					<div class="list-group">
   				      <c:forEach items="${lastArticles }" var="article1">
						  <a href="<%=basePath %>/showArticle/${article1.articleId }" class="list-group-item" target="_blank">${article1.title }</a>
   				      </c:forEach>		
					</div>
  				</div>
			</div>
			
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon glyphicon-list" style="margin-right: 2px;"></span>&nbsp;<b>随机文章</b></h3>
  				</div>
  				<div class="panel-body">
   					<div class="list-group">
   				      <c:forEach items="${ranArticles }" var="article2">
						  <a href="<%=basePath %>/showArticle/${article2.articleId }" class="list-group-item" target="_blank">${article2.title }</a>
   				      </c:forEach>		
					</div>
  				</div>
			</div>
			
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon glyphicon-link" style="margin-right: 2px;"></span>&nbsp;<b>友情链接</b></h3>
  				</div>
  				<div class="panel-body">
  					<mbr>
   					&nbsp;&nbsp;<a href="http://www.ntu.edu.cn" target="_blank">南通大学</a>
   					&nbsp;&nbsp;<a href="http://www.pku.edu.cn" target="_blank">北京大学</a>
   					&nbsp;&nbsp;<a href="http://www.tsinghua.edu.cn" target="_blank">清华大学</a>
   					&nbsp;&nbsp;<a href="http://www.suda.edu.cn" target="_blank">苏州大学</a><mbr>
   					&nbsp;&nbsp;<a href="http://www.bit.edu.cn" target="_blank">北京理工大学</a>
   					&nbsp;&nbsp;<a href="http://www.edu.cn" target="_blank">中国科研网</a>
   					&nbsp;&nbsp;<a href="http://www.baidu.com" target="_blank">百度</a>
   					&nbsp;&nbsp;<a href="http://www.qq.com" target="_blank">腾讯</a>
  					<mbr>
  				</div>
			</div>
		</div>
	</div>
	<br>
	
	<div class="row" style="padding-left:10px;padding-right: 10px;">
		<div class="panel panel-default">
  			<div class="panel-body text-center">
    			© 2015 Powered By Net_CMS<br>
    			Design By: XL-PC<br>
 			 </div>
		</div>
	</div>
	
</div>


</body>

<script type="text/javascript">


</script>

</html>