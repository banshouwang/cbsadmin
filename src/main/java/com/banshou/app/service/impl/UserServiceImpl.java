package com.banshou.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.banshou.app.dao.UserDao;
import com.banshou.app.domain.User;
import com.banshou.app.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Override
	@Transactional
	public void deleteById(String openId) {
		userDao.deleteById(openId);
	}

	@Override
	@Transactional
	public User login(String mobile, String password) {
		return userDao.login(mobile, password);
	}

	@Override
	public List<User> getAllNewUsers() {
		return userDao.getAllNewUsers();
	}
}
