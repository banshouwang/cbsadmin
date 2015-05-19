package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.RequestDao;
import com.banshou.app.domain.Request;

@Repository
public class RequestDaoImpl implements RequestDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public void createRequest(Request req) {
		em.persist(req);
	}

	@Override
	public List<Request> getAll() {
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Request> cq = builder.createQuery(Request.class);
		Root<Request> root = cq.from(Request.class);
		cq.select(root);
		return em.createQuery(cq).getResultList();
	}

	@Override
	public void approveRequest(int id, String mobile) {
		
	}
	
	
}
