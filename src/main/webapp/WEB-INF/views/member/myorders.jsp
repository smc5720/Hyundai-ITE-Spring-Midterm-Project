<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
a {
	color: black;
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
</style>

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
					<dd>
						<a class="text-secondary ml-2" href="myorders">주문/배송</a>
					</dd>
				</dl>
				<dl>
					<dt>나의 상품관리</dt>
					<dd>
						<a class="text-secondary ml-2" href="shoppingbag">쇼핑백</a>
					</dd>
				</dl>
				<dl>
					<dt>쿠폰</dt>
					<dd>
						<a class="text-secondary ml-2" href="mycoupons">내 쿠폰</a>
					</dd>
				</dl>
			</div>
		</nav>

		<article class="col-10 p-3">
			<form method="get" action="myorders">
				<div class="container-fluid bg-light border p-4">
					<div class="d-flex align-items-center">
						<div class="ml-2 mr-auto">검색구분</div>
						<div class="mr-2">
							<select class="custom-select" name="type" id="type">
								<option <c:if test="${type eq 'pcode'}">selected</c:if> value="pcode">상품코드</option>
								<option <c:if test="${type eq 'pname'}">selected</c:if> value="pname">상품이름</option>
							</select>
						</div>
						<div class="mr-2">
							<input type="text" class="form-control" name="keyword"
								id="keyword" size="65" value="${keyword}" />
						</div>
						<div class="mr-2 ml-auto">
							<button class="btn btn-sm btn-secondary">조회하기</button>
						</div>
					</div>
				</div>
			</form>
			<div>
				<h6 class="mt-5 mb-3 font-weight-bold">상품 주문 목록</h6>
			</div>
			<table class="table" id="ono">
				<thead>
					<tr class="row bg-light">
						<td class="col-1 text-center"><small>주문번호</small></td>
						<td class="col text-center"><small>상품정보</small></td>
						<td class="col-1 text-center"><small>수량</small></td>
						<td class="col-2 text-center"><small>판매가</small></td>
						<td class="col-1 text-center"><small>주문상태</small></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orders" items="${productOrders}">
						<tr class="row">
							<td class="col-1 text-center">${orders.ono}</td>
							<td class="col border-left">
								<div class="card border-white" style="max-width: 410px;">
									<div class="row no-gutters">
										<div class="col-md-4">
											<img class="img-thumbnail" src="${orders.cimageproduct1}"
												alt="...">
										</div>
										<div class="col-md-8">
											<div class="card-body p-1 ml-2">
												<p class="card-text">
													<small>${orders.pcode}</small>
												</p>
												<p class="card-text">${orders.bname}</p>
												<a
													href="${pageContext.request.contextPath}/product/productdetail?pcode=${orders.pcode}&cproductcolor=${orders.pcolor}"><p
														class="card-title font-weight-bolder">${orders.pname}</p></a>
												<p class="card-text">
													<small class="text-muted">color : ${orders.pcolor}
														/ size : ${orders.psize}</small>
												</p>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td class="col-1 text-center align-middle border-left">${orders.oamount}</td>
							<td class="col-2 text-center align-middle border-left">￦<fmt:formatNumber
									value="${orders.pprice * orders.oamount}" /></td>
							<td class="col-1 text-center align-middle border-left"><small><c:if
										test="${orders.ostate eq '0'}">
										<c:out value="주문완료" />
									</c:if> <c:if test="${orders.ostate eq '1'}">
										<c:out value="배송중" />
									</c:if> <c:if test="${orders.ostate eq '2'}">
										<c:out value="배송완료" />
									</c:if></small></td>
						</tr>
					</c:forEach>

					<tr class="row">
						<td class="col text-center">
							<div id="pager-container" class="container text-center">
								<a href="myorders?type=${type}&keyword=${keyword}&pageNo=1">처음</a>
								<c:if test="${pager.groupNo > 1}">
									<a class="btn btn-light btn-sm"
										href="myorders?type=${type}&keyword=${keyword}&pageNo=${pager.startPageNo-1}">이전</a>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}"
									end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-light btn-sm"
											href="myorders?type=${type}&keyword=${keyword}&pageNo=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-outline-dark btn-sm"
											href="myorders?type=${type}&keyword=${keyword}&pageNo=${i}">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${pager.groupNo < pager.totalGroupNo}">
									<a
										href="myorders?type=${type}&keyword=${keyword}&pageNo=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a
									href="myorders?type=${type}&keyword=${keyword}&pageNo=${pager.totalPageNo}">끝</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>