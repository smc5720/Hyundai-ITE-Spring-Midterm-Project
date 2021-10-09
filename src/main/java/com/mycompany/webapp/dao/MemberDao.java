package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Member;

@Mapper
public interface MemberDao {
	public int selectMno(String mid);
	public Member selectMember(int mno);
}