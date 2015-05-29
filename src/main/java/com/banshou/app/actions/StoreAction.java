package com.banshou.app.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.banshou.app.domain.Store;
import com.banshou.app.service.StoreService;
import com.opensymphony.xwork2.ActionSupport;

@Component("StoreAction")
public class StoreAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(StoreAction.class);

	private Map<String, Object> dataMap = null;
	private String storeName;
	private String brief;
	private String address;
	private String tel;
	private String names;
	private String storeNum;
	private String longitude;
	private String latitude;

	@Autowired
	StoreService storeService;

	public String update() {
		LOGGER.info("[cbsadmin] [StoreAction] {update method} begin to update the store details ...");
		dataMap = new HashMap<String, Object>();
		String[] images = names.split(",");
		String icon = images[0];
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < images.length; i++) {
			sb.append(images[i]).append(",");
		}
		String image = sb.toString();

		Store store = new Store();
		store.setNumber(storeNum);
		store.setName(storeName);
		store.setBrief(brief);
		store.setAddress(address);
		store.setTel(tel);
		store.setIcon(icon);
		store.setImage(image.substring(0, image.length() - 1));
		store.setIsvalid(true);
		store.setIsvip(false);
		store.setLongitude(longitude);
		store.setLatitude(latitude);
		store.setPoint(0);

		try{
			storeService.updateStoreByNum(store);
			dataMap.put("data", "success");
		} catch(Exception e){
			e.printStackTrace();
			dataMap.put("data", "fail");
		}
		
		names = "";
		return SUCCESS;
	}

	public String getAll() {
		LOGGER.info("[cbsadmin] [StoreAction] {getAll method} begin to get all the stores");
		dataMap = new HashMap<String, Object>();
		List<Store> s = null;
		try {
			s = storeService.getAll();
		} catch (Exception e) {
			e.printStackTrace();
		}

		dataMap.put("data", s);
		return SUCCESS;
	}

	public String deleteStoreByNumber() {
		LOGGER.info("[cbsadmin] [StoreAction] {deleteStoreByNumber method} the number of the item will be deleted is : " + storeNum);
		dataMap = new HashMap<String, Object>();
		try {
			storeService.deleteByNumber(storeNum);
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}

		LOGGER.info("[cbsadmin] [StoreAction] {deleteStoreByNumber method} delete item: " + storeNum + " successfully");

		return SUCCESS;
	}

	public String downStore() {
		LOGGER.info("[cbsadmin] [StoreAction] {downStore method} the number of the item will be down is : " + storeNum);
		dataMap = new HashMap<String, Object>();
		try {
			storeService.downStore(storeNum);
			dataMap.put("data", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("data", "error");
		}

		return SUCCESS;
	}

	public String upStore() {
		LOGGER.info("[cbsadmin] [StoreAction] {upGoods method} the number of the item will be up is : " + storeNum);
		dataMap = new HashMap<String, Object>();
		try {
			storeService.upStore(storeNum);
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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
}
