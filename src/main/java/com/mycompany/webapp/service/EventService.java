package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.EventDao;
import com.mycompany.webapp.dto.CouponMember;
import com.mycompany.webapp.dto.Event;
import com.mycompany.webapp.dto.MyCoupon;

@Service
public class EventService {
	private static final Logger logger = LoggerFactory.getLogger(EventService.class);

	@Resource
	private EventDao eventDao;

	public List<Event> getEvents() {
		return eventDao.selectEvents();
	}

	public List<MyCoupon> getjoinedEvents(int mno){
		return eventDao.getjoinedEvents(mno);
	}
	
	public MyCoupon getCouponinfo(int eno, int cno){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("eno", eno);
		map.put("cno", cno);
		return eventDao.getCouponinfo(map);
	}

	public Event getEventByEno(int eno) {
		return eventDao.selectEventByEno(eno);
	}

	public int updateRemainCoupons(int eno, int remainCoupons) {
		HashMap<String, Integer> enoRemainCoupons = new HashMap<String, Integer>();
		enoRemainCoupons.put("eno", eno);
		enoRemainCoupons.put("remainCoupons", remainCoupons);
		return eventDao.updateRemainCoupons(enoRemainCoupons);
	}

	public int insertCouponMember(CouponMember couponMember) {
		return eventDao.insertCouponMember(couponMember);
	}

	public int updateCouponState(int state, int eno, int cno) {
		HashMap<String, Integer> stateEnoCno = new HashMap<String, Integer>();
		stateEnoCno.put("eno", eno);
		stateEnoCno.put("cno", cno);
		stateEnoCno.put("state", state);
		return eventDao.updateCouponState(stateEnoCno);
	}

	@Transactional
	public void giveCoupon(int eno, int remainCoupons, CouponMember couponMember) {
		try {
			insertCouponMember(couponMember);
			updateRemainCoupons(eno, remainCoupons - 1);
			updateCouponState(1, eno, couponMember.getCno());
		} catch (Exception e) {
			logger.info("우린 실패했어");
		}
	}
}
