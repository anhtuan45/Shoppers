package com.ass.java5.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ass.java5.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Query("select entity from Product entity where activate = 1")
	List<Product> findByProductActivate();
	
	@Query("select entity from Product entity where category.id=:category_id and activate = 1")
	List<Product> findByCategory_id(@Param("category_id") Integer category_id);
	
	@Query("select entity from Product entity where activate = 0")
	public List<Product> findByProductInActive();
	
	@Query("SELECT p FROM Product p WHERE CONCAT(p.name, ' ', p.price) LIKE %?1% and activate = 1")
	public List<Product> search(String keyword);
	
	@Query("SELECT p FROM Product p WHERE CONCAT(p.name, ' ', p.price) LIKE %?1% and activate = 1")
	public Page<Product> search1(String keyword,Pageable pageable);
	
	@Query("select entity from Product entity where activate = 1")
	Page<Product> findByProductActivate1(Pageable pageable);
	
	@Query("select entity from Product entity where category.id=:category_id and activate = 1")
	Page<Product> findByCategory_id1(@Param("category_id") Integer category_id,Pageable pageable);
}
