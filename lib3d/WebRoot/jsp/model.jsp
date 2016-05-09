<%@page import="com.bit.bean.Item3d"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${item3d.name } - 3D模型库</title>
<meta name="keywords" content="3D,3D模型,3D模型下载,3D素材,AMF格式,3D模型搜索" />
<meta name="description" content="提供AMF格式格式3D模型搜索、下载服务。" />
<meta name="baidu-site-verification" content="" />
<meta name="baidu-site-verification" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<!-- 自定义样式 -->
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<link rel="stylesheet" href="<%=basePath %>css/model.css">
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-md-3">
		<h1>${item3d.name}</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-8">
		<div class="modelPreview">
			<img src="<%=basePath %>upload/${item3d.picname }">
		</div>
	</div>
	<div class="col-lg-4">
		<div class="modelDescription">
			${item3d.detail}{这是一个3D模型，哈哈哈哈哈，你可以假装看不见，也可以偷偷地想念。}
		</div>
		<hr>
		<div class="row">
			<div class="col-md-4 header">评分</div>
			<div class="col-md-8 header">3.5</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">浏览次数</div>
			<div class="col-md-8 header">${item3d.viewtimes }</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">下载次数</div>
			<div class="col-md-8 header">${item3d.loadtimes }</div>
		</div>
		<div class="row">
			<div class="col-md-4 header">更新时间</div>
			<div class="col-md-8 header">${item3d.updatetime}</div>
		</div>
		<hr>
		<a type="button" class="btn btn-primary btn-lg" onclick="$.ajax({url:'<%=basePath %>loadtimes?id=${item3d.id}',async:false});" download="${item3d.name }${type}" id="download" <%-- download="${downloadname }<%= %>"  --%>href="<%=basePath %>upload/${item3d.filename }">&nbsp; &nbsp;下载模型文件&nbsp; &nbsp;</a>
		<a type="button" class="btn btn-default btn-lg" href="<%=basePath %>../webgl/view.jsp?url=<%=basePath %>upload/${item3d.filename}&type=${type}">&nbsp; &nbsp;3D预览&nbsp; &nbsp;</a>
	</div>
	<hr>
</div>

</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<%=basePath %>js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=basePath %>js/bootstrap.min.js"></script>
</body>
</html>
