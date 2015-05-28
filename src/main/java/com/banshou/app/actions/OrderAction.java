package com.banshou.app.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.banshou.app.domain.Order;
import com.banshou.app.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

@Component("OrderAction")
public class OrderAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(OrderAction.class);
	private Map<String, Object> dataMap = null;
	private String number;
	private String storeNumber;


	@Autowired
	OrderService orderService;


	public String getToday() {
		LOGGER.info("[cbsadmin] [OrderAction] {getToday method} begin to get the orders from DB ...");
		dataMap = new HashMap<String, Object>();
		List<Order> orders = orderService.getToday();
		dataMap.put("data", orders);
		return SUCCESS;
	}
	
	public String getAllOrderByNumber() {
		LOGGER.info("[cbsadmin] [OrderAction] {getAll method} begin to get the all orders from DB with the store number: " + storeNumber);
		dataMap = new HashMap<String, Object>();
		List<Order> orders = null;
		try{
			orders = orderService.getAllByStoreNumber(storeNumber);
		} catch(Exception e){
			e.printStackTrace();
		}
		dataMap.put("data", orders);
		return SUCCESS;
	}
	
	public String deleteByNumber(){
		LOGGER.info("[cbsadmin] [OrderAction] {delete method} the number of the item will be deleted is : " + number);
		dataMap = new HashMap<String, Object>();
		try{
			orderService.deleteByNumber(number);
			dataMap.put("data", "success");
		} catch(Exception e){
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		LOGGER.info("[cbsadmin] [OrderAction] {delete method} delete item: " + number + " successfully");
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

	public String getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(String storeNumber) {
		this.storeNumber = storeNumber;
	}
	
}
