package com.ass.java5.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ass.java5.dto.ItemDTO;
import com.ass.java5.dto.OrderDTO;
import com.ass.java5.entity.Order;
import com.ass.java5.entity.Order_Details;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.OrderMapper;
import com.ass.java5.repository.OrderRepository;
import com.ass.java5.repository.Order_DetailsRepository;
import com.ass.java5.repository.ProductRepository;
import com.ass.java5.utils.MailerService;
import com.ass.java5.utils.ShoppingCartService;


@Controller
@RequestMapping(value = "users/home/cart")
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService cart;
	
	@Autowired
	private OrderMapper mapper;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private Order_DetailsRepository order_DetailsRepository;
	
	@Autowired
	MailerService mailService;
	
	@GetMapping("/checkout")
	public String checkout(Model model , OrderDTO orderDTO) {
		model.addAttribute("order", orderDTO);
		model.addAttribute("cart", cart);
		return "users/page/checkout";
	}
	
	@GetMapping("/view")
	public String view(Model model,OrderDTO orderDTO) {
		if(cart.getCount() == 0) {
			model.addAttribute("message", "You have not added any products to your cart !");
			
		}else {
			model.addAttribute("message", "");
		}
		
		HttpSession session = request.getSession();
		
		model.addAttribute("order", orderDTO);
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("cart", cart);
		
		return "users/page/shoppingCart";
	}
	
	@GetMapping("/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/users/home";
	}
	
	@GetMapping("/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		
		return "redirect:/users/home/cart/view";
	}
	
	@PostMapping("/update/{id}")
	public String updatr(@PathVariable("id") Integer id ,@RequestParam("quantity") Integer quantity) {
		cart.update(id, quantity);
		return "redirect:/users/home/cart/view";
	}
	
	@RequestMapping("/users/home/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/users/home/cart/view";
	}
	
	String donHang = "";
	double tongGia = 0;
	
	@GetMapping("/submitOrder")
	@ResponseBody
	public String submitOrder() {
		
		return "Your order is successful, we will send order information to your email !! ";
	}
	
	
	@PostMapping("/order")
	public String order(Model model,@RequestParam("c_email_address") String email , @Valid @ModelAttribute("order") OrderDTO orderDTO,BindingResult result ) throws MessagingException {
		if(result.hasErrors()) {
			System.out.println("Error !!");
			model.addAttribute("errors", result.getAllErrors());
			model.addAttribute("cart", cart);
			return "user/page/shoppingCart";
		}else {
			//Save order
			Order order = mapper.convertToEntity(orderDTO);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			order.setActivate(1);
			order.setUser(user);
			order.setCreateDate(java.time.LocalDate.now()+"");
			order.setPhone(orderDTO.getPhone());
			this.orderRepository.save(order);
			
			//Order_Details
			for(ItemDTO item : cart.getItems()) {
				//duyet qua gio hang va sace vao order_details
				Order_Details order_Details = new Order_Details();
				order_Details.setOrder(order);
				productRepository.findById(item.getId()).ifPresent(
						product -> {order_Details.setProduct(product);
				});
				order_Details.setPrice(item.getPrice());
				order_Details.setQuantity(item.getQuantity());
				this.order_DetailsRepository.save(order_Details);
				
				donHang += "*** Code Bill : "+order_Details.getId()+"\n"+" - Product's name : "+productRepository.findById(item.getId()).get().getName()+"\n"
						+ " - Quantity : "+item.getQuantity()+"\n"+" - Price : "+item.getPrice()+"$"+"\n";
				tongGia += item.getPrice();
			}
			
			donHang += " ==> Total amount : "+tongGia+"$";
			mailService.sendEmail(email,"Your order Information",donHang);
			
		}
		cart.clear();
		return "users/page/thankyou";
	}
	
	
	
	
	
}
