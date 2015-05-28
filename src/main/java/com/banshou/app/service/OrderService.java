package com.banshou.app.service;

import java.util.List;

import com.banshou.app.domain.Order;

public interface OrderService {
	public List<Order> getAllByStoreNumber(String storeNumber);
	public List<Order> getToday();
	public void deleteByNumber(String number);
}	
