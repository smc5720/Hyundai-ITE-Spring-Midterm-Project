<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">Spring Security</div>
	<div class="card-body">
		<div class="card">
			<div class="card-header">로그인/로그아웃</div>
			<div class="card-body">
				<sec:authorize access="isAnonymous()">
					<a href="${pageContext.request.contextPath}/member/loginForm"
						class="btn btn-info btn-sm">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<%-- 사이트간 요청 위조 방지가 비활성화되어 있을 경우 --%>
					<%-- <a href="${pageContext.request.contextPath}/logout"
						class="btn btn-info btn-sm">로그아웃</a> --%>

					<%-- 사이트간 요청 위조 방지가 활성화되어 있을 경우 --%>
					<form method="post"
						action="${pageContext.request.contextPath}/logout"
						class="d-inline-block">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token}" />
						<button class="btn btn-info btn-sm">로그아웃</button>
					</form>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>