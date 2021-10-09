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
                                    <select class="custom-select col-3" name="f" id="f">
                                        <option selected value="pname">상품명</option>
                                        <option value="onum">주문번호</option>
                                    </select>
                                    <input type="text" class="d-inline form-control col-7" name="q" value=""/>
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
                    <c:forEach var="orders" items="${productOrders}">
                    <tbody>
                        <tr class="row">
                            <td class="col-2 text-center ono">${orders.ono}</td>
                            <td class="col border-left">
                                <div class="card border-white" style="max-width: 410px;">
                                    <div class="row no-gutters">
                                        <div class="col-md-4">
                                            <img class="img-thumbnail" src="${orders.cimageproduct1}" alt="...">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body p-1 ml-2">
                                                <p class="card-text">${orders.bname}</p>
                                                <p class="card-title font-weight-bolder">${orders.pname}</p>
                                                <p class="card-text"><small class="text-muted">color : ${orders.pcolor} / size :
                                                        ${orders.psize}</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="col-1 text-center align-middle border-left">${orders.oamount}</td>
                            <td class="col-1 text-center align-middle border-left">
                            	<small>￦<fmt:formatNumber value="${orders.pprice * orders.oamount}"/></small>
                           	</td>
                            <td class="col-1 text-center align-middle border-left">
                            	<c:if test="${orders.ostate eq '0'}">
                            		<c:out value="주문완료"/>
                            	</c:if>
                            	<c:if test="${orders.ostate eq '1'}">
                            		<c:out value="배송중"/>
                            	</c:if>
                            	<c:if test="${orders.ostate eq '2'}">
                            		<c:out value="배송완료"/>
                            	</c:if>
                           	</td>
                            <td class="col-1 text-center align-middle border-left"></td>
                        </tr>
                     </c:forEach>
                     
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