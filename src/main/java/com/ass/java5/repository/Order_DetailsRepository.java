package com.ass.java5.repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.ass.java5.entity.Order_Details;

public interface Order_DetailsRepository extends JpaRepository<Order_Details, Integer>{
	@Query("SELECT entity FROM Order_Details entity WHERE order.id=:order_id")
	public Page<Order_Details> findByOrder_id(@Param("order_id") Integer user_id, Pageable pageable);
	
	@Query("SELECT entity FROM Order_Details entity WHERE order.id=:order_id")
	public List<Order_Details> findByOrder_id(@Param("order_id") Integer user_id);
	
	
}
