package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.GoodsDao;
import com.banshou.app.domain.Goods;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void deleteById(String id) {
		Goods goods = em.find(Goods.class, id);
		em.remove(goods);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> getAllByStoreNumber(String storeNumber) {
		String sql = "";
		if ("all".equals(storeNumber)) {
			sql = "SELECT * FROM bs_goods";
		} else {
			sql = "SELECT * FROM bs_goods WHERE g_storeNum = '" + storeNumber + "'";
		}
		Query query = em.createNativeQuery(sql, Goods.class);
		List<Goods> g = query.getResultList();
		return g;
	}

	@Override
	public void downGoods(String number) {
		Goods goods = em.find(Goods.class, number);
		goods.setIsvalid(false);
		em.merge(goods);
		em.flush();
	}

	@Override
	public void upGoods(String number) {
		Goods goods = em.find(Goods.class, number);
		goods.setIsvalid(true);
		em.merge(goods);
		em.flush();
	}
}
