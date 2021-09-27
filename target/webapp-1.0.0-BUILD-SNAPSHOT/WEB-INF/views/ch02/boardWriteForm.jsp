<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">게시물 작성</div>
	<div class="card-body">
		<%--<form method="POST" action="<%=application.getContextPath()%>/ch02/boardwrite"> --%>
		<%--<form method="POST"
			action="boardwrite"> --%>
		<form method="POST"
			action="${pageContext.request.contextPath}/ch02/boardwrite">
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea type="text" class="form-control" id="content"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">저장</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>