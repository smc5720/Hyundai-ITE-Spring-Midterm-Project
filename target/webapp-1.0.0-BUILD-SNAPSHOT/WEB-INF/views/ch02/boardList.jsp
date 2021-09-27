<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">게시물 목록</div>
	<div class="card-body">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
					<th scope="col">글쓴이</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 1; i <= 5; i++) {
				%>
				<tr>
					<th scope="row"><%=i%></th>
					<td>제목<%=i%></td>
					<td>내용<%=i%></td>
					<td>이름<%=i%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>