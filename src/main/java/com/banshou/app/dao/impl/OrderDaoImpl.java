package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.OrderDao;
import com.banshou.app.domain.Order;
import com.banshou.app.utils.common.RandomStrUtil;

@Repository
public class OrderDaoImpl implements OrderDao {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getToday() {
		try {
			String today = RandomStrUtil.getTimeString("yyyyMMdd");
			String sql = "SELECT * FROM bs_order WHERE o_creatTime regexp '^" + today + "'";
			System.out.println("SQL: " + sql);
			Query query = em.createNativeQuery(sql, Order.class);
			List<Order> orders = query.getResultList();
			return orders;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void deleteByNumber(String number) {
		Order order = em.find(Order.class, number);
		em.remove(order);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getAllByStoreNumber(String storeNumber) {
		String sql = "";
		if ("all".equals(storeNumber)) {
			sql = "SELECT * FROM bs_order";
		} else {
			sql = "SELECT a.* FROM bs_order as a, bs_store_order as b WHERE a.o_number = b.o_number and b.s_number = '" + storeNumber + "'";
		}
		Query query = em.createNativeQuery(sql, Order.class);
		List<Order> o = query.getResultList();
		return o;
	}
}
