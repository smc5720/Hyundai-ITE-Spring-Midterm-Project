package com.mycompany.webapp.security;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.mycompany.webapp.service.MemberService;

/*
 * SimpleUrlAuthenticationSuccessHandler
 * 로그인 성공후에 무조건 홈으로 이동
 * SavedRequestAwareAuthenticationSuccessHandler
 * 로그인 성공후에 사용자가 접근하고자 했던 페이지로 이동
 */
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandler.class);

	@Resource
	MemberService memberService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// 로그인에 성공하면 mid로 DB에서 mno 값을 가져와 세션에 저장한다.
		request.getSession().setAttribute("mno", memberService.getMno(authentication.getName()));
		// 브라우저를 종료하거나, 로그아웃(핸들러)을 하면 mno 값은 날아간다.
		super.onAuthenticationSuccess(request, response, authentication);
	}
}