package com.cms.CollegeManagementSystem.controllers;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cms.CollegeManagementSystem.entities.AnnouncementDetails;
import com.cms.CollegeManagementSystem.entities.AnnouncementDetailsDTO;
import com.cms.CollegeManagementSystem.entities.User;
import com.cms.CollegeManagementSystem.services.UserServices;
import com.cms.CollegeManagementSystem.entities.UserDTO;




@Controller
public class HomeController {
	
	@Autowired
	private UserServices userservice;

//	//for user login
//	@GetMapping(value="/user")
//	public String userlogin() {
//		return "userLogin";
//	}
	
	//for homepage
		@GetMapping(value="/home")
		public String homePage() {
			return "index";
		}
		@GetMapping(value="/")
		public String homePage1() {
			return "index";
		}
		
		//for loginpage
		@GetMapping(value="/login")
		public String loginPage() {
			return "userLogin";
		}
		
		//for signuppage
		@GetMapping(value="/signup")
		public String signUp() {
			return "signup";
		}
		
		//for ChangePassword
				@GetMapping(value="/changePassword")
				public String ForgetPassword(Model model) {
					User user=new User();
					model.addAttribute("user", user);
					return "changePassword";
				}
				
				@PostMapping(value="/changepassword")
				public String changePassword(@Valid @ModelAttribute("user") User user,BindingResult br,Model model,HttpSession session) {
					if(br.hasErrors()) {
						
						return "changePassword";
					}
					else {
						if(user.getPassword().equals(user.getAddress())) {
							int userid=(int) session.getAttribute("userid");
							user.setUserid(userid);
							//resttemplate.postForObject("http://localhost:8088/changepassword",user , String.class);
							userservice.UpdatePassword(user.getUserid(), user.getPassword());
							
						}
						
					}
					return "userLogin";
				}
				
		
		//for announcmentPage
				@GetMapping(value="/announcements")
				public String announcmentPage(Model model) {
					AnnouncementDetailsDTO DTO=new AnnouncementDetailsDTO();
					DTO.setAnnouncementDetails(userservice.getAnnouncementdetails());
					model.addAttribute("publicAnnouncements", DTO.getannouncementdetails());
					return "announcement";
				}
				
//	   // To view announcements 
//		@GetMapping(value="/viewAnnouncement")
//		public String viewAnnouncements()
//		{
//			return "viewAnnouncement";
//		}
	//for posting username and password for user validation
		@PostMapping(value="/userlogin")
		public String userLogin(HttpServletRequest request,User user,Model model,HttpSession session) {
//			String username=request.getParameter("username");
			try {
				System.out.println(user);
//				User userObj=resttemplate.postForObject("http://localhost:8088/userlogin", user,User.class);
				User userObj = userservice.ValidateUser(user.getUsername(), user.getPassword());
				System.out.println(userObj);
				session= request.getSession();
//				session.setAttribute("username",username);
				session.setAttribute("username", userObj.getUsername());
				session.setAttribute("userid", userObj.getUserid());
				session.setAttribute("admin", userObj.getAdmin());
				session.setAttribute("emailid", userObj.getEmailid());
				System.out.println(userObj.getAdmin());
				//for viewing Announcement
				AnnouncementDetailsDTO DTO=new AnnouncementDetailsDTO();
				DTO.setAnnouncementDetails(userservice.getAnnouncementdetails());
				model.addAttribute("publicAnnouncements", DTO.getannouncementdetails());
				model.addAttribute("check", "1");
				return "announcement";
				
				
			}catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("message", "Username or Password is Incorrect");
				return "userLogin";
			}
			
		}
		//after registration user login
				@PostMapping(value="/userRegister")
				public String userRegister(@Valid @ModelAttribute("user") User user,BindingResult br) {
					
					if(br.hasErrors()) {
						return "signup";
					}
		
					userservice.registerUser(user);
					return "userLogin";
				}
				
//				//for viewing Announcement
//				@GetMapping(value="/announcements")
//				public String ViewAnnouncements(Model model) {
//					System.out.println("here");
//					AnnouncementDetailsDTO DTO=new AnnouncementDetailsDTO();
//					DTO.setAnnouncementDetails(userservice.getAnnouncementdetails());
//					model.addAttribute("publicAnnouncements", DTO.getannouncementdetails());
//					return "announcement";
//				}	
				
				//for logout
				@GetMapping("/userLogout")
				public String adminlogout(HttpServletRequest request,HttpServletResponse response)
				{
					HttpSession session=request.getSession();
					session.removeAttribute("username");
					session.invalidate();
					
					return "userLogin";
				}
				
				//for signuppage
				@GetMapping(value="/addannouncement")
				public String addAnnouncement() {
					return "addannouncement";
				}
				
				//for addAdmin
				@GetMapping(value="/addadmin")
				public String addAdmin() {
					return "addadmin";
				}
				
				@PostMapping(value="/addAdmin")
				public String AddAdmin(@Valid @ModelAttribute("user") User user,BindingResult br,Model model,HttpSession session) {
					System.out.println(user.getUsername());
					System.out.println(user.getEmailid());
					
					
					User userObj = userservice.ValidateUserforadmin(user.getUsername(), user.getEmailid());
					System.out.println(userObj);
					
					
					
					if(userObj!=null) {
						//System.out.println("In error");
						userservice.addAdmin(user);
						model.addAttribute("message", "Successfully Added Admin");
						return "addadmin";
					}
					else {
						model.addAttribute("message", "Username or Email is Incorrect");
					}
				
						
					return "addadmin";
				}
				
//				@PostMapping(value="/Addannouncement")
//				public String AddAnnouncement(@Valid @ModelAttribute("user") User user,BindingResult br,Model model,HttpSession session) {
//					System.out.println(user.getUsername());
//					System.out.println(user.getEmailid());
//					
//				
//						
//					return "addannouncement";
//				}
				
				@PostMapping(value="/Addannouncement")
				public ResponseEntity<?> handelfileupload(@RequestParam("file") MultipartFile file,@Valid @ModelAttribute("user") AnnouncementDetails announcement,BindingResult br,Model model,HttpSession session) {
					
					System.out.println(announcement.getAnnouncement_name());
					System.out.println(announcement.getAnnouncement_path());
					if(br.hasErrors()) {
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
					}
		
					 String filename=file.getOriginalFilename();
					userservice.addannouncements(announcement,filename);
					
				
				 try {
					file.transferTo(new File("C:\\Users\\chintu\\Desktop\\Chaitanya_Samal\\Miscellaneous\\College-Management-System\\Announcements\\"+filename));
				} catch (Exception e) {
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
				} 
				 return ResponseEntity.ok("File Uploaded successfully");
				}
				
				@GetMapping(value="/viewusers")
				public String viewUsers(Model model) {
					UserDTO userdto = new UserDTO();
					userdto.setUserList(userservice.getAllUsers());
					
					UserDTO userdetails=userdto;
					model.addAttribute("userdetails", userdetails.getUserList());
					return "viewusers";
				}
}
