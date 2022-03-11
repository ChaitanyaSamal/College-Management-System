package com.cms.CollegeManagementSystem.entities;

public class AnnouncementDetails {
	private int id;
	private String announcement_name;
	private String announcement_time;
	private String announcement_path;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnnouncement_name() {
		return announcement_name;
	}
	public void setAnnouncement_name(String announcement_name) {
		this.announcement_name = announcement_name;
	}
	public String getAnnouncement_time() {
		return announcement_time;
	}
	public void setAnnouncement_time(String announcement_time) {
		this.announcement_time = announcement_time;
	}
	public String getAnnouncement_path() {
		return announcement_path;
	}
	public void setAnnouncement_path(String announcement_path) {
		this.announcement_path = announcement_path;
	}
	
	@Override
	public String toString() {
		return "AnnouncementDetails [id=" + id + ", announcement_name=" + announcement_time + ", announcement_path=" + announcement_path + "]";
	}
	
	public AnnouncementDetails() {
		super();
	}
	public AnnouncementDetails(int id, String announcement_name, String announcement_time, String announcement_path) {
		super();
		this.id = id;
		this.announcement_name = announcement_name;
		this.announcement_time = announcement_time;
		this.announcement_path = announcement_path;
	}
}
