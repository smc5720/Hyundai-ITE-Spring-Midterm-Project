package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Event;
import com.mycompany.webapp.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@Resource
	EventService eventService;

	@GetMapping(value = "/getEventList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getEventList() {
		logger.info("실행");

		List<Event> events = eventService.getEvents();

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("events", events);
		String json = jsonObject.toString();

		return json;
	}
	
	@RequestMapping("/eventdetail")
	public String eventDetail(int eno, Model model) {
		logger.info("실행");
		
		Event event = eventService.getEventByEno(eno);
		model.addAttribute("event", event);
		
		return "event/eventdetail";
	}

}
