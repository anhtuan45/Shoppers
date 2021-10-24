package com.ass.java5.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import com.ass.java5.entity.Order;
import com.ass.java5.repository.OrderRepository;
import com.ass.java5.repository.ProductRepository;

@Controller
@RequestMapping("/admin/users")
public class ProductInvoiceAdmin {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@GetMapping("/productInvoice")
	public String index(Model model) {
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");
		
		String sortField = sortBy == null ? "id" : sortBy ;
		
		Sort sort = (sortDirection == null || sortDirection.equals("asc") ? 
				Sort.by(Direction.ASC, sortField) : 
				Sort.by(Direction.DESC , sortField));
		
		int page = pageParam == null ? 0 : Integer.parseInt(pageParam)  ;
		int limit = limitParam == null ? 3 : Integer.parseInt(limitParam);
		
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page pageData = this.orderRepository.findAll(pageable);
		
		model.addAttribute("pageData", pageData);
		
		String sortPage = sortDirection == null ? "asc" : sortDirection;
		model.addAttribute("sort",sortPage);
		
		return "admin/order/productInvoiceAdmin";
	}
	
	//view productInvoice
	@PostMapping("/productInvoice/{id}")
	public String update(Model model, @PathVariable("id") Integer id) {
		
		Order order = this.orderRepository.getOne(id);
		String value = request.getParameter("activate");
		order.setActivate(Integer.parseInt(value));
		this.orderRepository.save(order);
		
		return "redirect:/admin/users/productInvoice";
	}
	
}
