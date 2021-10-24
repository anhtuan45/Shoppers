package com.ass.java5.controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ass.java5.dto.UserDTO;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.UserMapper;
import com.ass.java5.repository.UserRepository;
import com.ass.java5.utils.HashUtil;
import com.ass.java5.utils.MailerService;

@Controller
public class NewAccController {
	
	User user = new User();
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	MailerService mailService;
	
	@Autowired
	private UserRepository repository;
	
	@GetMapping("/createNew")
	public String create(Model model , UserDTO userDTO) {
		model.addAttribute("user", userDTO);
		return "auth/createNewAcc";
	}
	
	int check = 0;
	
	@GetMapping("/emailCheck")
	public String emailChek(User user) throws MessagingException {
		Random rand = new Random();
		check = rand.nextInt(1000);
		mailService.sendEmail(user.getEmail(),"Xác nhận tài khoản","Mã của bạn là: "+check);
		return "signUp/emailCheck";
	}
	
	@PostMapping("/createNewAcc")
	public String createAcc(Model model,@Valid @ModelAttribute("user") UserDTO userDTO , BindingResult result) {
		if(result == null) {
			System.out.println("Có lỗi" + result.getAllErrors());
			model.addAttribute("errors", result.getAllErrors());
			return "/auth/createnewAcc";
		}else {
			User entity = mapper.convertToEntity(userDTO);
			
			String hashedPass = HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPass);
			
			this.repository.save(entity);
			
			return "redirect:/login";
		}
	}
	
//	@PostMapping("/createNewAcc")
//	public String createAcc(Model model,@RequestParam Integer emailCheck ,@Valid @ModelAttribute("user") UserDTO userDTO , BindingResult result) {
//		if(result == null) {
//			System.out.println("Có lỗi" + result.getAllErrors());
//			model.addAttribute("errors", result.getAllErrors());
//			return "/auth/createnewAcc";
//		}else {
//			if(check == emailCheck) {
//				System.out.println("Thành công");
//				User entity = mapper.convertToEntity(userDTO);
//				
//				String hashedPass = HashUtil.hash(entity.getPassword());
//				entity.setPassword(hashedPass);
//				
//				this.repository.save(entity);
//				return "redirect:/emailCheck";
//			}else {
//				System.out.println("Thất bại");
//				return "auth/emailCheck";
//			}
//			
//			
//		}
//	}
//	
//	@PostMapping("/signUp")
//	public String sigup(
//			@RequestParam String username,
//			@RequestParam String password,
//			@RequestParam String email) {
//		user.setUsername(username);
//		user.setPassword(password);
//		user.setActivated(1);
//		user.setPhoto(null);
//		user.setEmail(email);
//		user.setAdmin(0);
//		return "redirect:/emailChek";
//	}
	
}
