package com.ass.java5.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.ass.java5.dto.ItemDTO;
import com.ass.java5.entity.Product;
import com.ass.java5.mappers.ItemMapper;
import com.ass.java5.repository.ProductRepository;
@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	private ItemMapper mapper;
	
	@Autowired
	private ProductRepository productRepository;
	
	Map<Integer, ItemDTO> map = new HashMap<>();

	@Override
	public ItemDTO add(Integer id) {
		ItemDTO item = map.get(id);
		
		if(item == null) {
			Product product = productRepository.getOne(id);
			item = mapper.convertToDTO(product);
			item.setQuantity(1);
			map.put(id, item);
		}else {
			item.setQuantity(item.getQuantity()+1);
		}
		
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public ItemDTO update(Integer id, int quantity) {
		Product product = this.productRepository.getOne(id);
		
		if(product.getAvailable() < quantity) {
			
		}
		ItemDTO item = map.get(id);
		
		item.setQuantity(quantity);
		
		if (item.getQuantity() <= 0) {
			map.remove(id);
		}
		
		return item;

	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<ItemDTO> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		
		return map.values().stream().mapToInt(item -> item.getQuantity()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
	}

}
