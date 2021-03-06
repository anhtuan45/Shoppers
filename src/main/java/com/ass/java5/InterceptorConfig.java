package com.ass.java5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ass.java5.interceptor.AuthenticateInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	private AuthenticateInterceptor authenInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//addPathPatterns("/**") : muốn intercepter hoạt động trên đường dẫn nào
		registry.addInterceptor(authenInterceptor)
			.addPathPatterns("/admin/**","/users/**")
			.excludePathPatterns("/login","/users/home","/pageError");
	}
	
}
