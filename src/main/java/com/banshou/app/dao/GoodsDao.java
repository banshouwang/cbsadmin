package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.Goods;

public interface GoodsDao {
	public List<Goods> getAll();
	public void deleteById(String id);
}
