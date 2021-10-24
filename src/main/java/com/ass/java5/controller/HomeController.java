package com.ass.java5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ass.java5.dto.ProductDTO;
import com.ass.java5.entity.Category;
import com.ass.java5.entity.Product;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.ProductMapper;
import com.ass.java5.repository.CategoryRepository;
import com.ass.java5.repository.ProductRepository;
import com.ass.java5.repository.UserRepository;
import com.ass.java5.utils.HashUtil;
import com.ass.java5.utils.ProductService;

@Controller
@RequestMapping(value = "/users/home")
public class HomeController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("/index")
	
	public String indexhome() {
		return "users/page/index";
	}
	
	@GetMapping("/about")
	
	public String about() {
		return "users/page/about";
	}
	
	@GetMapping("/shop-single")
	
	public String shopsingle() {
		return "users/page/shop-single";
	}
	
	@GetMapping("/contact")
	
	public String contact() {
		return "users/page/contact";
	}
	
	@GetMapping("/thankyou")
	public String thankyou() {
		return "users/page/thankyou";
	}
	
	
	@GetMapping()
	public String index(Model model) {
		
		List<Category> category = categoryRepository.findByCategoryActivate();
		model.addAttribute("categoryData", category);
		
		String keyword = request.getParameter("keyword");
		
		String categoryId = request.getParameter("categories");
		String categoryField = categoryId == null ? "" : categoryId;
		
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 12 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit);
		
		Page<Product> product;
		
		if(keyword != null) {
			product = productRepository.search1(keyword,pageable);
		}else if(categoryField == null || categoryField == "" || keyword == "") {
			product = productRepository.findByProductActivate1(pageable);
		}else {
			product = productRepository.findByCategory_id1(Integer.parseInt(categoryField),pageable);
		}
		if(product.getSize() == 0) {
			model.addAttribute("message", "Không có sản phẩm nào");
		}
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("products", product);
		
		return "users/page/home";
	}
	
	
	//Show product details
	@GetMapping("{id}")
	public String edit(Model model ,@PathVariable("id") Integer id) {
		//find id product
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "users/page/showProduct";
	}
	
	@GetMapping("/changePassword")
	public String changepass(Model model) {
		HttpSession session = request.getSession();
		User entity = (User) session.getAttribute("user");
		model.addAttribute("userCpw", entity);
		
		return "auth/changePW";
	}
	
	@PostMapping("/changePassword")
	public String changePassword(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("newpassword") String newpassword,
			@RequestParam("CPpassword") String CPpassword
			) {
		
		HttpSession session = request.getSession();
		
		User entity = userRepository.findByEmail(email);
		
		
		if(entity == null) {
			session.setAttribute("errors", "Email or password error !!!");
			return "redirect:/users/home/changePassword";
		}
		//Check pass da ma hoa
		boolean checkPw = HashUtil.verify(password, entity.getPassword());
		
		if(!checkPw) {
			session.setAttribute("errors", "Email or password error !!!");
			return "redirect:/users/home/changePassword";
		}
		//Ma hoa pass
		String hashpassword = HashUtil.hash(CPpassword);
		entity.setPassword(hashpassword);
		this.userRepository.save(entity);
		return "redirect:/users/home";
	}
	
}
