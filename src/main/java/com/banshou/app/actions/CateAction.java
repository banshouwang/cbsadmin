package com.banshou.app.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.banshou.app.domain.Category;
import com.banshou.app.service.CateService;
import com.banshou.app.utils.common.CodeGenerator;
import com.opensymphony.xwork2.ActionSupport;

@Component("CateAction")
public class CateAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(CateAction.class);
	private Map<String, Object> dataMap = null;
	private String name;
	private String number;
	
	@Autowired
	CateService cateService;
	
	public String add(){
		LOGGER.info("[CateAction] {add method} begin to add the category to the DB ...");
		LOGGER.info("[CateAction] category name is " + name);
		
		Category category = new Category();
		
		String num = "FL" + CodeGenerator.generateTimeStampString();
		
		category.setName(name);
		category.setIs_valid(1);
		category.setTime(new Date());
		category.setNum(num);
		cateService.addCate(category);
		
		LOGGER.info("[CateAction] add category gonna to end...");
		
		return SUCCESS;
	}
	
	public String getAll(){
		dataMap = new HashMap<String, Object>();
		List<Category> cates = cateService.getAll();
		
		dataMap.put("data", cates);
		return SUCCESS;
	}
	
	public String deleteByNumber(){
		dataMap = new HashMap<String, Object>();
		try{
			cateService.deleteByNumber(number);
			dataMap.put("data", "success");
			
		} catch (Exception e){
			e.printStackTrace();
			dataMap.put("data", "error");
		}
		return SUCCESS;
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
