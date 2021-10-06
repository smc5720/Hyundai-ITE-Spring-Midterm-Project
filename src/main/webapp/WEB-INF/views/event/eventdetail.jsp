<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section class="container">
	<div class="card mb-3">
		<img src="${pageContext.request.contextPath}/resources/images/${event.eimage}" class="card-img-top" alt="eventimage">
		<div class="card-body">
			<h5 class="card-title">${event.ename}</h5>
			<p class="card-text">${event.econtent}</p>
			<p class="card-text">
				<small class="text-muted">이벤트 기간: ${event.estartdate} ~ ${event.eenddate}</small>
			</p>
			<p class="card-text">
				<small class="text-muted">남은 쿠폰 개수: ${event.ecouponremain} / ${event.ecouponamount}</small>
			</p>
			<p class="card-text"><button type="button" class="btn btn-light btn-lg btn-block">참여하기</button></p>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>