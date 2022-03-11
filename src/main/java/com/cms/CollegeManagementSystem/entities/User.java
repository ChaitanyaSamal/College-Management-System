package com.cms.CollegeManagementSystem.entities;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//import org.hibernate.validator.constraints.Range;

public class User {
	
	private int userid;
	@Pattern(regexp="^[a-zA-Z0-9]{6,20}$",message="Username should contain AlphaNumeric Characters and should Contain 6-20 characters")
	private String username;
	@Pattern(regexp = "^[(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\S+$)]{8,20}$",message="Password Should Contain atleast one Lower Case,Upper Case,Numbers,Special Characters and Should Conatin 8-20 characters")
	private String password;
	private String emailid;
	@NotBlank
	private String address;
	@Size(min=8,max=15,message="Contact Number should include 9-15 Digits")
	private String contact_num;
	private String assign;
	private String admin;
	
	public String getAssign() {
		return assign;
	}
	public void setAssign(String assign) {
		this.assign = assign;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact_num() {
		return contact_num;
	}
	public void setContact_num(String contact_num) {
		this.contact_num = contact_num;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public User(int userid, String username, String password, String emailid, String address, String contact_num, String admin) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.emailid = emailid;
		this.address = address;
		this.contact_num = contact_num;
		this.admin=admin;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", emailid=" + emailid
				+ ", address=" + address + ", contact_num=" + contact_num +",admin="+admin+",assign=" + assign +  "]";
	}
	

}
