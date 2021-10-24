package com.ass.java5.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	
	private Integer id;
	
	@NotNull
	@NotBlank
	private String username;
	
	@NotNull
	@NotBlank
	private String password;
	
	@Email
	@NotNull
	@NotBlank
	private String email;
	
	private String photo;
	
	@NotNull
	private Integer activated;
	
	@NotNull
	private Integer admin;
}
