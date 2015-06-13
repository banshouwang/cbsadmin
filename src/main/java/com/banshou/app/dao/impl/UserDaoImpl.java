package com.banshou.app.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

	@Override
	public void deleteById(String openId) {
		User u = em.find(User.class, openId);
		em.remove(u);
	}

	@SuppressWarnings("unchecked")
	@Override
	public User login(String mobile, String password) {
		String sql = "SELECT * FROM bs_user WHERE u_mobile=? AND u_password=?";
		System.out.println("SQL: " + sql);
		Query query = em.createNativeQuery(sql, User.class);
		query.setParameter(1, mobile);
		query.setParameter(2, password);
		List<User> users = query.getResultList();
		if (users.size() != 0) {
			User u = users.get(0);
			if (u.isIsadmin()) {
				return users.get(0);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllNewUsers() {
		String sql = "SELECT * FROM bs_user where date(u_time) = curdate()";
		Query query = em.createNativeQuery(sql, User.class);
		List<User> users = query.getResultList();
		return users;
	}
}
