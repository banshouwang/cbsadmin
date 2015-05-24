package com.banshou.app.dao.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.banshou.app.dao.RequestDao;
import com.banshou.app.domain.Request;
import com.banshou.app.domain.Store;
import com.banshou.app.domain.User;
import com.banshou.app.utils.common.CodeGenerator;

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
	public void approveRequest(String number, String flag) {
		Request r = em.find(Request.class, number);
		if (!"delete".equals(flag)) {
			if ("begin".equals(flag)) {
				r.setStatus("In Progress");
			} else if ("finish".equals(flag)) {
				r.setStatus("Finished");
				
				// 添加商店
				String storeNumber = "SD" + CodeGenerator.generateTimeStampString();
				Store s = new Store();
				s.setAddress("");
				s.setBrief("");
				s.setImage("");
				s.setIsvalid(true);
				s.setIsvip(false);
				s.setLatitude("");
				s.setLongitude("");
				s.setName("");
				s.setNumber(storeNumber);
				s.setPoint(0);
				s.setTel("");
				s.setTime(new Date());
				
				em.persist(s);
				
				// 更新用户信息
				String sql = "SELECT * FROM bs_user WHERE u_mobile = '" + r.getMobile() + "'";
				Query query = em.createNativeQuery(sql, User.class);
				User u = (User) query.getSingleResult();
				u.setIsstore(true);
				u.setStoreNum(storeNumber);
				
				em.merge(u);
				em.flush();
				
				
			} else {
				r.setStatus("Cancelled");
			}
			em.merge(r);
			em.flush();
		} else {
			em.remove(r);
		}
	}
}
