package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Resource
	private MemberDao memberDao;

	public int getMno(String mid){
		return memberDao.selectMno(mid);
	}
}
