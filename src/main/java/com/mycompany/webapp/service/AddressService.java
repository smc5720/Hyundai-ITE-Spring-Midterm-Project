package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.AddressDao;
import com.mycompany.webapp.dto.Address;

@Service
public class AddressService {
	private static final Logger logger = LoggerFactory.getLogger(AddressService.class);

	@Resource
	private AddressDao addressDao;

	public int insertAddress(Address address) {
		return addressDao.insertAddress(address);
	}

	public Address getBaseAddress(int mno) {
		return addressDao.selectBaseAddress(mno);
	}

	public List<Address> getAddresses(int mno) {
		return addressDao.selectAddresses(mno);
	}
}
