package com.banshou.app.dao;

import java.util.List;

import com.banshou.app.domain.Store;

public interface StoreDao {
	public void addGoods(Store store);
	public List<Store> getAll();
	public Store getStoreByNum(String number);
	public void updateStoreByNum(Store store);
	public void deleteByNumber(String number);
	public void downStore(String number);
	public void upStore(String number);
}
