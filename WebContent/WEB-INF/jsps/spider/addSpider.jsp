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


<h3>添加爬虫</h3>

<div class="row">
	<div class="col-md-6 col-md-offset-2" style="max-width: 380px;">
	
    <button type="submit" class="btn btn-primary pull-right">添加</button>
	<sf:form  action="${ctx}/admin/channel/addParentChannel" class="form-horizontal" modelAttribute="channel" method="post">
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >采集地址</label>
	        <div class="col-sm-9">
	            <sf:input path="name" class="form-control"  />
	        </div>
	    </div>
	    
	   <div class="form-group">
	        <label class="col-sm-2 control-label"><b>文章栏目</b></label>
	        <div class="col-sm-10" style="max-width:200px; ">
		        <sf:select path="channel" class="form-control">
		        	<sf:option value="0">请选择栏目</sf:option>
	        		<c:forEach items="${channelTrees}" var="channelTree">
				        <optgroup label="${channelTree.parent.name}"></optgroup> 
						<c:forEach items="${channelTree.childs}" var="child">
				        	<sf:option value="${child.sn}">&nbsp;&nbsp;&nbsp;&nbsp;${child.name}</sf:option>
						</c:forEach>
					</c:forEach>
		        </sf:select>
	        </div>
	    </div>
	    
	    <div class="form-group form-group-md">
	        <label class="col-sm-3 control-label" >进行采集</label>
	        <div class="col-sm-9">
	            <sf:input path="sort" class="form-control" />
	        </div>
	    </div>
	    
	</sf:form>
	
	
</div>

</div>

<script type="text/javascript">
$(function(){
	
	//表单提交
	var options = {
		dataType:"json",
        success: function (e) {
        	$(".contentpanel").load("<%=basePath %>/admin/channel/listAllChannels");;
        }
    };
 
	$('form').ajaxForm(options);
	
});
</script>
</body>
</html>
