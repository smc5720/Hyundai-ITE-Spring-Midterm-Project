package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
	public int selectMno(String mid);
}