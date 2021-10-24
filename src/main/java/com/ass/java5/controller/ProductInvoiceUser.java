package com.ass.java5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ass.java5.entity.Order;
import com.ass.java5.entity.Order_Details;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.OrderMapper;
import com.ass.java5.repository.OrderRepository;
import com.ass.java5.repository.Order_DetailsRepository;
import com.ass.java5.repository.ProductRepository;

@Controller
@RequestMapping(value = "/users/home")
public class ProductInvoiceUser {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private Order_DetailsRepository order_DetailsRepository;
	
	@GetMapping("/productInvoice")
	public String index(Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = (sortDirection == null || sortDirection.equals("asc")) ? Sort.by(Direction.ASC, sortField)
				: Sort.by(Direction.DESC, sortField);

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 3 : Integer.parseInt(limitParam);
		
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		//chua dang nhap sao co id ??
		Page<Order> pageData =  this.orderRepository.findByUsername(user.getUsername(),pageable);

		model.addAttribute("pageData", pageData);
		
		String sortPage = sortDirection==null?"asc":sortDirection;
		model.addAttribute("sort",sortPage);
		return "users/page/productInvoice";
	}
	
	@GetMapping("/productInvoice/{id}")
	public String view(Model model,@PathVariable("id") Integer id) {
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 10 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit);
		
		Page<Order_Details> pageData =  this.order_DetailsRepository.findByOrder_id(id, pageable);
		
		model.addAttribute("pageData", pageData);
		model.addAttribute("id",id);
		
		return "users/page/productInvoiceView";
	}
	
	
	@PostMapping("/productInvoiceView/delete/{id}")
	public String deleted(Model model,@PathVariable("id") Integer id) {
		List<Order_Details> pageData =  this.order_DetailsRepository.findByOrder_id(id);
		model.addAttribute("orderdetails", pageData);
		model.addAttribute("id",id);
		this.order_DetailsRepository.deleteById(id);
		return "redirect:/users/home/productInvoice";
	}
	
	//delete productvoice (delete đơn hàng)
	@PostMapping("/productInvoice/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.orderRepository.deleteById(id);
		return "redirect:/users/home/productInvoice";
	}
}
