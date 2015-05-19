package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.UserDao;
import com.banshou.app.domain.User;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<User> getAll() {
		CriteriaBuilder builder = em.getCriteriaBuilder();
	    CriteriaQuery<User> cq = builder.createQuery(User.class);
	    Root<User> root = cq.from(User.class);
	    cq.select(root);
	    return em.createQuery(cq).getResultList();
	}
	
	

}
