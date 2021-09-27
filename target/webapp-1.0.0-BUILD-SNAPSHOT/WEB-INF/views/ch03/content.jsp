<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="card m-2">
	<div class="card-header">Controller/Request Parameter</div>
	<div class="card-body">
		<div class="card m-2">
			<div class="card-header">GET 방식으로 요청</div>
			<div class="card-body">
				<a class="btn btn-info btn-sm"
					href="method1?param1=문자열&param=5&param3=3.14&param4=true&param5=2021-08-27">요청</a>
				<hr />
				<form method="get" action="method1">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param1</span>
						</div>
						<input type="text" class="form-control" value="문자열">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param2</span>
						</div>
						<input type="text" class="form-control" value="5">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param3</span>
						</div>
						<input type="text" class="form-control" value="3.14">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param4</span>
						</div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" checked> true
							</label> <label class="btn btn-secondary"> <input type="radio">
								false
							</label>
						</div>
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param5</span>
						</div>
						<input type="date" class="form-control" value="2030-12-05">
					</div>
					<input class="btn btn-info" type="submit" value="요청" />
				</form>
			</div>
		</div>

		<div class="card m-2">
			<div class="card-header">POST 방식으로 요청</div>
			<div class="card-body">
				<form name="form2" method="post" action="method2">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param1</span>
						</div>
						<input type="text" name="param1" class="form-control" value="문자열">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param2</span>
						</div>
						<input type="text" name="param2" class="form-control" value="5">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param3</span>
						</div>
						<input type="text" name="param3" class="form-control" value="3.14">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param4</span>
						</div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" name="param4" checked> true
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="param4"> false
							</label>
						</div>
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param5</span>
						</div>
						<input type="date" name="param5" class="form-control"
							value="2030-12-05">
					</div>
					<input class="btn btn-info" type="submit" value="요청" />
				</form>
			</div>
		</div>
		<div class="card m-2">
			<div class="card-header">AJAX로 요청</div>
			<div class="card-body">
				<form name="form1" id="form1">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param1</span>
						</div>
						<input type="text" name="param1" class="form-control" id="param1"
							value="문자열">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param2</span>
						</div>
						<input type="text" name="param2" class="form-control" id="param2"
							value="5">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param3</span>
						</div>
						<input type="text" name="param3" class="form-control" id="param3"
							value="3.14">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param4</span>
						</div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary active"> <input
								type="radio" name="param4" id="radio1" checked> true
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="param4" id="radio2"> false
							</label>
						</div>
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">param5</span>
						</div>
						<input type="date" name="param5" id="param5" class="form-control"
							value="2030-12-05">
					</div>
				</form>

				<div>
					<button class="btn btn-info btn-sm" onclick="requestGet()">GET
						방식 요청</button>
					<button class="btn btn-info btn-sm" onclick="requestPost()">POST
						방식 요청</button>
				</div>
			</div>
			<script>
				function requestGet() {
					const param1 = document.form1.param1.value;
					const param2 = document.querySelector("#param2").value;
					const param3 = $("#param3").val();
					const param4 = $("#form1 input[name=param4]:checked").val();
					const param5 = $("#param5").val();
					
					console.log("param1:", param1);
					console.log("param2:", param2);
					console.log("param3:", param3);
					console.log("param4:", param4);
					console.log("param5:", param5);
					
					$.ajax({
						url : "method1",
						method : "get",
						data : {
							param1 : param1,
							param2 : param2,
							param3 : param3,
							param4 : param4,
							param5 : param5
						}
					})
					.done(() => {});
				}

				function requestPost() {
					$.ajax({
						url : "method2",
						method : "post",
						data : {
							param1 : "문자열",
							param2 : 5,
							param3 : 3.14,
							param4 : true,
							param5 : "2021-08-27"
						}
					})
					.done(() => {});
				}
			</script>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>