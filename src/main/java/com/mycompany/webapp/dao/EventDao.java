package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Event;

@Mapper
public interface EventDao {
	public List<Event> selectEvents();
	public Event selectEventByEno(int eno);
}
