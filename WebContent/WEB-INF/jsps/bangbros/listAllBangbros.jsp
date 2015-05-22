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
    <style type="text/css">
    	/*upload files*/
		.uploadFiles a:hover {cursor: pointer;}
    </style>
    
</head>

<body>

<span style="display: none;" id="ctx">${pageContext.request.contextPath}</span>
<div>
<h3>轮播图片</h3>
	
	<div class="form-group">
        <div class="col-sm-10">
        	<div class="row" style="padding-left:0px; ">
		        <div class="col-sm-6">
        			<input type="file" id="attach" value="" >
        		</div>
		        <div class="col-sm-4">
        			<button class="btn btn-info btn-sm upfiles">上传</button>
        		</div>
        	</div>
        </div>
       </div>
	
	
	<table class="table table-hover table-bordered" style="font-size: 15px;max-width: 880px;">
		<thead>
			<tr>
				<th><b>轮播图片</b></th>
				<th style="max-width:280px;width:280px;"><b>首页展示</b></th>
			</tr>
		</thead>
		
		<tbody class="uploadFiles" >
			<c:forEach items="${carousels}" var="carousel">
				<tr>
					<td><img src="${ctx }/resources/imgs/carousels/${carousel}"></td>
					
					<td><input type="checkbox" checked="checked"></td>
					<td style="display: none;"><span >${carousel}</span></td>
				</tr>
			
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td></td>			
				<td><button class="btn btn-info btn-sm save">保存</button></td>
			</tr>
		</tfoot>
		
	</table>
</div>


<script type="text/javascript">

	$(function(){
		// attachment
		var attachs = new Array();
		
		function createAtt(attach){
			
			var img = "<img src='<%=basePath %>/resources/imgs/carousels/"+attach+"'/>";
			var trCon = "<tr>"
				+ "<td>"+img+"</td>"
				+ "<td><input type='checkbox'/></td>"
				+ "<td style='display: none;'><span >"+attach+"</span></td></tr>";
			return trCon
				;
		}
		
		$("#attach").uploadify({
			swf:$("#ctx").html() + "/resources/uploadify/uploadify.swf",
			uploader:$("#ctx").html() +'/admin/attach/bangbros',
			fileObjName:"attach",
			auto:false,
			upImgUrl:true,
			fileTypeExts:"*.jpg;*.jpeg;*.gif;*.png;",
			onUploadSuccess:function(file,data,response){
				
				console.log(createAtt(data));
				$(".uploadFiles").append(createAtt(data));
			}
		});
		
		$(".upfiles").click(function(){
			$("#attach").uploadify("upload","*");
		});	    		
		
		// 上传文件列表中的a链接
		$(".uploadFiles a").click(function(e) {
			return false;
		});
		
		
		$(".save").click(function() {
			var arr = new Array();
			
			$("input[type=checkbox]:checked").each(function(){ 
				arr.push($(this).closest("tr").find("span").html())
			}); 
			
			
			$.ajax({
				url:'${ctx}/admin/bangbros/save',
				data:{"bans":arr.join("|")},
				success:function(){
					// 保存成功
					$(".contentpanel").load('${ctx}/admin/bangbros/listAllBangbros');
				}
			});
			
		});
		
		
	});

</script>
</body>
</html>
