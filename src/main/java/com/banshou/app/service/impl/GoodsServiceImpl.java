package com.banshou.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.banshou.app.dao.GoodsDao;
import com.banshou.app.domain.Goods;
import com.banshou.app.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;

	@Override
	@Transactional
	public void deleteById(String id) {
		goodsDao.deleteById(id);		
	}

	@Override
	
	public List<Goods> getAllByStoreNumber(String storeNumber) {
		return goodsDao.getAllByStoreNumber(storeNumber);
	}
}
