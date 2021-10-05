<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event.css"
	type="text/css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.set_width {
	width: 1205px;
	margin: 0px auto;
}

.header_item {
	padding: 0px 20px 0px 0px;
	color: #363636;
	font-size: 11px;
	height: 30px;
	display: table-cell;
	vertical-align: middle;
}

.nav_item {
	color: #363636;
	font-size: 13px;
	display: table-cell;
	vertical-align: middle;
	font-weight: bolder;
	padding: 16px;
}

.footer_item {
	width: 150px;
	font-size: 11px;
	padding: 5px 40px 5px 0px;
}

.footer_text {
	font-size: 10px;
	color: #555555;
}

.footer_text_space {
	margin: 0px 8px;
	color: rgba(0, 0, 0, 0.4);
}

.nav ul, .nav li {
	margin: 0;
	padding: 0;
	border: none;
	outline: none;
}

.nav a {
	text-decoration: none;
}

.nav li {
	list-style: none;
}

.nav {
	display: inline-block;
	position: relative;
	cursor: default;
	z-index: 500;
}
/* Menu List */
.nav>li {
	display: block;
	float: left;
}

.nav>li>a {
	position: relative;
	display: block;
	z-index: 510;
	padding: 0 50px;
	line-height: 54px;
	font-size: 13px;
	color: black;
	background: white;
}
/* Menu Dropdown */
.nav>li>div {
	position: absolute;
	display: block;
	width: 120%;
	top: 50px;
	left: 0;
	background-color: rgba(255, 255, 255, 0.5);
	visibility: hidden;
	overflow: hidden;
	background: #ffffff;
	border-radius: 0 0 3px 3px;
}

.nav>li:hover>div {
	opacity: 1;
	visibility: visible;
	overflow: visible;
}
/* Menu Content Styles */
.nav .nav-column {
	float: left;
	width: 32%;
	padding-left: 2.5%;
}

.nav .nav-column li a {
	display: block;
	line-height: 26px;
	font-size: 13px;
	color: #888888;
}

.nav .nav-column li a:hover {
	color: #666666;
}
</style>

<body>
	<header
		style="position: fixed; width: 100%; background-color: white; z-index: 1;">
		<div class="set_width">
			<a href="home" class="header_item">HOME</a>
			<sec:authorize access="isAnonymous()">
				<a href="${pageContext.request.contextPath}/loginForm"
					class="header_item">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<form name="logoutForm" method="post"
					action="${pageContext.request.contextPath}/logout"
					style="display: table-cell;">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <a class="header_item"
						href="javascript:logoutForm.submit();">로그아웃</a>
				</form>
				<a href="myorders" class="header_item">마이페이지</a>
			</sec:authorize>
			<div class="header_item">LANGUAGE</div>
		</div>
		<div style="width: 100%; border-bottom: 1px solid rgba(0, 0, 0, 0.1)"></div>
		<div class="set_width">
			<div
				style="font-weight: bolder; color: #444444; font-size: 20px; width: 260px; height: 60px; display: table-cell; vertical-align: middle; cursor: pointer;"
				onclick="location.href='/home'">| THE | HANDSOME |</div>
			<div id="menu-wrapper"
				style="width: 860px; height: 60px; display: table-cell; vertical-align: middle">
				<ul class="nav">
					<li><a href="#">브랜드</a>
						<div id="brand_nav"></div></li>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "${pageContext.request.contextPath}/getBrandList"
								}).done((data) => {
									if (data.result === "loadFail") {
										window.alert("브랜드를 찾을 수 없습니다.");
									} else {
										let brand_array = data.brands;
										let html_tmp = "";
										
										for (let i = 0; i < brand_array.length / 5; i++) {
											let tmp = "";
												tmp += "<div class='nav-column'>";
												tmp += "<ul>";
												
											for (let j = 0; j < 5; j++) {
												let idx = i * 5 + j;
												tmp += "<li><a href=''>" + brand_array.at(idx).bname + "</a></li>";
											}
											
											tmp += "</ul>";
											tmp += "</div>";
											
											html_tmp += tmp;
										}
										
										$("#brand_nav").html(html_tmp);
									}
								});
							});
						</script>
					<li><a href="${pageContext.request.contextPath}/product/productlist?cLarge=WOMEN&cMedium=none&cSmall=none&pageNo=1">여성</a>
						<div id="women_category"></div>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "${pageContext.request.contextPath}/getCategoryList?cLarge=WOMEN"
								}).done((data) => {
									let tmp_html = "";
									let data_array = data.WOMEN;
									
									for (let i = 0; i < data_array.length; i++) {
										let data_medium = data_array.at(i);
										let medium_array = Object.getOwnPropertyNames(data_medium);
										let tmp = "<div class='nav-column'>";
										tmp += "	<p><a href='${pageContext.request.contextPath}/product/productlist?cLarge=WOMEN&cMedium=" + medium_array[0] + "&cSmall=none&pageNo=1'>" + medium_array[0] + "</a></p>";
										tmp += "	<ul>";
										for (let j = 0; j < data_medium[medium_array[0]].length; j++) {
											let csmall = data_medium[medium_array[0]].at(j);
											tmp += "		<li><a href='${pageContext.request.contextPath}/product/productlist?cLarge=WOMEN&cMedium=" + medium_array[0] + "&cSmall=" + csmall + "&pageNo=1'>" + csmall + "</a></li>";
										}
										tmp += "	</ul>";
										tmp += "</div>";
										tmp_html += tmp;
									}
									
									$("#women_category").html(tmp_html);
								});
							});
						</script></li>
					<li><a href="${pageContext.request.contextPath}/product/productlist?cLarge=MEN&cMedium=none&cSmall=none&pageNo=1">남성</a>
						<div id="men_category"></div>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "${pageContext.request.contextPath}/getCategoryList?cLarge=MEN"
								}).done((data) => {
									let tmp_html = "";
									let data_array = data.MEN;
									
									for (let i = 0; i < data_array.length; i++) {
										let data_medium = data_array.at(i);
										let medium_array = Object.getOwnPropertyNames(data_medium);
										let tmp = "<div class='nav-column'>";
										tmp += "	<p><a href='${pageContext.request.contextPath}/product/productlist?cLarge=MEN&cMedium=" + medium_array[0] + "&cSmall=none&pageNo=1'>" + medium_array[0] + "</a></p>";
										tmp += "	<ul>";
										for (let j = 0; j < data_medium[medium_array[0]].length; j++) {
											let csmall = data_medium[medium_array[0]].at(j);
											tmp += "		<li><a href='${pageContext.request.contextPath}/product/productlist?cLarge=MEN&cMedium=" + medium_array[0] + "&cSmall=" + csmall + "&pageNo=1'>" + csmall + "</a></li>";
										}
										tmp += "	</ul>";
										tmp += "</div>";
										tmp_html += tmp;
									}
									
									$("#men_category").html(tmp_html);
								});
							});
						</script></li>
					<li><a href="${pageContext.request.contextPath}/product/productlist?cLarge=KIDS&cMedium=none&cSmall=none&pageNo=1">키즈</a>
						<div id="kids_category"></div>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "${pageContext.request.contextPath}/getCategoryList?cLarge=KIDS"
								}).done((data) => {
									let tmp_html = "";
									let data_array = data.KIDS;
									
									for (let i = 0; i < data_array.length; i++) {
										let data_medium = data_array.at(i);
										let medium_array = Object.getOwnPropertyNames(data_medium);
										let tmp = "<div class='nav-column'>";
										tmp += "	<p><a href='${pageContext.request.contextPath}/product/productlist?cLarge=KIDS&cMedium=" + medium_array[0] + "&cSmall=none&pageNo=1'>" + medium_array[0] + "</a></p>";
										tmp += "	<ul>";
										for (let j = 0; j < data_medium[medium_array[0]].length; j++) {
											let csmall = data_medium[medium_array[0]].at(j);
											tmp += "		<li><a href='${pageContext.request.contextPath}/product/productlist?cLarge=KIDS&cMedium=" + medium_array[0] + "&cSmall=" + csmall + "&pageNo=1'>" + csmall + "</a></li>";
										}
										tmp += "	</ul>";
										tmp += "</div>";
										tmp_html += tmp;
									}
									
									$("#kids_category").html(tmp_html);
								});
							});
						</script></li>
					<li><a href="${pageContext.request.contextPath}/product/productlist?cLarge=LIFESTYLE&cMedium=none&cSmall=none&pageNo=1">라이프스타일</a>
						<div id="lifestyle_category"></div>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "${pageContext.request.contextPath}/getCategoryList?cLarge=LIFESTYLE"
								}).done((data) => {
									let tmp_html = "";
									let data_array = data.LIFESTYLE;
									
									for (let i = 0; i < data_array.length; i++) {
										let data_medium = data_array.at(i);
										let medium_array = Object.getOwnPropertyNames(data_medium);
										let tmp = "<div class='nav-column'>";
										tmp += "	<p><a href='${pageContext.request.contextPath}/product/productlist?cLarge=LIFESTYLE&cMedium=" + medium_array[0] + "&cSmall=none&pageNo=1'>" + medium_array[0] + "</a></p>";
										tmp += "	<ul>";
										for (let j = 0; j < data_medium[medium_array[0]].length; j++) {
											let csmall = data_medium[medium_array[0]].at(j);
											tmp += "		<li><a href='${pageContext.request.contextPath}/product/productlist?cLarge=LIFESTYLE&cMedium=" + medium_array[0] + "&cSmall=" + csmall + "&pageNo=1'>" + csmall + "</a></li>";
										}
										tmp += "	</ul>";
										tmp += "</div>";
										tmp_html += tmp;
									}
									
									$("#lifestyle_category").html(tmp_html);
								});
							});
						</script></li>
				</ul>
			</div>
		</div>
	</header>
	<div style="padding-top: 120px;">