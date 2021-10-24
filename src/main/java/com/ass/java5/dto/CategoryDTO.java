package com.ass.java5.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
	private Integer id;
	
	@NotNull
	@NotBlank
	private String name;
	
	@NotNull
	private Integer activate;
}
