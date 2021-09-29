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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
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
  </style>

  <body>
    <header>
      <div class="set_width">
        <a href="home" class="header_item">HOME</a>
        <a href="loginForm" class="header_item">로그인</a>
        <a href="myorders" class="header_item">마이페이지</a>
        <div class="header_item">LANGUAGE</div>
      </div>
      <div
        style="width: 100%; border-bottom: 1px solid rgba(0, 0, 0, 0.1)"
      ></div>
      <div class="set_width">
        <div
          style="
            font-weight: bolder;
            color: #444444;
            font-size: 20px;
            width: 260px;
            height: 60px;
            display: table-cell;
            vertical-align: middle;
          "
        >
          | THE | HANDSOME |
        </div>
        <div class="nav_item">브랜드</div>
        <a href="productlist" class="nav_item">여성</a>
        <div class="nav_item">남성</div>
        <div class="nav_item">키즈</div>
        <div class="nav_item">뷰티</div>
        <div class="nav_item">라이프스타일</div>
      </div>
    </header>
    