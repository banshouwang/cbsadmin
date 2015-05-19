package com.banshou.app.service;

import java.util.List;

import com.banshou.app.domain.Request;

public interface RequestService {
	public void createRequest(Request req);
	public List<Request> getAll();
	public void approveRequest(int id, String mobile);
}
