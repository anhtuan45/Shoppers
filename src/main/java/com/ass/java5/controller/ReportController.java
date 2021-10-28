package com.ass.java5.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ass.java5.entity.ProductReport;
import com.ass.java5.entity.Report;
import com.ass.java5.repository.Order_DetailsRepository;

@Controller
@RequestMapping("/admin/report")
public class ReportController {
	
	@Autowired
	private Order_DetailsRepository daoOrderDetail;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping()
	public String categoryReport(Model model) {
		
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");
		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 5 : Integer.parseInt(limitParam);
		
		Pageable pageable = PageRequest.of(page, limit);
		
		Page<Report> pageData =  this.daoOrderDetail.revenueByCategory(pageable);
		Page<ProductReport> pagedata2 = this.daoOrderDetail.getProductReport(pageable);
		
		model.addAttribute("pageData", pageData);
		model.addAttribute("pageData2", pagedata2);
		
		return "admin/order/report";
	}
}
