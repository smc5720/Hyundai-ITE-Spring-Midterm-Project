<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
      #memberBenefit .section {
        padding: 80px 0 100px;
        border-bottom: 1px solid #eaeaea;
        text-align:center
      }
      
      #memberBenefit .section .section_tit {
        text-align: center;
        font-family: "ProximaNova-Regular", "yg740";
        font-size: 26px;
        line-height: 32px;
        color: #000;
        margin-bottom:30px
      }

      #memberBenefit .section .coupon_list {
        padding: 0 5px;
        display:inline-block
      }

      #memberBenefit .section .coupon_list li {
        float: left;
        padding: 0 15px;
        margin-top: 40px;
        text-align:left
      }

      #memberBenefit .section .coupon_list li:first-child {
        margin-top:0
      }

      #memberBenefit .section .coupon_list li .coupon_box {
        display: table;
        width: 100%;
        height: 150px;
        background: whitesmoke;
        background-size:contain
      }

      #memberBenefit .section .coupon_list li .coupon_box > div {
        display: table-cell;
        vertical-align:middle
      }

      #memberBenefit .section .coupon_list li .coupon_box .text {
        padding: 0 0 ;
        width:100%
      }

      #memberBenefit .section .coupon_list li .coupon_box .text h4 {
        font-family: "ProximaNova-Semibold", "yg750";
        font-size: 28px;
        line-height: 44px;
        margin-bottom: 10px;
        color:#fa5500
      }

      #memberBenefit .section .coupon_list li .coupon_box .text .desc {
        font-family: "ProximaNova-Regular", "yg740";
        font-size: 14px;
        line-height: 18px;
        color: #777;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        width:150px
      }

      #memberBenefit .section .coupon_download_all {
        text-align: center;
        margin-top:60px
      }

      #memberBenefit .section .coupon_download_all button {
        width: 250px;
        font-family: "ProximaNova-Regular", "yg740";
        font-size:16px
      }

      #memberBenefit .brand_coupon_section .coupon_list li .coupon_box .brand_img {
        width: 20%;
        height: 5%;
        position:relative
      }


      #memberBenefit .brand_coupon_section .coupon_list li .coupon_box .brand_img img {
        width: 100%;
        margin:0 auto
      }

      #memberBenefit .brand_coupon_section .coupon_list li .coupon_box .text {
        width: 55%;
        padding:0 22px 0 23px
      }

     #container .sub_title_wrap .sub_title {
        color:#000
      }
      article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
        display:block
      }
      a.btn, button.btn {
        display: inline-block;
        min-width: 180px;
        height: 50px;
        text-align: center;
        line-height: 48px;
        border: 1px solid #333;
        background-color: #fff;
        color: #333;
        font-family: "yg750";
        font-size:14px
      }
      a.btn.black, button.btn.black, input.btn.black, span.btn.black {
        border-color: #000;
        background-color: #000;
        color:#fff
      }
</style>
<section id="container">
      <div id="memberBenefit">
        <input type="hidden" id="focusarea" value="" />
        <div id="pajx_container">
          <div class="content1 tab_content active">
            <div
              class="section brand_coupon_section"
              id="divBrandCouponSection"
            >
              <h3 class="section_tit">BRAND COUPON</h3>
              <ul class="coupon_list">
                <li class="">
                  <div class="coupon_box">
                    <div class="brand_img">
                      <img
                        src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/684x1032/"
                      />
                    </div>
                    <div class="text">
                      <h4><span>15%</span></h4>
                      <p class="tit">여자 가을 신상 15%</p>
                      <p class="desc">2021.11.01 ~ 2021.11.30</p>
                    </div>
                  </div>
                </li>
              </ul>
              <div>
                  <p>
                    <input type="tel" name="tlno" id="tlno" title="전화번호를 입력하세요." placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
                    <input type="checkbox" style="font-size: 0.5em;"> SMS 수신 동인 여부
                  </p>
              </div>
              <div class="coupon_download_all">
                <a href="home" class="btn black nomember">
                  쿠폰 받기
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>