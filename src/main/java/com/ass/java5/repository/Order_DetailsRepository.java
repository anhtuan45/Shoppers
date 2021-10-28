package com.ass.java5.repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.ass.java5.entity.Order_Details;
import com.ass.java5.entity.ProductReport;
import com.ass.java5.entity.Report;

public interface Order_DetailsRepository extends JpaRepository<Order_Details, Integer>{
	@Query("SELECT entity FROM Order_Details entity WHERE order.id=:order_id")
	public Page<Order_Details> findByOrder_id(@Param("order_id") Integer user_id, Pageable pageable);
	
	@Query("SELECT entity FROM Order_Details entity WHERE order.id=:order_id")
	public List<Order_Details> findByOrder_id(@Param("order_id") Integer user_id);
	
	@Query("SELECT new Report(d.product.category, SUM(d.price * d.quantity), SUM(d.quantity) AS s) "
		+ "FROM Order_Details d GROUP BY d.product.category ORDER BY (s) DESC")
	Page<Report> revenueByCategory(Pageable pageable);
	
	@Query("SELECT new ProductReport(od.product, od.product.category, SUM(od.price * od.quantity), SUM(od.quantity) AS s)  FROM Order_Details od GROUP BY od.product ORDER BY (s) DESC")
	public Page<ProductReport> getProductReport(Pageable pageable);
}
