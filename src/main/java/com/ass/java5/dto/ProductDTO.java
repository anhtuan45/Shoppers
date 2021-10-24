package com.ass.java5.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private Integer id;
	
	@NotNull
	@NotBlank
	private String name;
	
	@NotNull
	private MultipartFile  image;
	
	@NotNull
	@Positive
	private Integer price;
	
//	@NotNull
	@NotBlank
	private String createDate;
	
	@NotNull
	@Positive
	private Integer available;
	
	@NotNull
	private Integer categoryId;
	
	@NotNull
	private Integer activate;
}
