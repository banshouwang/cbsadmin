package com.banshou.app.service;

import java.util.List;

import com.banshou.app.domain.User;

public interface UserService {
	public List<User> getAll();
	public void deleteById(String openId);
	public User login(String mobile, String password);
}
