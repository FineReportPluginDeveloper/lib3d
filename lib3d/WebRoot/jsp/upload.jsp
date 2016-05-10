<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<title>上传模型 - 3D模型库</title>
<meta name="keywords" content="3D,3D模型,3D模型下载,3D素材,AMF格式,3D模型搜索" />
<meta name="description" content="提供AMF格式格式3D模型搜索、下载服务。" />
<meta name="baidu-site-verification" content="" />
<meta name="baidu-site-verification" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<!-- FileInput -->
<link href="<%=basePath %>css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<!-- 自定义样式 -->
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<link rel="stylesheet" href="<%=basePath %>css/upload.css">
</head>
<body>

<div class="title">
<h1>发布3D模型</h1>
</div>

<div class="row">
	<div class="col-lg-3"></div>
	<form class="form-horizontal col-lg-6" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<label for="modelName" class="col-sm-4 control-label">请填写模型名称</label>
			<div class="col-sm-6">
				<input type="text" required="required" class="form-control" id="modelName" name="name" placeholder="">
			</div>
		</div>
		<div class="form-group">
			<label for="modelClassification" class="col-sm-4 control-label">请选择模型分类</label>
			<div class="col-sm-6">
				<select class="form-control" required="required" id="modelClassification" name="modeltype">
					<option>人物</option>
					<option>玩具</option>
					<option>建筑</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="uploadModel" class="col-sm-4 control-label">上传模型文件</label>
			<div class="col-sm-6">
				<input id="uploadModel" type="file" required="required" class="file" name="uploadModel" data-preview-file-type="text">
			</div>
		</div>
		<div class="form-group">
			<label for="uploadModelPicture" class="col-sm-4 control-label">上传模型图片</label>
			<div class="col-sm-6">
				<input id="uploadModelPicture" required="required" type="file" class="file" name="picname" data-preview-file-type="text">
			</div>
		</div>
		<div class="form-group">
			<label for="modelDescription" class="col-sm-4 control-label">模型详细介绍</label>
			<div class="col-sm-6">
				<textarea class="form-control" required="required" rows="4" id="modelDescription" name="detail"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="modelTags" class="col-sm-4 control-label">模型标签</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" required="required" id="modelTags" name="keywords">
				<span id="helpBlock" class="help-block">（以空格或英文逗号分隔。如：建筑,别墅）</span>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-8 col-sm-2">
				<button type="submit" class="btn btn-default btn-primary text-right">发布模型</button>
			</div>
		</div>
	</form>
	<div class="col-lg-3"></div>
</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<%=basePath %>js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=basePath %>js/bootstrap.min.js"></script>
	<script src="<%=basePath %>js/canvas-to-blob.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/fileinput.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/fileinput_locale_zh.js"></script>
	<script>
		$(function() {
			// initialize with defaults
			$("#uploadModel").fileinput();
			$("#uploadModelPicture").fileinput();
			// with plugin options
			$("#uploadModel").fileinput({'showUpload':false, 'previewFileType':'any'});
			$("#uploadModelPicture").fileinput({'showUpload':false, 'previewFileType':'any'});
		});
	</script>
</body>
</html>
