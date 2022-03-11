package com.cms.CollegeManagementSystem.dao;


import java.util.List;

import org.springframework.stereotype.Component;

import com.cms.CollegeManagementSystem.entities.AnnouncementDetails;
import com.cms.CollegeManagementSystem.entities.User;

@Component
public interface UserDao {
	
	public boolean registerUser(User user);//for registrating user
	public boolean addAdmin(User user);//for adding admin
	public User findUserByName(String username);//for checking if user exists or not and validating username and password
	public User findUserById(int userid);//get the users by userid
	public List<AnnouncementDetails> ViewAnnouncements();
	public boolean UpdateUserPassword(int userid,String password);//for updating password of users
	public User findUserByName_emailid(String username,String emailid);
	public boolean addAnnouncement(AnnouncementDetails announcement,String filename);
	public List<User> ViewUsers();

}
