package com.cms.CollegeManagementSystem.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.cms.CollegeManagementSystem.entities.User;

public class UserRowMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		User user=new User();
		user.setUserid(rs.getInt(1));
		user.setUsername(rs.getString(2));
		user.setPassword(rs.getString(3));
		user.setEmailid(rs.getString(4));
		user.setAddress(rs.getString(5));
		user.setContact_num(rs.getString(6));
		user.setAdmin(rs.getString(7));
		return user;
	}
	
	

}
