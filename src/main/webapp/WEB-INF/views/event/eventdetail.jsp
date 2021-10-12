<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section class="container">
	<div class="card mb-3">
		<img
			src="${pageContext.request.contextPath}/resources/images/${event.eimage}"
			class="card-img-top" alt="eventimage">
		<div class="card-body">
			<h5 class="card-title">${event.ename}</h5>
			<p class="card-text">${event.econtent}</p>
			<p class="card-text">
				<small class="text-muted">이벤트 기간: ${event.estartdate} ~
					${event.eenddate}</small>
			</p>
			<p class="card-text">
				<small class="text-muted">남은 쿠폰 개수: ${event.ecouponremain} /
					${event.ecouponamount}</small>
			</p>
			<p class="card-text">
				<a href="javascript:joinEvent()" type="button"
					class="btn btn-primary btn-lg btn-block">참여하기</a>
			</p>
			<script>
				function joinEvent() {
					if ("${mno}" === "") {
						location.href = "/loginForm";
					}
					
					else {
					for(let i = 0; i < 300; i++) {
						$.ajax({
							url: "/event/joinEvent",
							data: {
								"eno" : ${event.eno}
							}
						}).done((data) => {
							if (data.result === "success") {
								// window.alert("쿠폰 발급 완료!");
								console.log("쿠폰 발급 완료!");
							} else {
								// window.alert("쿠폰이 소진되었습니다.");
								console.log("쿠폰이 소진되었습니다.");
							}
							
							// window.location.href = "eventdetail?eno=${event.eno}";
						});
					}
				}
			}
			</script>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>