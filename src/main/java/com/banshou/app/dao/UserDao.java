package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.User;

public interface UserDao {
	public List<User> getAll();
	public void deleteById(String openId);
}
