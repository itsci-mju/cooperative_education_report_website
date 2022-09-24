package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import bean.*;
import util.HibernateConnection;


public class ListmentorDB {
	public ListmentorDB() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Mentor> AllListmentor(String id){
		List<Mentor> listMentor = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor where Student_studentid = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				int mentorid = rs.getInt(1);
				String mentorname = rs.getString(2);
				String lastname = rs.getString(3);	
				String mentornickname = rs.getString(4);
				String mentorposition = rs.getString(5);
				String metoremail = rs.getString(6);
				String mentorline = rs.getString(7);
				String mentorfacebook = rs.getString(8);
				String phonenumber = rs.getString(9);
				String mentorimg = rs.getString(10);	
				String Student_studentid = rs.getString(11);
				
				
				Mentor mentor = new Mentor(mentorid,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg,Student_studentid);
				listMentor.add(mentor);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listMentor;
		
	}
	
	public int deletmentor(String id){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "delete from mentor where  mentorid = '"+id+"'";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
			}
			
		catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;		
		
	}
}
