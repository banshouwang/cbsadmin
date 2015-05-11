package com.banshou.app.actions;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import com.banshou.app.domain.Goods;
import com.banshou.app.service.GoodsService;
import com.banshou.app.utils.common.RandomStrUtil;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(GoodsAction.class);

	private String gname;
	private String category;
	private String priceori;
	private String pricehere;
	private String is_ticket;
	private String ticket;
	private String store;
	
	public String add(){
		LOGGER.info("[GoodAction] {add method} begin to add the goods to the DB ...");
		LOGGER.info("[GoodAction] name is " + gname + ", category is " + category + ", is_ticket is " + is_ticket + ", ticket is " + ticket);
		
		Goods goods = new Goods();
		GoodsService goodsService = new GoodsService();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String regtime = sdf.format(new Date());
		String number = "SP" + regtime + RandomStrUtil.getNumStr(6);

		goods.setName(gname);
		goods.setCategory(category);
		goods.setNumber(number);
		goods.setPriceori(Integer.parseInt(priceori));
		goods.setPricehere(Integer.parseInt(pricehere));
		
		if("on".equals(is_ticket)){
			goods.setIs_ticket(1);
			goods.setTicket(Integer.parseInt(ticket));
		} else {
			goods.setIs_ticket(0);
			goods.setTicket(0);
		}
		
//		if("".equals(ticket)){
//			goods.setTicket(0);
//		} else {
//			goods.setTicket(Integer.parseInt(ticket));
//		}
		
		goods.setIs_valid(1);
		
		int result = goodsService.addGoods(goods);
		LOGGER.info("[GoodAction] DB result is: " + result);
		LOGGER.info("[GoodAction] add goods gonna to end...");
		
		if(result > 0){
			return SUCCESS;
		}
		return "ADDFAIL";
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPriceori() {
		return priceori;
	}

	public void setPriceori(String priceori) {
		this.priceori = priceori;
	}

	public String getPricehere() {
		return pricehere;
	}

	public void setPricehere(String pricehere) {
		this.pricehere = pricehere;
	}

	public String getIs_ticket() {
		return is_ticket;
	}

	public void setIs_ticket(String is_ticket) {
		this.is_ticket = is_ticket;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}
}
