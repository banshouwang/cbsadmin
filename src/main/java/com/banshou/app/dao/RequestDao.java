package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.Request;

public interface RequestDao {
	public void createRequest(Request req);
	public List<Request> getAll();
	public void approveRequest(int id, String mobile);
}
