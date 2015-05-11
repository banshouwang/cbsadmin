package com.banshou.app.actions;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.banshou.app.dao.RequestDao;
import com.banshou.app.domain.Request;
import com.banshou.app.domain.User;
import com.banshou.app.service.UserService;
import com.banshou.app.utils.common.CodeGenerator;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(UserAction.class);

	private String password;
	private String mobile;
	private String openId;
	private String point;
	private String shop;
	private static User user = null;
	private static UserService userService = null;
	private Map<String, Object> session;
	private Map<String, Object> dataMap = null;
	
	static {
		user = new User();
		userService = new UserService();
	}
	
	public UserAction(){
		dataMap = new HashMap<String, Object>();
	}
	
	
	public String reg(){
		LOGGER.info("[UserAction] {reg method} begin to handle the registry information...");
		user.setNumber(CodeGenerator.UUIDGenerator());
		user.setOpenId(openId);
		System.out.println(mobile);
		user.setCreditId(0);
		user.setIsvip(false);
		user.setMobile(mobile);
		user.setPassword(password);
		user.setIsshop(false);
		user.setPoint(0);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String regtime = sdf.format(new Date());
		
		user.setTime(regtime);
		
		if("shopyes".equals(shop)){
			LOGGER.info("[UserAction] {reg method} create shop request start ...");
			Request request = new Request();
			RequestDao rd = new RequestDao();
			request.setCategory("isshop");
			request.setMobile(mobile);
			request.setStatus(regtime);
			request.setStatus("In Progress");
			rd.createRequest(request);
		}
		
		int result = userService.addUser(user);
		LOGGER.info("[UserAction] DB result is: "+result);
		LOGGER.info("[UserAction] registry gonna to end...");
		if(result > 0){
			return SUCCESS;
		}
		return "REGFAIL";
	}
	
	public String login(){
		boolean result = userService.checkOpenId(openId);
		
		if(result){
			/**
			 * placeholder for get information by weixin interface via openid
			 */
			System.out.println("openId: "+openId);
			session.put("openId", openId);
			return SUCCESS;
		}else{
			session.put("openId_for_reg", openId);
			return "REGISTRY";
		}
	}
	
	public String mobileValid(){
		LOGGER.info("[UserAction] {mobile valid method} begin ...");
		LOGGER.info("[UserAction] the mobile number is: " + mobile);
		
		//生成手机验证码并发送到手机
		String validCode = CodeGenerator.mobileValid();
		
		
		session.put("validCode", validCode);
		session.put("mobile", mobile);
		LOGGER.info("[UserAction] {mobile valid method} end ...");
		return SUCCESS;
	}
	
	public String checkMobile(){
		boolean result = userService.checkMobile(mobile);
		LOGGER.info("[UserAction] the result of check mobile is: " + result);
		dataMap.clear();
        if(result){
        	dataMap.put("data", true);
		}else{
			dataMap.put("data", false);
		}
        return SUCCESS;
	}
	
	public String addPoint(){
		userService.addPoint(openId, point);
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}


	public Map<String, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
}
