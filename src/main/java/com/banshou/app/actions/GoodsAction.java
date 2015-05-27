package com.banshou.app.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.banshou.app.domain.Goods;
import com.banshou.app.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

@Component("GoodsAction")
public class GoodsAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(GoodsAction.class);
	private Map<String, Object> dataMap = null;

	private String number;
	private String storeNumber;

	@Autowired
	GoodsService goodsService;

	public String getAllByStoreNumber() {
		LOGGER.info("[cbsadmin] [GoodAction] {getAll method} begin to get the goods from DB with the store number: " + storeNumber);
		dataMap = new HashMap<String, Object>();
		List<Goods> goods = null;
		try{
			goods = goodsService.getAllByStoreNumber(storeNumber);
			LOGGER.info("[cbsadmin] [GoodAction] {getAllByStoreNumber method} the count of the goods items is: " + goods.size());
		} catch(Exception e){
			e.printStackTrace();
		}
		dataMap.put("data", goods);
		return SUCCESS;
	}

	public String deleteGoodsByNumber() {
		LOGGER.info("[cbsadmin] [GoodAction] {delete method} the number of the item will be deleted is : " + number);
		dataMap = new HashMap<String, Object>();
		try {
			goodsService.deleteById(number);
			dataMap.put("data", "success");
		} catch (Exception e){
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		
		LOGGER.info("[cbsadmin] [GoodAction] {delete method} delete item: " + number + " successfully");

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
