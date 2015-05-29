package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.StoreDao;
import com.banshou.app.domain.Store;

@Repository
public class StoreDaoImpl implements StoreDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void addGoods(Store store) {

	}

	@Override
	public List<Store> getAll() {
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Store> cq = builder.createQuery(Store.class);
		Root<Store> root = cq.from(Store.class);
		cq.select(root);
		return em.createQuery(cq).getResultList();
	}

	@Override
	public Store getStoreByNum(String number) {
		Store s = em.find(Store.class, number);
		return s == null ? null : s;
	}

	@Override
	public void updateStoreByNum(Store store) {
		em.merge(store);
		em.flush();
	}

	@Override
	public void deleteByNumber(String number) {
		Store store = em.find(Store.class, number);
		em.remove(store);
	}

	@Override
	public void downStore(String number) {
		Store store = em.find(Store.class, number);
		store.setIsvalid(false);
		em.merge(store);
		em.flush();
	}

	@Override
	public void upStore(String number) {
		Store store = em.find(Store.class, number);
		store.setIsvalid(true);
		em.merge(store);
		em.flush();
	}
}
