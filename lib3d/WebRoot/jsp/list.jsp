<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>{搜索内容} - 3D模型库</title>
<meta name="keywords" content="3D,3D模型,3D模型下载,3D素材,AMF格式,3D模型搜索" />
<meta name="description" content="提供AMF格式格式3D模型搜索、下载服务。" />
<meta property="wb:webmaster" content="921a80ac238a6a40" />
<meta name="baidu-site-verification" content="" />
<meta name="baidu-site-verification" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<!-- 自定义样式 -->
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<link rel="stylesheet" href="<%=basePath %>css/home.css">
</head>
<body>

<div class="row" style="margin-top:30px;">
	<div class="col-lg-3"></div>
	<div class="btn-group col-lg-6">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			分类 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="<%=basePath %>classSearch?modeltype=people">人物</a></li>
			<li><a href="<%=basePath %>classSearch?modeltype=art">建筑</a></li>
			<li><a href="<%=basePath %>classSearch?modeltype=play">玩具</a></li>
			<li><a href="<%=basePath %>classSearch?modeltype=else">其他</a></li>
		</ul>
	</div>
	<div class="col-lg-3"></div>
</div>

<div class="row" style="">
	<div class="col-lg-3"></div>
	<form action="${pageContext.request.contextPath}/search" method="post">
  <div class="col-lg-6">
    <div class="input-group input-group-lg">
      <input type="text"name="keywords" class="form-control" placeholder="搜索精美的3D模型吧~" id="keywords"style="font-size:14px" >
      <span class="input-group-btn" >
        <button class="btn btn-default btn-primary" <%-- onclick="location='${pageContext.request.contextPath}/search?keywords='+document.getElementById('keywords').value" --%>  type="submit"  style="font-size:14px">搜索</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  </form>
	<div class="col-lg-3"></div>
</div><!-- /.row -->

<div class="container">
	<ol>
		<c:forEach var="result" items="${results }">
			<li>
				<div class="amf"></div>
				<div class="preview">
					<a href="${pageContext.request.contextPath}/view?id=${result.id }"><img src="${pageContext.request.contextPath}/upload/${result.picname }" width="100%" height="100%"></a>
				</div>
				<div class="description"><span>${result.detail}</span></div>
			</li>
		</c:forEach>
		<!-- <li>
			<div class="preview">
			</div>
		</li>
		<li>
			<div class="preview">
			</div>
		</li> -->
	</ol>
	<div style="width:30px; height:30px; background='yellow'">
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath %>js/bootstrap.min.js"></script>

</body>
</html>
