package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.*;
import util.ListmentorDB;
import util.addmentorDB;
@Controller
public class addmentorcontroller {



	public addmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadaddmentorPage" , method = RequestMethod.GET)
	public String loadaddmentorPage() {
		return "addmentorPage";
	}
	

	@RequestMapping(value="/addmentor", method=RequestMethod.POST)
	public String addmentor(HttpServletRequest  request, HttpSession session) {
		int error = 0;
		Mentor errorM = null ;		
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				
		String mentorimg = new File(data.get(0).getName()).getName();	
		String mentorname = new String(data.get(1).get(),StandardCharsets.UTF_8);
		String lastname = new String(data.get(2).get(),StandardCharsets.UTF_8);
		String mentornickname = new String(data.get(3).get(),StandardCharsets.UTF_8);
		String mentorposition = new String(data.get(4).get(),StandardCharsets.UTF_8);
		String phonenumber = new String(data.get(5).get(),StandardCharsets.UTF_8);
		String mentorline = new String(data.get(6).get(),StandardCharsets.UTF_8);
		String metoremail = new String(data.get(7).get(),StandardCharsets.UTF_8);
		String metorfacebook = new String(data.get(8).get(),StandardCharsets.UTF_8);
	
		
		
		
		Date dd = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(dd);
		c1.add(Calendar.YEAR,543);
		dd = c1.getTime();
		String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
		
	
		addmentorDB sm = new addmentorDB();
		Student student = (Student)session.getAttribute("student");
	
		try {
		errorM = sm.SearchMentorname(mentorname,lastname);
		}catch (Exception e) {
			e.printStackTrace();				
			}	
	      
		if(errorM == null) {
			int MaxMentor = sm.getMaxMentor();
			int Mentorid = MaxMentor+1;
			
			
			if(mentorimg != "") {
			Mentor mentor = new Mentor(Mentorid,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,Mentorid+"_"+date1+"_Mentor.png",student.getIdstudent());
			 error = sm.addMentor(mentor);
			}else {
				Mentor mentor = new Mentor(Mentorid,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,"user.png",student.getIdstudent());
				 error = sm.addMentor(mentor);
			}
			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
			 if(mentorimg != "") {			 
				 data.get(0).write(new File(path +File.separator +Mentorid+"_"+date1+"_Mentor.png"));	
			 }
		}else {
			error = -1; 
		}
			
			}catch (Exception e) {
				e.printStackTrace();				
				}	
	}
		if(error == -1) { 
			request.setAttribute("error", error);
			return "addmentorPage"; 
		}else {
			Student student = (Student)session.getAttribute("student");
			ListmentorDB   HM = new ListmentorDB();
			List<Mentor> st = HM.AllListmentor(student.getIdstudent());
			session.setAttribute("listmentors", st);
			return "EditStudentProfile";
		}
	}
	}
	
