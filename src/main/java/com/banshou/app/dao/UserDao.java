package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.User;

public interface UserDao {
	public List<User> getAll();
	public List<User> getAllNewUsers();
	public void deleteById(String openId);
	public User login(String mobile, String password);
}
