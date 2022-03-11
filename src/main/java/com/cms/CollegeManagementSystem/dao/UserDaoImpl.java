package com.cms.CollegeManagementSystem.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.cms.CollegeManagementSystem.entities.AnnouncementDetails;
import com.cms.CollegeManagementSystem.entities.User;


@Component
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	
	@Autowired
	private DatabaseConnection dbconn;
	
	
	public DatabaseConnection getDbconn() {
		return dbconn;
	}

	public void setDbconn(DatabaseConnection dbconn) {
		this.dbconn = dbconn;
	}
	@Override
	public boolean registerUser(User user) {
		// TODO Auto-generated method stub
		int res=jdbctemplate.update("insert into user(username,password,emailid,address,contact_num) values(?,?,?,?,?)",user.getUsername(),user.getPassword(),user.getEmailid(),
				user.getAddress(),user.getContact_num());
		if(res>=1) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean addAdmin(User user) {
		// TODO Auto-generated method stub
		int res=jdbctemplate.update("update user set admin='Y' where username=? and emailid=?",user.getUsername(),user.getEmailid());
		if(res>=1) {
			return true;
		}
		return false;
	}

	@Override
	public User findUserByName(String username) {
		// TODO Auto-generated method stub
		PreparedStatementSetter setter =new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, username);
				
			}
		};
		return jdbctemplate.query("select * from user where username=?", setter, new ResultSetExtractor<User>() {

			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User user=null;
				if(rs.next()) {
					user=new User();
					user.setUserid(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setEmailid(rs.getString(4));
					user.setAddress(rs.getString(5));
					user.setContact_num(rs.getString(6));
					user.setAdmin(rs.getString(7));
					return user;
				}
				return user;
			}
		});
	}


	@Override
	public User findUserById(int userid) {
		// TODO Auto-generated method stub
		
PreparedStatementSetter setter =new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, userid);
				
			}
		};
		return jdbctemplate.query("select * from user where userid=?", setter, new ResultSetExtractor<User>() {

			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User user=null;
				if(rs.next()) {
					user=new User();
					user.setUserid(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setEmailid(rs.getString(4));
					user.setAddress(rs.getString(5));
					user.setContact_num(rs.getString(6));
					user.setAdmin(rs.getString(7));
					return user;
				}
				return user;
			}
		});
	}

	@Override
	public List<AnnouncementDetails> ViewAnnouncements() {
		
		return jdbctemplate.query("select * from PublicAnnouncements order by date_time desc", new AnnouncementDetailsRowMapper());
	}

	@Override
	public boolean UpdateUserPassword(int userid, String password) {
		// TODO Auto-generated method stub
		int res=jdbctemplate.update("update user set password=? where userid=?",password,userid);
		if(res>=1) {
			return true;
		}
		return false;
	}
	
	@Override
	public User findUserByName_emailid(String username,String emailid) {
		// TODO Auto-generated method stub
		PreparedStatementSetter setter =new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, username);
				ps.setString(2, emailid);
				
			}
		};
		return jdbctemplate.query("select * from user where username=? and emailid=?", setter, new ResultSetExtractor<User>() {

			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				User user=null;
				if(rs.next()) {
					user=new User();
					user.setUserid(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setEmailid(rs.getString(4));
					user.setAddress(rs.getString(5));
					user.setContact_num(rs.getString(6));
					user.setAdmin(rs.getString(7));
					return user;
				}
				return user;
			}
		});
	}
	
	public boolean addAnnouncement(AnnouncementDetails announcement,String filename) {
		int res=jdbctemplate.update("insert into PublicAnnouncements(announcement_name,date_time,pdf_path) values(?,now(),?)",announcement.getAnnouncement_name(),"/Announcements/"+filename);
		if(res>=1) {
			return true;
		}
		return false;
	}
	
	@Override
	public List<User> ViewUsers() {
		// TODO Auto-generated method stub
		return jdbctemplate.query("select * from User", new UserRowMapper());
	}

}
