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
</head>

<body>


<h3>栏目编辑</h3>

<div class="row">
	<div class="col-md-6 col-md-offset-2" style="max-width: 380px;">
	
	<sf:form action="${ctx}/admin/channel/edit" class="form-horizontal" modelAttribute="channel" method="post">
	
	    <div class="form-group form-group-md" style="display: none;">
	        <label class="col-sm-3 control-label" >栏目名称</label>
	        <div class="col-sm-9">
	            <sf:input path="channelId" class="form-control" value="${channel.channelId}" />
	        </div>
	    </div>
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >栏目名称</label>
	        <div class="col-sm-9">
	            <sf:input path="name" class="form-control" value="${channel.name}" />
	        </div>
	    </div>
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >栏目标识</label>
	        <div class="col-sm-9">
	            <sf:input path="sn" class="form-control" value="${channel.sn}" />
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >排列序号</label>
	        <div class="col-sm-9">
	            <sf:input path="sort" class="form-control" value="${channel.sort}" />
	        </div>
	    </div>
	    
	    <div class="form-group form-group-sm">
	        <label class="col-sm-3 control-label" >栏目状态</label>
	        <div class="col-sm-9 center-block">
				<sf:radiobutton path="status" value="0" />停用
				<sf:radiobutton path="status" value="1" />启用
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md" style="display: none;">
	        <label class="col-sm-3 control-label" >排列序号</label>
	        <div class="col-sm-9">
	            <sf:input path="pchannelId" class="form-control" value="${channel.pchannelId}" />
	        </div>
	    </div>
	    
	    <button type="submit" class="btn btn-primary pull-right">更新</button>
	</sf:form>
	
</div>



</div>

<script type="text/javascript">
$(function(){
	
	//表单提交
	var options = {
		dataType:"json",
	 	success: function (e) {
        	$(".contentpanel").load("<%=basePath %>/admin/channel/listAllChannels");
        }
    };
 
	$('form').ajaxForm(options);
	
});
</script>
</body>
</html>
