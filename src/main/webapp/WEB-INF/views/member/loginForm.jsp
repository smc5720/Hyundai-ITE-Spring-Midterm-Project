<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <style>
      @media (min-width: 560px) {
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
			<p>
				<input style="width: 100%;" type="text"
					placeholder="아이디 / 이메일을 입력하세요.">
			</p>
			<p>
				<input style="width: 100%;" type="password"
					placeholder="비밀번호를 입력하세요.">
			</p>
			<a href="" class="btn btn-dark btn-block mb-2">로그인</a>
			<p style="font-size: 0.7em;">
				<input type="checkbox"> 아이디 저장
			</p>
		</div>
	</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
