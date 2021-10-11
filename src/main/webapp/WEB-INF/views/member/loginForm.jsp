<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
@media ( min-width : 560px) {
	.container {
		max-width: 560px;
	}
}
</style>

<div class="container">
	<div id="login" class="mb-4">
		<p style="text-align: center; margin-bottom: 1em; font-size: 17px;">로그인</p>
		<div class="card-header"
			style="border: 1px solid lightgray; background-color: white;">
			회원
			<hr />
			<div>
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
					<div class="alert  mb-2" style="color: #c69c6c;" role="alert">
						<c:if
							test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
               아이디 또는 비밀번호가 올바르지 않습니다.
               </c:if>
						<c:if
							test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION.message, 'principal exceeded')}">
               인증 횟수가 초과되었습니다.
               </c:if>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					</div>
				</c:if>
				<form method="post"
					action="${pageContext.request.contextPath}/login">
					<p>
						<input style="width: 100%;" id="mid" name="mid" type="text"
							placeholder="아이디 / 이메일을 입력하세요." value="">
					</p>
					<p>
						<input style="width: 100%;" id="mpassword" name="mpassword"
							type="password" placeholder="비밀번호를 입력하세요.">
					</p>
					<button class="btn btn-dark btn-block mb-2">로그인</button>
					<p style="font-size: 0.7em;">
						<!-- <input type="checkbox" id="saveId"> 아이디 저장 -->
					</p>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>