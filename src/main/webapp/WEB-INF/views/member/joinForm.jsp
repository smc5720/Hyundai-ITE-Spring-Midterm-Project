<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">회원가입 폼</div>
	<div class="card-body">
		<c:if test="${error != null}">
			<div class="alert alert-danger mb-2" role="alert">${error}</div>
		</c:if>

		<form method="post" action="join">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
			<div class="form-group">
				<label for="mid">Member ID</label> <input type="text"
					class="form-control" id="mid" name="mid">
			</div>
			<div class="form-group">
				<label for="mname">Member Name</label> <input type="text"
					class="form-control" id="mname" name="mname">
			</div>
			<div class="form-group">
				<label for="mpassword">Member Password</label> <input
					type="password" class="form-control" id="mpassword"
					name="mpassword">
			</div>
			<div class="form-group">
				<label for="mrole">Member Role</label> <select class="form-control"
					id="mrole" name="mrole">
					<option value="ROLE_ADMIN">Admin</option>
					<option value="ROLE_MANAGER">Manager</option>
					<option value="ROLE_USER" selected>User</option>
				</select>
			</div>
			<button type="submit" class="btn btn-info btn-sm mt-2">회원가입</button>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>