package com.banshou.app.dao;

import com.banshou.app.domain.Goods;
import com.banshou.app.utils.common.Constants;
import com.banshou.app.utils.common.DBConn;

public class GoodsDao {
	
	
	public int add(Goods goods){
		DBConn conn = new DBConn();
		int flag = conn.execOther(Constants.ADDGOODSSQL, new Object[] { goods.getNumber(), goods.getName(), goods.getCategory(), goods.getIs_valid(), goods.getPriceori(), goods.getPricehere(), goods.getIs_ticket(), goods.getTicket() });
		return flag;
	}
}
