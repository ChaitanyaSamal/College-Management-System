package com.cms.CollegeManagementSystem.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.cms.CollegeManagementSystem.controllers")
public class appconfig implements WebMvcConfigurer{
	@Override
	public void configureViewResolvers(final ViewResolverRegistry registry) {
	    registry.jsp("/resources/", ".jsp");
	} 
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/Announcements/**","/images/**","/style/**")
	          .addResourceLocations("file:///C:/Users/chintu/Desktop/Chaitanya_Samal/Miscellaneous/College-Management-System/Announcements/","/images/","/style/");
	    }
	 

}
