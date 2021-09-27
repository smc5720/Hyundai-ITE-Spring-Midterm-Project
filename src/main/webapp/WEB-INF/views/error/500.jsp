<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">서버 실행 오류</div>
	<div class="card-body">
		<p>어떤 이유 때문에 서버에서 처리하지 못했습니다.</p>
		<p>일시 서버 오류이므로 조금 후 다시 시도해주세요.</p>
		<div>
			<a href="${pageContext.request.contextPath}/"
				class="btn btn-danger btn-sm">홈으로 가기</a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>