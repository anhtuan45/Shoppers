package com.ass.java5.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDTO {
	
	private Integer id;
	
	@NotNull
	@NotBlank
	private String name;
	
	@NotNull
	@NotBlank
	private String image;
	
	@NotNull
	private Integer price;
	
	@NotNull
	private Integer quantity;
}
