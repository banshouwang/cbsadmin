package com.banshou.app.service;

import java.util.List;

import com.banshou.app.domain.Goods;

public interface GoodsService {
	public List<Goods> getAllByStoreNumber(String storeNumber);
	public void deleteById(String id);
}	
