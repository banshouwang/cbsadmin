package com.banshou.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.banshou.app.dao.RequestDao;
import com.banshou.app.domain.Request;
import com.banshou.app.service.RequestService;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private RequestDao requestDao;
	
	@Override
	@Transactional
	public List<Request> getAll() {
		return requestDao.getAll();
	}

	@Override
	@Transactional
	public void createRequest(Request req) {
		requestDao.createRequest(req);
	}

	@Override
	@Transactional
	public void approveRequest(String number, String flag) {
		requestDao.approveRequest(number, flag);
	}
}
