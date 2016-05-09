<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>{模型名} - 3D模型库</title>
<meta name="keywords" content="3D,3D模型,3D模型下载,3D素材,AMF格式,3D模型搜索" />
<meta name="description" content="提供AMF格式格式3D模型搜索、下载服务。" />
<meta name="baidu-site-verification" content="" />
<meta name="baidu-site-verification" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 自定义样式 -->
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/model.css">
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-md-3">
		<h1>${item.name }</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-8">
		<div class="modelPreview">
			<img src="uploadpic/${item.picname }">
		</div>
	</div>
	<div class="col-lg-4">
		<div class="modelDescription">
			${item.detail }
			{这是一个3D模型，哈哈哈哈哈，你可以假装看不见，也可以偷偷地想念。}
		</div>
		<hr>
		<div class="row">
			<div class="col-md-4 header">评分</div>
			<div class="col-md-8 header">3.5</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">浏览次数</div>
			<div class="col-md-8 header">99</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">下载次数</div>
			<div class="col-md-8 header">{34}</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">更新时间</div>
			<div class="col-md-8 header">{2016-04-29 16:40:50}</div>
		</div>
		<hr>
		<a type="button" class="btn btn-primary btn-lg" id="download" href="{下载地址}">下载模型文件 ({文件大小} KB)</a>
		<a type="button" class="btn btn-default btn-lg" href="{3D预览地址}">3D预览</a>
	</div>
	<hr>
</div>

</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>