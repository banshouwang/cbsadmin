package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.Order;

public interface OrderDao {
	public List<Order> getAllByStoreNumber(String storeNumber);
	public List<Order> getToday();
	public void deleteByNumber(String number);
}
