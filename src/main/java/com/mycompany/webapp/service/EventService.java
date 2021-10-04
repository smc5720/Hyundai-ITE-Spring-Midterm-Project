package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.EventDao;
import com.mycompany.webapp.dto.Event;

@Service
public class EventService {
	private static final Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Resource
	private EventDao eventDao;

	public List<Event> getEvents(){
		return eventDao.selectEvents();
	}
	
	public Event getEventByEno(int eno){
		return eventDao.selectEventByEno(eno);
	}
}
