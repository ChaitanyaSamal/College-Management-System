package com.cms.CollegeManagementSystem.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.cms.CollegeManagementSystem.entities.AnnouncementDetails;

public class AnnouncementDetailsRowMapper implements org.springframework.jdbc.core.RowMapper<AnnouncementDetails> {
	
	@Override
	public AnnouncementDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
	
	AnnouncementDetails announcementdetails= new AnnouncementDetails();
	announcementdetails.setId(rs.getInt(1));
	announcementdetails.setAnnouncement_name(rs.getString(2));
	System.out.println(rs.getString(2));
	announcementdetails.setAnnouncement_time(rs.getString(3));
	announcementdetails.setAnnouncement_path(rs.getString(4));
	return announcementdetails;
	
	}
}
