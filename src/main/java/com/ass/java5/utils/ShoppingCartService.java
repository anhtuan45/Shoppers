package com.ass.java5.utils;

import java.util.Collection;

import com.ass.java5.dto.ItemDTO;

public interface ShoppingCartService {
	ItemDTO add(Integer id);
	
	void remove(Integer id);
	
	ItemDTO update(Integer id , int quantity);
	
	void clear();
	
	// Lấy tất cả các mặt hàng trong giỏ
	Collection<ItemDTO> getItems();
	
	 //Lấy tổng số lượng các mặt hàng trong giỏ
	int getCount();
	
	 //Lấy tổng số tiền tất cả các mặt hàng trong giỏ
	double getAmount();
	
}
