<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SpringFramework</title>
<!-- 
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	 -->
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>
	 <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="d-flex flex-column vh-100">
		<nav
			class="navbar navbar-expand-sm bg-dark navbar-dark text-white font-weight-bold justify-content-between">
			<a class="navbar-brand" href="/">
				<img
				src="${pageContext.request.contextPath}/resources/images/logo-spring.png"
				width="30" height="30" class="d-inline-block align-top">
				Spring
			</a>
			<div>
				<div>
					<button class="btn btn-success btn-sm">로그인</button>
					<button class="btn btn-success btn-sm">로그아웃</button>
				</div>
			</div>
		</nav>

		<div class="flex-grow-1 container-fluid">
			<div class="row h-100">
				<div class="col-md-4 p-3 bg-dark">
					<div class="h-100 d-flex flex-column">
						<div class="flex-grow-1"
							style="height: 0px; overflow-y: auto; overflow-x: hidden;">
							<%@ include file="/WEB-INF/views/common/menu.jsp"%>
						</div>
					</div>
				</div>

				<div class="col-md-8 p-3">
					<div class=" h-100 d-flex flex-column">
						<div class="flex-grow-1 overflow-auto pr-3" style="height: 0px">