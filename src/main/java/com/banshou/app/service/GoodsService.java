package com.banshou.app.service;

import com.banshou.app.dao.GoodsDao;
import com.banshou.app.domain.Goods;

public class GoodsService {

	public int addGoods(Goods goods){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.add(goods);
	}
}	
