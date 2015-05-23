<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="au" uri="http://www.cms.com/mytag/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path ;
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link rel="icon" href="${ctx }/resources/imgs/favcion.png" />	
    <title>CMS后台管理</title>
    
    <link href="${ctx }/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/resources/css/ui-theme/jquery.ui.css" rel="stylesheet">
    <link href="${ctx }/resources/css/admin.css" rel="stylesheet">
    <link href="${ctx }/resources/css/uploadify.css" rel="stylesheet">
    
   	<script src="${ctx }/resources/js/jquery.js"></script>
	<script src="${ctx }/resources/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx }/resources/js/bootstrap.min.js"></script>
	<script src="${ctx }/resources/js/jquery.form.js"></script>
	<script src="${ctx }/resources/js/jquery.tablednd_0_5.js"></script>
	<script src="${ctx }/resources/js/jquery.ui.min.js"></script>
	<script src="${ctx }/resources/js/admin.js"></script>
	<script src="${ctx }/resources/xheditor/xheditor-1.2.1.min.js"></script>
	<script src="${ctx }/resources/xheditor/xheditor_lang/zh-cn.js"></script>
	<script src="${ctx }/resources/uploadify/jquery.uploadify-3.1.min.js"></script>
	<script src="${ctx }/resources/js/jquery.Jcrop.js"></script>
	
	
	<link rel="stylesheet" href="<%=basePath %>/resources/css/validationEngine.jquery.css" type="text/css"/>
	<script type="text/javascript" src="<%=basePath %>/resources/js/cusvalidation.js"></script>
	<script type="text/javascript" src="<%=basePath %>/resources/js/cusvalidation-en.js"></script>
	<script type="text/javascript" src="<%=basePath %>/resources/js/cusvalidation-zh.js"></script>
	
</head>


<body>

<section>
    <div class="leftpanel">
        <div class="logopanel">
             <h1><span>CMS 后台系统管理</span></h1>
        </div>
        <div class="leftpanelinner">
             <ul class="nav nav-pills nav-stacked nav-bracket">
                <li class="active"><a href=""><i class="fa fa-home"></i> <span>首页</span></a></li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-columns"></i> <span>栏目管理</span></a>
                    <ul class="children">
                        <li><au:a href="${ctx }/admin/channel/listAllChannels" sn="channel_listAllChannels"><i class="fa fa-caret-right"></i>栏目列表</au:a></li>
                        <li><au:a href="${ctx }/admin/channel/addParentChannel" sn="channel_addParentChannel"><i class="fa fa-caret-right"></i>添加栏目</au:a></li>
                    </ul>
                </li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-edit"></i> <span>文章管理</span></a>
                    <ul class="children">
                        <li><au:a href="${ctx }/admin/article/addArticle" sn="article_add"><i class="fa fa-caret-right"></i>添加文章</au:a></li>
                        <li><au:a href="${ctx }/admin/article/listAllArticles" sn="article_list"><i class="fa fa-caret-right"></i>文章列表</au:a></li>
                    </ul>
                </li>
             
                
                <li class="nav-parent"><a href=""><i class="fa fa-user"></i> <span>用户管理</span></a>
                    <ul class="children">
                        <li><au:a href="${ctx }/admin/user/listPageUser"><i class="fa fa-caret-right"></i>用户列表</au:a></li>
                        <li><au:a href="${ctx }/admin/user/addUser"><i class="fa fa-caret-right"></i>添加用户</au:a></li>
                        <li><au:a href="${ctx }/admin/user/allocRole"><i class="fa fa-caret-right"></i>用户授权</au:a></li>
                    </ul>
                </li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-users"></i> <span>角色管理</span></a>
                	<ul class="children">
                        <li><au:a href="${ctx }/admin/role/listAllRoles"><i class="fa fa-caret-right"></i>角色列表</au:a></li>
                        <li><au:a href="${ctx }/admin/role/addRole"><i class="fa fa-caret-right"></i>添加角色</au:a></li>
                    </ul>
                </li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-arrow-circle-o-right"></i> <span>权限管理</span></a>
                	<ul class="children">
                        <li><au:a href="${ctx }/admin/right/listAllRights"><i class="fa fa-caret-right"></i>权限列表</au:a></li>
                        <li><au:a href="${ctx }/admin/right/allocRight"><i class="fa fa-caret-right"></i>权限分配</au:a></li>
                    </ul>
                </li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-bug"></i> <span>爬虫管理</span></a>
                    <ul class="children">
                            <li><au:a href="view-issue.html"><i class="fa fa-caret-right"></i>爬虫列表</au:a></li>
                            <li><au:a href="view-issue.html"><i class="fa fa-caret-right"></i>添加爬虫</au:a></li>
                    </ul>
                </li>
                
                <li class="nav-parent"><a href=""><i class="fa fa-cogs"></i> <span>系统管理</span></a>
                    <ul class="children">
                        <li><au:a href="${ctx }/admin/bangbros/listAllBangbros"><i class="fa fa-caret-right"></i>轮播图片</au:a></li>
                    </ul>
                </li>
            </ul>

        </div><!-- leftpanelinner -->
    </div><!-- leftpanel -->
    

    <div class="mainpanel">
        <div class="headerbar">
            <a class="menutoggle"><i class="fa fa-bars"></i></a>
            
            <div class="header-right">
                <ul class="headermenu">
                
                    <li>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                John Doe
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                <li><au:a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</au:a></li>
                                <li><au:a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</au:a></li>
                                <li><au:a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</au:a></li>
                                <li><au:a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> Log Out</au:a></li>
                            </ul>
                        </div>
                    </li>
                    
                </ul>
            </div><!-- header-right -->
        </div><!-- headerbar -->

        <div class="contentpanel" style="padding-left: 15px;height: 1200px;overflow: auto;">
        	<img style="width:1400px;height:700px;margin-left: -15px;margin-top: -20px;"  src="${ctx }/resources/imgs/bgbank.jpg">
        </div>

    </div><!-- mainpanel -->
</section>

</body>
</html>
