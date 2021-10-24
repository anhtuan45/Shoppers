package com.ass.java5.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ass.java5.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	
	@Query("SELECT entity FROM Order entity WHERE user.id =:user_id")
	Page<Order> findByUser_id(@Param("user_id") Integer user_id, Pageable pageable);
	
	@Query("SELECT entity FROM Order entity WHERE user.username =:username")
	Page<Order> findByUsername(@Param("username") String username, Pageable pageable);
}
