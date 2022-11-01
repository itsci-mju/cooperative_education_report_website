package bean;

import java.sql.Date;

import javax.persistence.*;


public class Mentor {
	
	private int mentorid;
	private String mentorname;
	private String mentorlastname;
	private String mentornickname;
	private String mentorposition;
	private String metoremail;
	private String mentorline;
	private String mentorfacebook;
	private String phonenumber;
	private String mentorimg;

	public Mentor() {
		// TODO Auto-generated constructor stub
	}

	public Mentor(int mentorid, String mentorname, String mentorlastname, String mentornickname, String mentorposition,
			String metoremail, String mentorline, String mentorfacebook, String phonenumber, String mentorimg) {
		super();
		this.mentorid = mentorid;
		this.mentorname = mentorname;
		this.mentorlastname = mentorlastname;
		this.mentornickname = mentornickname;
		this.mentorposition = mentorposition;
		this.metoremail = metoremail;
		this.mentorline = mentorline;
		this.mentorfacebook = mentorfacebook;
		this.phonenumber = phonenumber;
		this.mentorimg = mentorimg;
	}

	public int getMentorid() {
		return mentorid;
	}

	public String getMentorname() {
		return mentorname;
	}

	public String getMentorlastname() {
		return mentorlastname;
	}

	public String getMentornickname() {
		return mentornickname;
	}

	public String getMentorposition() {
		return mentorposition;
	}

	public String getMetoremail() {
		return metoremail;
	}

	public String getMentorline() {
		return mentorline;
	}

	public String getMentorfacebook() {
		return mentorfacebook;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public String getMentorimg() {
		return mentorimg;
	}


	public void setMentorid(int mentorid) {
		this.mentorid = mentorid;
	}

	public void setMentorname(String mentorname) {
		this.mentorname = mentorname;
	}

	public void setMentorlastname(String mentorlastname) {
		this.mentorlastname = mentorlastname;
	}

	public void setMentornickname(String mentornickname) {
		this.mentornickname = mentornickname;
	}

	public void setMentorposition(String mentorposition) {
		this.mentorposition = mentorposition;
	}

	public void setMetoremail(String metoremail) {
		this.metoremail = metoremail;
	}

	public void setMentorline(String mentorline) {
		this.mentorline = mentorline;
	}

	public void setMentorfacebook(String mentorfacebook) {
		this.mentorfacebook = mentorfacebook;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public void setMentorimg(String mentorimg) {
		this.mentorimg = mentorimg;
	}


	
	
}
