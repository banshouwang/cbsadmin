package com.banshou.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.banshou.app.dao.OrderDao;
import com.banshou.app.domain.Order;
import com.banshou.app.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Override
	@Transactional
	public List<Order> getToday() {
		return orderDao.getToday();
	}

	@Override
	@Transactional
	public void deleteByNumber(String number) {
		orderDao.deleteByNumber(number);
	}

	@Override
	@Transactional
	public List<Order> getAllByStoreNumber(String storeNumber) {
		return orderDao.getAllByStoreNumber(storeNumber);
	}
}
