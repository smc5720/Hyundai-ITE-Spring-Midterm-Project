package com.mycompany.webapp.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 객체로 생성해서 관리하도록 설정
@Component
// 모든 컨트롤러에 영향을 미치는 설정
@ControllerAdvice
public class ControllerExceptionHandler {
	private static final Logger logger = LoggerFactory.getLogger(ControllerExceptionHandler.class);

	@ExceptionHandler
	public String handleOtherException(Exception e) {
		logger.info("실행");
		return "error/500";
	}
}
