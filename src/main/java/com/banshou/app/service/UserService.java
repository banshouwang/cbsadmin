package com.banshou.app.service;

import com.banshou.app.dao.UserDao;
import com.banshou.app.domain.User;

public class UserService {
	
	UserDao userDao = null;
	public UserService(){
		userDao = new UserDao();
	}
	public int addUser(User user){
		return userDao.reg(user);
	}
	public boolean checkMobile(String mobile){
		return userDao.checkMobile(mobile);
	}
	public boolean checkOpenId(String openId){
		return userDao.checkOpenId(openId);
	}
	public boolean addPoint(String openId, String point){
		return userDao.addPoint(openId, point);
	}
}
