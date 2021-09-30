<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	a.btn, button.btn {
	  display: inline-block;
	  min-width: 180px;
	  height: 50px;
	  text-align: center;
	  line-height: 48px;
	  background-color: #fff;
	  color: #333;
	  font-family: "yg750";
	  font-size:14px
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