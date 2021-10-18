package com.mycompany.webapp.controller;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CouponMember;
import com.mycompany.webapp.dto.Event;
import com.mycompany.webapp.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@Resource
	EventService eventService;	
	
	public static JSONObject brandListJson = new JSONObject();
	public static JSONObject eventListJson = new JSONObject();

	public EventController() {
		eventListJson.put("result", "fail");
	}

	@GetMapping(value = "/getEventList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getEventList() {

		if (!eventListJson.get("result").equals("success")) {
			List<Event> events = eventService.getEvents();

			eventListJson.put("result", "success");
			eventListJson.put("events", events);
		}
		
		String json = eventListJson.toString();

		return json;
	}

	@RequestMapping("/eventdetail")
	public String eventDetail(int eno, Model model) {
		logger.info("실행");

		Event event = eventService.getEventByEno(eno);
		model.addAttribute("event", event);

		return "event/eventdetail";
	}

	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	@RequestMapping(value = "/joinEvent", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String joinEvent(int eno, HttpSession session) throws Exception {
		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {

				Event event = eventService.getEventByEno(eno);
				int remainCoupons = event.getEcouponremain();
				int totalCoupons = event.getEcouponamount();

				// 남아있는 쿠폰이 0보다 클 경우
				if (remainCoupons > 0) {
					CouponMember cm = new CouponMember();
					cm.setMno(Integer.parseInt(session.getAttribute("mno").toString()));
					cm.setCno(totalCoupons - remainCoupons + 1);
					cm.setEno(eno);
					// 쿠폰 발행(쿠폰 멤버 값 추가 + 쿠폰 잔여 수량 1 감소)
					eventService.giveCoupon(eno, remainCoupons, cm);
					// 이벤트 참가 성공
					return 1;
				} else {
					// 이벤트 참가 실패
					return 0;
				}
			}
		};

		Future<Integer> future = executorService.submit(task);

		// 이벤트 처리가 완료될 때까지 대기
		int result = future.get();

		JSONObject jsonObject = new JSONObject();

		if (result == 1) {
			jsonObject.put("result", "success");
		} else {
			jsonObject.put("result", "fail");
		}

		return jsonObject.toString();
	}
	
	@RequestMapping("/resetEvent")
	public String resetEvent(int eno) {

		eventService.resetEvent(eno);
		return "redirect:/";
	}
}
