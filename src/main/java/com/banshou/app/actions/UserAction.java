package com.banshou.app.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.banshou.app.domain.User;
import com.banshou.app.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(UserAction.class);

	private String mobile;
	private String password;
	private Map<String, Object> session;
	private Map<String, Object> dataMap = null;

	@Autowired
	UserService userService;

	public String getAllUsers(){
		LOGGER.info("[cbsadmin] - [UserAction] {getAllUsers method} begin to query all users from DB");
		dataMap = new HashMap<String, Object>();
		List<User> users = null;
		
		try{
			users = userService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			dataMap.put("data", users);
		}
		
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

}