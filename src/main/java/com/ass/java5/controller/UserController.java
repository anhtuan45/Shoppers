package com.ass.java5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ass.java5.dto.UserDTO;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.UserMapper;
import com.ass.java5.repository.UserRepository;
import com.ass.java5.utils.HashUtil;

@Controller
@RequestMapping(value = "/admin/users")
public class UserController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserMapper mapper;
	
	@GetMapping()
	public String index(Model model) {
		
//		List<User> entity = this.userRepository.findAll();
		//model.addAttribute("listUser", entity);
		
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = (sortDirection == null || sortDirection.equals("asc")) ? Sort.by(Direction.ASC, sortField)
				: Sort.by(Direction.DESC, sortField);
		//asc tang
		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 5 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		

		Page<User> pageData = this.userRepository.findByActivated(pageable);
		model.addAttribute("pageData", pageData);
		String sortPage = sortDirection == null ? "asc" : sortDirection;
		model.addAttribute("sort",sortPage);
		return "admin/users/index";
	}
	
	@GetMapping("/create")
	public String create(Model model , @ModelAttribute("user") UserDTO userDTO) {
//		model.addAttribute("user", new UserDTO()); 
//		model.addAttribute("user", userDTO); = @ModelAttribute("user") UserDTO userDTO
		return "admin/users/create";
	}
	
	@PostMapping("/store")
	public String store(Model model, @Valid @ModelAttribute("user") UserDTO userDTO, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Có lỗi");
			model.addAttribute("errors", result.getAllErrors());
//			model.addAttribute("user", userDTO); @ModelAttribute("user") UserDTO userDTO
			return "admin/users/create";
			
		}else {
			User entity = this.mapper.convertToEntity(userDTO);
			String hashPassword = HashUtil.hash(entity.getPassword());
			entity.setPassword(hashPassword);
			this.userRepository.save(entity);
			return "redirect:/admin/users";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") User entity , Model model) {
		UserDTO user = this.mapper.convertToDTO(entity);
		model.addAttribute("user", user);
		return "admin/users/edit";
	}
	
	@PostMapping("/update/{id}")
	public String update(Model model, @Valid @ModelAttribute("user") UserDTO user, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Có lỗi");
			model.addAttribute("errors", result.getAllErrors());
//			model.addAttribute("user", user);
			return "admin/users/edit";
		}else {
			User entity = this.mapper.convertToEntity(user);
			this.userRepository.save(entity);
			return "redirect:/admin/users";
		}
	}
	
	//Delete user
	@PostMapping("/delete/{id}")
	public String detete(@PathVariable("id") Integer id) {
//		User entity = userRepository.getOne(id);
//		entity.setActivated(0);
//		this.userRepository.save(entity);
		this.userRepository.deleteById(id);
		return "redirect:/admin/users";
	}
	
	@GetMapping("/changePW")
	public String getchangePassword(Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("userCpw", user);
		
		return "admin/common/changePW";
	}
	
	@PostMapping("/changePW")
	public String changePW(
			@RequestParam("email") String email, 
			@RequestParam("password") String password,
			@RequestParam("newpassword") String newpassword,
			@RequestParam("CPpassword") String CPpassword
			) {
			User entity = userRepository.findByEmail(email);
			
			HttpSession session = request.getSession();
			
			if(entity == null) {
				session.setAttribute("error", "Email or Password errors !!!");
				return "redirect:/admin/users/changePW";
			}
			
			boolean checkPwd = HashUtil.verify(password, entity.getPassword());
			if (!checkPwd) {
				session.setAttribute("error", "Email or Password errors !!!");
				return "redirect:/admin/users/changePW";
			}

			String hashedPassword = HashUtil.hash(CPpassword);
			
			entity.setPassword(hashedPassword);
			
			this.userRepository.save(entity);
			
		return "redirect:/admin/users";
	}
	
}
