package com.ass.java5.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ass.java5.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	
	@Query("SELECT entity FROM Category entity WHERE activate = 1")
	List<Category> findByCategoryActivate();
	
	@Query("SELECT entity FROM Category entity WHERE activate = 0")
	List<Category> findByCategoryInActive();
	
	@Query("select entity from Category entity where activate = 1")
	Page<Category> findByActivated1(Pageable pageable);
}
