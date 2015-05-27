package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.Goods;

public interface GoodsDao {
	public List<Goods> getAllByStoreNumber(String storeNumber);
	public void deleteById(String id);
}
