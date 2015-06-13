package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.OrderDao;
import com.banshou.app.domain.Order;

@Repository
public class OrderDaoImpl implements OrderDao {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getToday() {
		String sql = "SELECT * FROM bs_order where date(o_createTime) = curdate()";
		Query query = em.createNativeQuery(sql, Order.class);
		List<Order> orders = query.getResultList();
		return orders;
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
