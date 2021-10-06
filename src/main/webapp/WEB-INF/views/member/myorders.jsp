<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h3 class="text-center m-4 border-top border-bottom p-4">
        <span>주문/배송</span>
    </h3>
    <section class="container">
        <div class="row">
            <nav class="col-md-2 p-3 h-100 d-flex flex-column">
                <div class="bg-dark">
                    <p class="text-white text-center mt-3">마이페이지</p>
                </div>
                <div class="p-3 border">
                    <dl>
                        <dt>주문조회</dt>
                        <dd><a class="text-secondary ml-2" href="">주문/배송</a></dd>                        
                    </dl>
                    <dl>
                        <dt>나의 상품관리</dt>
                        <dd><a class="text-secondary ml-2" href="shoppingbag">쇼핑백</a></dd>
                    </dl>
                </div>
            </nav>

            <article class="col-10 p-3">
                <form>
                    <div class="container-fluid row bg-light border pt-4">
                        <ul>
                            <li>
                                <p class="d-inline col-2">조회기간</p>
                                <div class="d-inline">
                                    <input type="date" class="d-inline form-control col-3 mr-2">
                                    ~
                                    <input type="date" class="d-inline form-control col-3 ml-2 mr-2">
                                    <button type="button" class="btn btn-light btn-sm border">1주일</button>
                                    <button type="button" class="btn btn-light btn-sm border">1개월</button>
                                    <button type="button" class="btn btn-light btn-sm border">3개월</button>
                                </div>
                            </li>
                            <li>
                                <p class="d-inline col-2">검색구분</p>
                                <div class="d-inline">
                                    <select class="custom-select col-3" name="cars" id="cars">
                                        <option selected value="pname">상품명</option>
                                        <option value="onum">주문번호</option>
                                    </select>
                                    <input type="text" class="d-inline form-control col-7">
                                </div>
                            </li>
                        </ul>
                        <button class="btn btn-sm btn-secondary ml-3 mb-2">조회하기</button>
                    </div>
                </form>
                <div>
                    <h6 class="mt-5 mb-3 font-weight-bold">상품 주문 목록</h6>
                </div>
                <table class="table">
                    <thead>
                        <tr class="row bg-light">
                            <td class="col-2 text-center">주문번호</td>
                            <td class="col text-center">상품정보</td>
                            <td class="col-1 text-center">수량</td>
                            <td class="col-1 text-center">판매가</td>
                            <td class="col-1 text-center"><small>주문상태</small></td>
                            <td class="col-1 text-center">구분</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="row">
                            <td class="col-2 text-center">2109984984</td>
                            <td class="col border-left">
                                <div class="card border-white" style="max-width: 540px;">
                                    <div class="row no-gutters">
                                        <div class="col-md-4">
                                            <img class="img-thumbnail" src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B3ASZ886CS_GN_S01.jpg" alt="...">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body p-1 ml-2">
                                                <p class="card-text">the CASHMERE</p>
                                                <p class="card-title font-weight-bolder">[KONGES SLOJD] 헨리넥 셔츠</p>
                                                <p class="card-text"><small class="text-muted">color : BROWN / size :
                                                        130</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="col-1 text-center align-middle border-left">1</td>
                            <td class="col-1 text-center align-middle border-left"><small>￦70,000</small></td>
                            <td class="col-1 text-center align-middle border-left">취소</td>
                            <td class="col-1 text-center align-middle border-left"></td>
                        </tr>
                        <tr class="row">
                            <td class="col text-center">
                                <a class="text-secondary" href="">≪</a>
                                <a class="text-secondary" href="">＜</a>
                                <a class="text-secondary" href="">1</a>
                                <a class="text-secondary" href="">＞</a>
                                <a class="text-secondary" href="">≫</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </article>
        </div>
    </section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>