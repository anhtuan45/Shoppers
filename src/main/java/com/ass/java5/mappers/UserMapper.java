package com.ass.java5.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ass.java5.dto.UserDTO;
import com.ass.java5.entity.User;

@Service
public class UserMapper {
	
	@Autowired
	private ModelMapper mapper;
	
	public User convertToEntity(UserDTO userDTO) {
		User entity = mapper.map(userDTO, User.class);
		
		return entity;
	}
	
	public UserDTO convertToDTO(User entity) {
		UserDTO userDTO = mapper.map(entity, UserDTO.class);
		
		return userDTO;
	}
}
