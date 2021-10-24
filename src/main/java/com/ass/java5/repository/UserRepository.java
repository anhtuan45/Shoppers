package com.ass.java5.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ass.java5.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	@Query("SELECT entity FROM User entity WHERE email=:email and activated = 1")
	User findByEmail(@Param("email") String email);
	
	@Query("select entity from User entity where activated = 1")
	public Page<User> findByActivated(Pageable pageable);
	
	@Query("select entity from User entity where activated = 0")
	public Page<User> findByInActive(Pageable pageable);
}
