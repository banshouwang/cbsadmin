package com.banshou.app.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.banshou.app.domain.Request;
import com.banshou.app.service.RequestService;
import com.opensymphony.xwork2.ActionSupport;

@Component("RequestAction")
public class RequestAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(RequestAction.class);
	private Map<String, Object> dataMap = null;
	private String number;

	@Autowired
	RequestService requestService;

	public String getAll() {
		LOGGER.info("[cbsadmin] - [RequestAction] {getAll method} begin to query all requests from DB");
		dataMap = new HashMap<String, Object>();
		List<Request> requests = null;

		try {
			requests = requestService.getAll();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dataMap.put("data", requests);
		}

		return SUCCESS;
	}

	public String beginRequest() {
		LOGGER.info("[cbsadmin] - [RequestAction] {beginRequest method} begin to handle the request");
		dataMap = new HashMap<String, Object>();
		try {
			requestService.approveRequest(number, "begin");
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		return SUCCESS;
	}

	public String finishRequest() {
		LOGGER.info("[cbsadmin] - [RequestAction] {finishRequest method} begin to finish handling the request");
		dataMap = new HashMap<String, Object>();
		try {
			requestService.approveRequest(number, "finish");
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		return SUCCESS;
	}
	
	public String cancelRequest() {
		LOGGER.info("[cbsadmin] - [RequestAction] {cancelRequest method} begin to cancel the request");
		dataMap = new HashMap<String, Object>();
		try {
			requestService.approveRequest(number, "cancel");
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		return SUCCESS;
	}
	
	public String deleteRequest() {
		LOGGER.info("[cbsadmin] - [RequestAction] {deleteRequest method} begin to delete the request");
		dataMap = new HashMap<String, Object>();
		try {
			requestService.approveRequest(number, "delete");
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		return SUCCESS;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

}