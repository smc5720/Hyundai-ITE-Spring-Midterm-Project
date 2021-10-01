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
* {
	font-size: 12px;
	color: #444444;
}

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
	height: 100%;
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
	padding: 0 15px;
	line-height: 50px;
	font-size: 13px;
	color: black;
	background: white;
}
/* Menu Dropdown */
.nav>li>div {
	position: absolute;
	display: block;
	width: 100%;
	top: 50px;
	left: 0;
	opacity: 0;
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
	width: 20%;
}

.nav .nav-column li a {
	display: block;
	font-weight: bold;
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
						<div id="brand_nav">
							
						</div></li>
						<script>
							$(window).ready(function () {
								$.ajax({
									url: "getBrandList"
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
					<li><a href="productlist">여성</a>
						<div>
							<div class="nav-column">
								<ul>
									<a href="#">전체보기</a>
								</ul>
							</div>
							<div class="nav-column">
								<p>SPECIAL SHOP</p>
								<ul>
									<li><a href="#">LATT: FW 온라인 단독</a></li>
									<li><a href="#">SYSTEM: PARIS PRESENTATION</a></li>
									<li><a href="#">MINE: CODE MINE A (ATELIER)</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>아우터</p>
								<ul>
									<li><a href="#">재킷</a></li>
									<li><a href="#">점퍼</a></li>
									<li><a href="#">가디건/베스트</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>탑</p>
								<ul>
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">블라우스</a></li>
									<li><a href="#">셔츠</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>드레스</p>
								<ul>
									<li><a href="#">미니 드레스</a></li>
									<li><a href="#">미디 드레스</a></li>
									<li><a href="#">롱/맥시 드레스</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>팬츠</p>
								<ul>
									<li><a href="#">미니 드레스</a></li>
									<li><a href="#">미디 드레스</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>스커트</p>
								<ul>
									<li><a href="#">미니 드레스</a></li>
									<li><a href="#">미디 드레스</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">남성</a>
						<div>
							<div class="nav-column">
								<p>여성 브랜드</p>
								<ul>
									<li><a href="#">TIME</a></li>
									<li><a href="#">MINE</a></li>
									<li><a href="#">LANVIN COLLECTION</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>남성 브랜드</p>
								<ul>
									<li><a href="#">TIME HOMME</a></li>
									<li><a href="#">SYSTEM HOMME</a></li>
									<li><a href="#">the CASHMERE</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>편집 브랜드</p>
								<ul>
									<li><a href="#">TOM GREYHOUND</a></li>
									<li><a href="#">FOURM THE STORE</a></li>
									<li><a href="#">FOURM STUDIO</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>해외 브랜드</p>
								<ul>
									<li><a href="#">ROCHAS</a></li>
									<li><a href="#">LANVIN PARIS</a></li>
									<li><a href="#">BALLY</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">키즈</a>
						<div>
							<div class="nav-column">
								<p>여성 브랜드</p>
								<ul>
									<li><a href="#">TIME</a></li>
									<li><a href="#">MINE</a></li>
									<li><a href="#">LANVIN COLLECTION</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>남성 브랜드</p>
								<ul>
									<li><a href="#">TIME HOMME</a></li>
									<li><a href="#">SYSTEM HOMME</a></li>
									<li><a href="#">the CASHMERE</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>편집 브랜드</p>
								<ul>
									<li><a href="#">TOM GREYHOUND</a></li>
									<li><a href="#">FOURM THE STORE</a></li>
									<li><a href="#">FOURM STUDIO</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>해외 브랜드</p>
								<ul>
									<li><a href="#">ROCHAS</a></li>
									<li><a href="#">LANVIN PARIS</a></li>
									<li><a href="#">BALLY</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">뷰티</a>
						<div>
							<div class="nav-column">
								<p>여성 브랜드</p>
								<ul>
									<li><a href="#">TIME</a></li>
									<li><a href="#">MINE</a></li>
									<li><a href="#">LANVIN COLLECTION</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>남성 브랜드</p>
								<ul>
									<li><a href="#">TIME HOMME</a></li>
									<li><a href="#">SYSTEM HOMME</a></li>
									<li><a href="#">the CASHMERE</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>편집 브랜드</p>
								<ul>
									<li><a href="#">TOM GREYHOUND</a></li>
									<li><a href="#">FOURM THE STORE</a></li>
									<li><a href="#">FOURM STUDIO</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>해외 브랜드</p>
								<ul>
									<li><a href="#">ROCHAS</a></li>
									<li><a href="#">LANVIN PARIS</a></li>
									<li><a href="#">BALLY</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">라이프스타일</a>
						<div>
							<div class="nav-column">
								<p>여성 브랜드</p>
								<ul>
									<li><a href="#">TIME</a></li>
									<li><a href="#">MINE</a></li>
									<li><a href="#">LANVIN COLLECTION</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>남성 브랜드</p>
								<ul>
									<li><a href="#">TIME HOMME</a></li>
									<li><a href="#">SYSTEM HOMME</a></li>
									<li><a href="#">the CASHMERE</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>편집 브랜드</p>
								<ul>
									<li><a href="#">TOM GREYHOUND</a></li>
									<li><a href="#">FOURM THE STORE</a></li>
									<li><a href="#">FOURM STUDIO</a></li>
								</ul>
							</div>
							<div class="nav-column">
								<p>해외 브랜드</p>
								<ul>
									<li><a href="#">ROCHAS</a></li>
									<li><a href="#">LANVIN PARIS</a></li>
									<li><a href="#">BALLY</a></li>
								</ul>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</header>
	<div style="padding-top: 120px;">