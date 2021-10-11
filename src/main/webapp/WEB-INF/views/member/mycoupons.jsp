<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h3 class="text-center m-4 border-top border-bottom p-4">
	<span>보유중인 쿠폰</span>
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
			<div>
				<h6 class="mt-5 mb-3 font-weight-bold">쿠폰 목록</h6>
			</div>
			<table class="table">
				<thead>
					<tr class="row bg-light">
						<td class="col-1 text-center border-left"><small>쿠폰번호</small></td>
						<td class="col-8 text-center border-left">이벤트정보</td>
						<td class="col-2 text-center border-left">만료기한</td>
						<td class="col-1 text-center border-left border-right"><small>쿠폰상태</small></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hadCoupon" items="${hadCoupons}" varStatus="i">
						<tr class="row">
							<td class="col-1 text-center align-middle border-left">${hadCoupon.eno}-${hadCoupon.cno}</td>
							<td class="col-8 border-left">
								<div class="card border-white" style="max-width: 540px;">
									<div class="row no-gutters">
										<div class="col-md-5">
											<a
												href="${pageContext.request.contextPath}/event/eventdetail?eno=${events[i.index].eno}">
												<img class="img-thumbnail"
												src="${pageContext.request.contextPath}/resources/images/${events[i.index].eimage}"
												alt="event-image">
											</a>
										</div>
										<div class="col-md-7">
											<div class="card-body p-1 ml-2">
												<p class="card-title font-weight-bolder">${events[i.index].ename}</p>
												<p class="card-text">${events[i.index].econtent}</p>
												<p class="card-text">
													<small class="text-muted">${events[i.index].estartdate}
														~ ${events[i.index].eenddate}</small>
												</p>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td class="col-2 text-center align-middle border-left"><fmt:formatDate
									value="${hadCoupon.cdate}" type="DATE" pattern="yyyy-MM-dd" /></td>
							<td
								class="col-1 text-center align-middle border-left border-right"><c:if
									test="${hadCoupon.cstate == 1}">
									<small>발급완료</small>
								</c:if></td>
						</tr>
					</c:forEach>
					<tr class="row">
						<td class="col-12"></td>
					</tr>
				</tbody>
			</table>
		</article>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>