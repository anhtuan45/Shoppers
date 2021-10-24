package com.ass.java5.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ass.java5.dto.ProductDTO;
import com.ass.java5.entity.Category;
import com.ass.java5.entity.Product;
import com.ass.java5.mappers.ProductMapper;
import com.ass.java5.repository.CategoryRepository;
import com.ass.java5.repository.ProductRepository;

@Controller
@RequestMapping(value = "/admin/products")
public class ProductController {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ProductMapper mapper;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ServletContext app;

	@GetMapping()
	public String index(Model model) {
		List<Category> category = categoryRepository.findByCategoryActivate();
		model.addAttribute("categoryData", category);

		String keyword = request.getParameter("keyword");
		String categoryId = request.getParameter("categories");
		String categoryField = categoryId == null ? "" : categoryId;;

		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 5 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit);

		Page<Product> product;
		
		if(keyword != null) {
			product = productRepository.search1(keyword,pageable);
		}else if(categoryField == null || categoryField == "" || keyword == "") {
			product = productRepository.findByProductActivate1(pageable);
		}else {
			product = productRepository.findByCategory_id1(Integer.parseInt(categoryField),pageable);
		}

		//model.addAttribute("tesst", product);
		model.addAttribute("pageData", product);
		return "admin/product/index";
	}

	@GetMapping("/create")
	public String create(@ModelAttribute("product") ProductDTO productDTO, Model model) {
		// list danh muc
		List<Category> cate = this.categoryRepository.findByCategoryActivate();
		model.addAttribute("categoryData", cate);

		model.addAttribute("date", java.time.LocalDate.now() + "");
		return "admin/product/create";
	}

	@PostMapping("/store")
	public String store(Model model, @Valid @ModelAttribute("product") ProductDTO productDTO, BindingResult result) {
		// list danh muc
		List<Category> cate = this.categoryRepository.findByCategoryActivate();
		model.addAttribute("categoryData", cate);

		if (result.hasErrors()) {
			System.out.println("Error !!");
			model.addAttribute("errors", result.getAllErrors());
			return "admin/product/create";

		} else {
			Product entity = mapper.convertToEntity(productDTO);
			
			//Upload file
			String images = productDTO.getImage().getOriginalFilename();
			
			//check if the path(/images) already exists
			File dir = new File(app.getRealPath("/images"));
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			try {
				File saveFile = new File(dir , images);
				productDTO.getImage().transferTo(saveFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			entity.setImage(images);
			this.productRepository.save(entity);
			return "redirect:/admin/products";
		}

	}

	@GetMapping("/edit/{id}")
	public String edit(Model model, @PathVariable("id") Product entity) {
		// list danh muc
		List<Category> cate = this.categoryRepository.findByCategoryActivate();
		model.addAttribute("categoryData", cate);

		ProductDTO product = this.mapper.convertToDTO(entity);
		model.addAttribute("product", product);

		return "admin/product/edit";
	}

	@PostMapping("/update/{id}")
	public String update(Model model, @Valid @ModelAttribute("product") ProductDTO product, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("Có lỗi" + result.getAllErrors());
			model.addAttribute("errors", result.getAllErrors());
			model.addAttribute("product", product);
			return "admin/product/edit";
		} else {
			Product entity = this.mapper.convertToEntity(product);
			
			//Upload file
			String images = product.getImage().getOriginalFilename();
			File dir = new File(app.getRealPath("/images"));
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			try {
				File saveFile = new File(dir , images);
				product.getImage().transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			entity.setImage(images);
			
			this.productRepository.save(entity);

			return "redirect:/admin/products";
		}
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.productRepository.deleteById(id);
		return "redirect:/admin/products";
	}

	 
}
