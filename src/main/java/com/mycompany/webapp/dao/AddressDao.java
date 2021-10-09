package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Address;

@Mapper
public interface AddressDao {
	public int insertAddress(Address address);
	public Address selectBaseAddress(int mno);
	public List<Address> selectAddresses(int mno);
}
