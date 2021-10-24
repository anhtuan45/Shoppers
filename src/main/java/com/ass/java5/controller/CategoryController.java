package com.ass.java5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import com.ass.java5.dto.CategoryDTO;
import com.ass.java5.entity.Category;
import com.ass.java5.entity.User;
import com.ass.java5.mappers.CategoryMapper;
import com.ass.java5.repository.CategoryRepository;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
@Controller
@RequestMapping(value = "/admin/categories")
public class CategoryController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryMapper mapper;
	
	
	@GetMapping()
	public String index(Model model) {
//		List<Category> categories = categoryRepository.findAll();
//		model.addAttribute("listCategory", categories);
		
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = (sortDirection == null || sortDirection.equals("asc")) ? Sort.by(Direction.ASC, sortField)
				: Sort.by(Direction.DESC, sortField);

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 5 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page<Category> pageData = this.categoryRepository.findByActivated1(pageable);
		
		model.addAttribute("pageData", pageData);
		String sortPage = sortDirection == null ? "asc" : sortDirection;
		model.addAttribute("sort",sortPage);
		return "admin/categories/index";
	}
	
	@GetMapping("/create")
	public String create(@ModelAttribute("category") CategoryDTO categoryDTO) {

		return "admin/categories/create";
	}
	
	@PostMapping("/store")
	public String store(Model model,@Valid @ModelAttribute("category") CategoryDTO categoryDTO , BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Errors : ");
			model.addAttribute("errors", result.getAllErrors());
			return "admin/categories/create";
		}else {
			Category category = mapper.convertToEntity(categoryDTO);
			this.categoryRepository.save(category);
			return "redirect:/admin/categories";
		}
		
		
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Category category , Model model) {
		CategoryDTO categoryDTO = mapper.convertToDTO(category);
		model.addAttribute("category",categoryDTO);
		return "admin/categories/edit";
	}
	
	@PostMapping("/update/{id}")
	public String update(Model model, @Valid  @ModelAttribute("category") CategoryDTO dto , BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Errors : ");
			model.addAttribute("errors", result.getAllErrors());
			//model.addAttribute("category", dto);
			return "admin/categories/edit";
		}else {
			Category category = mapper.convertToEntity(dto);
			this.categoryRepository.save(category);
			return "redirect:/admin/categories";
		}
		
	}
	
	@PostMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.categoryRepository.deleteById(id);
		return "redirect:/admin/categories";
	}
}
