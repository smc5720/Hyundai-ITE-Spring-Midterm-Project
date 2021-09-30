<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
      li {
        list-style: none;
      }
      /* title */
      .pageTitle {
        margin: 90px 0 28px;
        text-align: center;
        font: 36px/1.1 "notoM";
        color: #222;
      }
      .contWrap {
        min-width: 1024px;
        max-width: 1280px;
        margin: 0 auto;
      }
      /* 이벤트 */
      .eventMidBanner {
        margin: 16px -8px 0;
      }
      .eventMidBanner:after {
        content: "";
        display: block;
        clear: both;
      }
      .eventMidBanner .banner {
        float: left;
        width: 50%;
      }
      .eventMidBanner .banner a {
        position: relative;
        display: block;
        margin: 0 8px;
        height: 204px;
      }
      .eventMidBanner .banner .img {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        overflow: hidden;
      }
      .eventMidBanner .banner .img img {
        float: right;
      }
      .eventMidBanner .banner .cont {
        display: block;
        position: relative;
        padding: 37px 0 0 40px;
        font-size: 22px;
        line-height: 1.3;
        color: #222;
      }
      .eventMidBanner .banner .cate {
        display: inline-block;
        padding: 4px 15px;
        border: 1px solid #222;
        font-size: 14px;
        border-radius: 20px;
      }
      .eventMidBanner .banner .name {
        display: block;
        margin: 16px 0 0;
        font-family: "notoM";
      }
      .eventMidBanner .banner .txt {
        display: block;
      }
      .eventMidBanner .banner .hash {
        display: block;
        margin: 5px 0 0;
        font: 16px/1.2 "notoL";
        color: #777;
      }
</style>
<hr/>
<div id="container">
      <!-- //location -->
      <section id="contents">
        <h2 class="pageTitle">이벤트</h2>
        <div class="contWrap">
          <div class="eventMidBanner">
            <div class="banner">
               <a href = "event"">
                <span class="img"
                  ><img
                    src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/"
                    alt=""
                /></span>
                <span class="cont">
                  <span class="cate">The Hyundai Mall</span>
                  <strong class="name">더한섬</strong>
                  <span class="txt">키즈 브랜드 시즌off</span>
                  <span class="hash">#신상 #쇼핑 #어린이날</span>
                  <span style="float: right; margin-right: 10px" class="cate">
                    쿠폰 다운 받기
                  </span>
                </span>
              </a>
            </div>
            <div class="banner">
              <a href="">
                <span class="img"
                  ><img
                    src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/"
                    alt=""
                /></span>
                <span class="cont">
                  <span class="cate">FLAGSHIP STORE</span>
                  <strong class="name">마이 레시피바</strong>
                  <span class="txt">나만의 페이스 &amp; 바디로션 만들기</span>
                  <span class="hash">#맞춤레시피 #나만의제품</span>
                  <span style="float: right; margin-right: 10px" class="cate">
                    쿠폰 다운 받기
                  </span>
                </span>
              </a>
            </div>
          </div>
        </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>