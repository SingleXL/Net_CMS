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
	            <a class="navbar-brand" href="#" style="width:50px; color: green;background: url('resources/imgs/nav.png');cursor: default;">
	            </a>
	        </div>
	
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			    <ul class="nav navbar-nav">
			
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
		<div class="col-sm-8">
			<div class="panel panel-default">
  				<div class="panel-body">
   					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner" role="listbox">
						    
						    <c:if test="${carousels.size() == 1}">
								 <div class="item active" style="height: 220px;width: 705px;">
						            <img src="${ctx}/resources/imgs/carousels/default.jpg">
						        </div>
							</c:if>
							
						    <c:if test="${carousels.size() > 1}">
						    	<c:forEach items="${carousels}" var="carousel">
						    		<c:choose>  
									   <c:when test="${carousel.contains(\"default\")}">   
									   </c:when>  
									   <c:otherwise>
									   		<div class="item" style="height: 220px;width: 705px;">
									            <img src="${ctx}/resources/imgs/carousels/${carousel}">
									        </div>									   		
									   </c:otherwise>  
									</c:choose>  
						    	</c:forEach>
							</c:if>
						    
					    </div>
					
					    <!-- Controls -->
					    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					        <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					        <span class="sr-only">Next</span>
					    </a>
					</div>
  				</div>
			</div>
			
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
   							刚刚过去的是清明节，三天的假期，同学们都在朋友圈里各种晒出门旅行的照片，http://www.wojilu.com/Forum1/Topic/4287		所以也就呆在宿舍里面整整宅了三天。不过也没闲着，因为实在太无聊，
   								所以在网上下载了各种技术教学视频，蹲在宿舍里面……
   							</div>
   							<div class="visible-lg" style="margin-top: 8px;"> 2015年04月07日  3 条评论  107 PHP / ThinkPHP</div>
   						</div>
   					</div>
  				</div>
			</div>
			
			<div class="panel panel-default">
  				<div class="panel-heading">
    				<h3 class="panel-title"><b>Panel title</b></h3>
  				</div>
  				<div class="panel-body">
   				Panel content
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
		</div>
		
		
		<!--右侧 -->
		<div class="col-sm-4 hidden-xs">
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon-th-large" style="margin-right: 2px;font-size: 12px"></span>&nbsp;<b>本站介绍</b></h3>
  				</div>
  				<div class="panel-body">
   				Panel content
  				</div>
			</div>
			
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon glyphicon-list" style="margin-right: 2px;"></span>&nbsp;<b>最新文章</b></h3>
  				</div>
  				<div class="panel-body">
   				Panel content
  				</div>
			</div>
			
			<div class="panel panel-info">
  				<div class="panel-heading">
    				<h3 class="panel-title"><span class="glyphicon glyphicon glyphicon-list" style="margin-right: 2px;"></span>&nbsp;<b>随机文章</b></h3>
  				</div>
  				<div class="panel-body">
   				Panel content
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
  				</div>
			</div>
		</div>
	</div>
	
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
	$(function() {
		//轮播图片
		var item = $(".item").get(0)
		$(item).addClass("active");
	});
</script>

</html>