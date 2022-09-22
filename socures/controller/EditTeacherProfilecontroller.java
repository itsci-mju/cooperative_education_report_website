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
import util.EditTeacherProfileDB;
import util.LoginbyStudentDB;
@Controller
public class EditTeacherProfilecontroller {

	public EditTeacherProfilecontroller() {
		// TODO Auto-generated constructor stub
	}
	



@RequestMapping(value = "/loadEditTeacherProfile" , method = RequestMethod.GET)
public String loadEditStudentProfilePage() {
	
	return "EditTeacherProfile";
}

@RequestMapping(value = "/loadViewTeacherProfile" , method = RequestMethod.GET)
public String loadViewTeacherProfile() {
	
	return "ViewTeacherProfile";
}

@RequestMapping(value="/EditTeacher", method=RequestMethod.POST)
public String EditStudentProfile(HttpServletRequest  request, HttpSession session) {
	int error = 0;
	EditTeacherProfileDB md = new EditTeacherProfileDB();
	int Teacheridint = 0;
	teacher Teacher = null;
	
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
	String Teacherimg = new File(data.get(0).getName()).getName();	
	String teacherid = new String(data.get(1).get(),StandardCharsets.UTF_8);
	String teachername = new String(data.get(2).get(),StandardCharsets.UTF_8);
	String teacherlastname = new String(data.get(3).get(),StandardCharsets.UTF_8);
	String phonenumber = new String(data.get(4).get(),StandardCharsets.UTF_8);
	String teacheremail = new String(data.get(5).get(),StandardCharsets.UTF_8);
	String password = new String(data.get(6).get(),StandardCharsets.UTF_8);
	

	Teacheridint = Integer.parseInt(teacherid);
	
	Date dd = new Date();
	Calendar c1 = Calendar.getInstance();
	c1.setTime(dd);
	c1.add(Calendar.YEAR,543);
	dd = c1.getTime();
	String date1 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
	
	if(Teacherimg != "") {
	Teacher = new teacher(Teacheridint,teachername,teacherlastname,phonenumber,teacheremail,password,"",Teacheridint+"_"+date1+"_Teacher.png","");
	 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
	 data.get(0).write(new File(path +File.separator +Teacheridint+"_"+date1+"_Teacher.png"));	
	 
	}else {
		Teacher = new teacher(Teacheridint,teachername,teacherlastname,phonenumber,teacheremail,password,"","user.png","");
	}
	
	 error = md.UPDATESTeacher(Teacher);		
		
	 
		}catch (Exception e) {
			e.printStackTrace();				
			}	
}
	if(error == 1) { 
		LoginbyStudentDB LS = new LoginbyStudentDB();
		Teacher = LS.verifyLoginTC(Teacher);
		session.setAttribute("teacher", Teacher);
		return "EditTeacherProfile";
	}else {
		
		return "EditTeacherProfile";
	}
	
}



}
