package com.cms.CollegeManagementSystem.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.CollegeManagementSystem.dao.UserDao;
import com.cms.CollegeManagementSystem.entities.AnnouncementDetails;
import com.cms.CollegeManagementSystem.entities.User;
import com.cms.CollegeManagementSystem.exceptions.InvalidUsernameAndPassword;
import com.cms.CollegeManagementSystem.exceptions.ResourceNotFoundException;

@Service
public class UserServices {
	@Autowired
	private UserDao userdao;

	
	public boolean registerUser(User user) {
		return userdao.registerUser(user);
	}
	
	public boolean addAdmin(User user) {
		return userdao.addAdmin(user);
	}
	//for checking if userexists or not
	public User findUserByName(String username) {
		User user=userdao.findUserByName(username);
		if(user==null) {
			throw new ResourceNotFoundException("User does not Exists");
		}
		else {
			return user;
		}
	}
	
	//for checking username and password
	
	public User ValidateUser(String username,String password) {
		User user=userdao.findUserByName(username);
		if(!(user.getPassword().equals(password))) {
			throw new InvalidUsernameAndPassword("Username and Password Not Matching");
		}
		else {
			return user;
		}
		
	}
	
	public User ValidateUserforadmin(String username,String emailid) {
		return userdao.findUserByName_emailid(username,emailid);
		
	}
	

	
	
	//for getting users by userid
	public User findUserById(int userid) {
		return userdao.findUserById(userid);
	}
	
	//for viewing public Announcements
		public List<AnnouncementDetails> getAnnouncementdetails(){
			return userdao.ViewAnnouncements();
		}
		
		//for updating password of users
		public boolean UpdatePassword(int userid,String password) {
			return userdao.UpdateUserPassword(userid, password);
		}

		public boolean addannouncements( AnnouncementDetails announcement,String filename) {
			return userdao.addAnnouncement(announcement,filename);
			
		}

		//for viewing all the users
	public List<User> getAllUsers(){
		return userdao.ViewUsers();
	}
		
}
