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

	@Autowired
	GoodsService goodsService;

	public String getAll() {
		LOGGER.info("[GoodAction] {getAll method} begin to get the goods from DB ...");
		dataMap = new HashMap<String, Object>();
		List<Goods> goods = null;
		try{
			goods = goodsService.getAll();
			LOGGER.info("[GoodAction] {getAll method} the count of the goods items is: " + goods.size());
			dataMap.put("data", goods);
		} catch(Exception e){
			e.printStackTrace();
			dataMap.put("data", null);
		}
		return SUCCESS;
	}

	public String deleteByNumber() {
		LOGGER.info("[GoodAction] {delete method} the number of the item will be deleted is : " + number);
		dataMap = new HashMap<String, Object>();
		goodsService.deleteById(number);
		LOGGER.info("[GoodAction] {delete method} delete item: " + number + " successfully");
		dataMap.put("data", "success");
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
