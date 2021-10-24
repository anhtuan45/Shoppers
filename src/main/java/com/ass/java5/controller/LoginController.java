package com.ass.java5.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ass.java5.entity.User;
import com.ass.java5.repository.UserRepository;
import com.ass.java5.utils.HashUtil;

@Controller
public class LoginController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("/login")
	public String formLogin() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "auth/login";
	}
	
	@GetMapping("/pageError")
	public String getError() {
		return "auth/error";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email") String email , @RequestParam("password") String password) {
		User entity = userRepository.findByEmail(email);
		
		HttpSession session = request.getSession();
		
		if(entity == null) {
			session.setAttribute("error", "Email or Password enrror !!");
			return "redirect:/login";
		}
		
		boolean checkPw = HashUtil.verify(password,entity.getPassword());
		if(!checkPw) {
			session.setAttribute("error", "Email or Password enrror !!");
			return "redirect:/login";
		}
		
		session.setAttribute("user", entity);
		
		if(entity.getAdmin() == 0) {
			return "redirect:/users/home";
		}else {
			return "redirect:/admin/users";
		}
		
	}
}
