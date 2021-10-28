package com.ass.java5.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ProductReport implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private Product product;
	
	private Category category;
	
	private Long total;
	
	private Long count;
	
}
