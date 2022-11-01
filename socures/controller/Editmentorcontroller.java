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
import util.EditStudentProfileDB;
import util.EditmentorDB;
import util.ListmentorDB;
import util.LoginbyStudentDB;
import util.addmentorDB;
@Controller
public class Editmentorcontroller {

	public Editmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadEditmentorPage" , method = RequestMethod.GET)
	public String loadEditmentorPage(HttpServletRequest  request ,HttpSession session) {
		String mentorid = request.getParameter("idMentor");
		int mentoridint = Integer.parseInt(mentorid);
		EditmentorDB EDB = new EditmentorDB();
		Mentor mentor = EDB.SearchMentorid(mentoridint);
		
		session.setAttribute("Ementor", mentor);
		return "EditmentorPage";
	}
	
	@RequestMapping(value = "/loadViewmentorPage" , method = RequestMethod.GET)
	public String loadViewmentorPage(HttpServletRequest  request ,HttpSession session) {
		String mentorid = request.getParameter("idMentor");
		String STUid = request.getParameter("stu");
		int mentoridint = Integer.parseInt(mentorid);
		EditmentorDB EDB = new EditmentorDB();
		Mentor mentor = EDB.SearchMentorid(mentoridint);
		
		session.setAttribute("Ementor", mentor);
		session.setAttribute("STUid", STUid);
		return "ViewmentorPage";
	}

	
	
	@RequestMapping(value="/Editmentor", method=RequestMethod.POST)
	public String EditStudentProfile(HttpServletRequest  request, HttpSession session) {
		int error = 0;
		EditmentorDB md = new EditmentorDB();
		int mentoridint = 0;
		Mentor mentor = null;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				
		String mentorimg = new File(data.get(0).getName()).getName();	
		String testitem_ID = new String(data.get(1).get(),StandardCharsets.UTF_8);
		String mentorname = new String(data.get(2).get(),StandardCharsets.UTF_8);
		String lastname = new String(data.get(3).get(),StandardCharsets.UTF_8);
		String mentornickname = new String(data.get(4).get(),StandardCharsets.UTF_8);
		String mentorposition = new String(data.get(5).get(),StandardCharsets.UTF_8);
		String phonenumber = new String(data.get(6).get(),StandardCharsets.UTF_8);
		String mentorline = new String(data.get(7).get(),StandardCharsets.UTF_8);
		String metoremail = new String(data.get(8).get(),StandardCharsets.UTF_8);
		String metorfacebook = new String(data.get(9).get(),StandardCharsets.UTF_8);
	
		
		
		Date dd = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(dd);
		c1.add(Calendar.YEAR,543);
		dd = c1.getTime();
		String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
		
		
	
		mentoridint = Integer.parseInt(testitem_ID);
		mentor = md.SearchMentorid(mentoridint);
		
		Student student = (Student)session.getAttribute("student");
	
		if(mentorimg != "") {
		 mentor = new Mentor(mentoridint,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,testitem_ID+"_"+date1+"_Mentor.png");
		 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
		 data.get(0).write(new File(path +File.separator +testitem_ID+"_"+date1+"_Mentor.png"));	
		 
		}else {
		 mentor = new Mentor(mentoridint,mentorname,lastname,mentornickname,mentorposition,metoremail,mentorline,metorfacebook,phonenumber,mentor.getMentorimg());
		}
		
		EditmentorDB sm = new EditmentorDB();
		 error = sm.UPDATEMentor(mentor);		
			
		 
			}catch (Exception e) {
				e.printStackTrace();				
				}	
	}
		if(error == 1) { 
			Student student = (Student)session.getAttribute("student");
			ListmentorDB   HM = new ListmentorDB();
			List<Mentor> st = HM.AllListmentor(student.getIdstudent());
			request.setAttribute("error", error);
			session.setAttribute("listmentors", st);
			return "ListmentorPage";
		}else {
			Mentor mentor1 = md.SearchMentorid(mentoridint);
			request.setAttribute("error", error);
			session.setAttribute("Ementor", mentor1);
			return "EditmentorPage";
		}
		
	}

}
