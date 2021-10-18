package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CouponMember;
import com.mycompany.webapp.dto.Event;
import com.mycompany.webapp.dto.MyCoupon;

@Mapper
public interface EventDao {
	public List<Event> selectEvents();
	public List<MyCoupon> getjoinedEvents(int mno);
	public MyCoupon getCouponinfo(HashMap<String, Integer> couponInfo);
	public Event selectEventByEno(int eno);
	public int updateRemainCoupons(HashMap<String, Integer> enoRemainCoupons);
	public int insertCouponMember(CouponMember couponMember);
	public int updateCouponState(HashMap<String, Integer> stateEnoCno);
	public int deleteCouponMember(int eno);
	public int updateAllCouponState(HashMap<String, Integer> stateEno);
}
