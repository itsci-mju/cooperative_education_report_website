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

public class EditmentorDB {

	public EditmentorDB() {
		// TODO Auto-generated constructor stub
	}


public Mentor SearchMentorid (int id){
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		Mentor mentor = null;
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from mentor where mentorid = "+id+"";
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
				
				
				mentor = new Mentor(mentorid,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,mentorfacebook,phonenumber,mentorimg);
		
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mentor;
		
	}

	public int UPDATEMentor(Mentor mentor)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE mentor SET mentorname = '"+mentor.getMentorname()+"',mentorlastname ='"+mentor.getMentorlastname()+"',mentornickname ='"+mentor.getMentornickname()+"',mentorposition ='"+mentor.getMentorposition()+"',metoremail ='"+mentor.getMetoremail()+"',mentorline ='"+mentor.getMentorline()+"',mentorfacebook ='"+mentor.getMentorfacebook()+"',phonenumber = '"+mentor.getPhonenumber()+"',mentorimg = '"+mentor.getMentorimg()+"' WHERE mentorid = '"+mentor.getMentorid()+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	public int UPDATEMentorED(Mentor mentor,Mentor mentorT)    {  
		try{  
			ConnectionDB dbcon = new ConnectionDB();
       Connection conn = dbcon.getConnection();   
       Statement statment = conn.createStatement(); 
       statment.execute("UPDATE mentor SET mentorname = '"+mentor.getMentorname()+"',mentorlastname ='"+mentor.getMentorlastname()+"',mentornickname ='"+mentor.getMentornickname()+"',mentorposition ='"+mentor.getMentorposition()+"',metoremail ='"+mentor.getMetoremail()+"',mentorline ='"+mentor.getMentorline()+"',mentorfacebook ='"+mentor.getMentorfacebook()+"',phonenumber = '"+mentor.getPhonenumber()+"',mentorimg = '"+mentor.getMentorimg()+"' WHERE mentorid = '"+mentorT.getMentorid()+"'"); 
       conn.close();
       return 1; 
       }catch(Exception e){          
    	   return -1; }   
		
		}   
	

	
}
