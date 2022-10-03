package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

import util.LoginbyStudentDB;
import util.ReviewCompanyDB;
import util.notifysendingreportDB;
@Controller
public class LoginController {

	public LoginController() {
		// TODO Auto-generated constructor stub
	}
	

@RequestMapping(value = "/loadlogin" , method = RequestMethod.GET)
public String loadLoginPage() {
	return "LoginbyStudentPage";
}


@RequestMapping (value="/loadlogout",method=RequestMethod.GET)
public String loadlogout(HttpSession session) {
	session.setMaxInactiveInterval(1);
	session.removeAttribute("student");
	session.removeAttribute("teacher");
	return "index";
}

@RequestMapping(value = "/loadhome" , method = RequestMethod.GET)
public String loadhomePage() {
	return "index";
}

@RequestMapping(value="/login", method=RequestMethod.POST)
public String doLogin(HttpServletRequest request ,Model md , HttpSession session) {
	
	
	notifysendingreportDB HM = new notifysendingreportDB();
	List<reportname> Listreportname = HM.AllListreportname();
	String Error = null;
	String ErrorRV = null;
	
	try {
		request.setCharacterEncoding("UTF-8");
		}catch(UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
	
	String uname = request.getParameter("uname");
	String pwd = request.getParameter("pwd");

	Student stu = new Student(uname,"","",pwd,"",null,null,"",0,0);

	LoginbyStudentDB sm = new LoginbyStudentDB();
	stu = sm.verifyLoginSTU(stu);
	
	if(stu != null) {
		request.setAttribute("error",1);
		
		for (reportname R : Listreportname) {
			
			Date dt = new Date(stu.getStartdate().getTime());
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, R.getDelivery());
			dt = c.getTime();
			

			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			
			if(dd.after(dt)){
				
				 report Lreport = null;
                 int reportnameid = 0;
                 try{
                    Lreport = HM.AllListmyreport(stu.getIdstudent() , R.getReportnameid()); 
                    reportnameid = Lreport.getReportName_reportnameid();
                    }catch(Exception e){
                    reportnameid = 0;
                    }
                 
                 
                 int reportid = 0;
                 try{
                	 
                	 reportid = HM.AllListreportid(stu.getIdstudent() , R.getReportnameid()-1);  
                	                                  	 
                     }catch(Exception e){
                     reportid = 0;
                     } 
                 
                 if(reportnameid == R.getReportnameid()){
                	 
                 }
                 
                 else if (reportid+1 == R.getReportnameid()){
                	 if(R.getReportnameid() == 18) {
                		 evaluatevideo ev1 = null;
                         String id = null;
                            try{
                                 ev1 = HM.AllListVDO(stu.getIdstudent()); 
                                 id = ev1.getStudent_studentid();
                               }catch(Exception e){
                                 reportnameid = 0;
                               }
                            if(id == null){
                            	Error = R.getReportname();
                             break;
                            }
                            
                	 }else {
                		 Error = R.getReportname();
                	 }         	
                 }
				
			}
			
			
		}
		
		
		Date dtRV = new Date(stu.getEnddate().getTime());
		Calendar c = Calendar.getInstance();
		c.setTime(dtRV);
		dtRV = c.getTime();

		Date ddRV = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(ddRV);
		c1.add(Calendar.YEAR,543);
		ddRV = c1.getTime();
		
		ReviewCompanyDB RVC = new ReviewCompanyDB();
		Review review = null;
		
		if(ddRV.after(dtRV)){
		try{
		review = RVC.Searchreviewid(stu.getIdstudent());
		}catch(Exception e) {
		review = null;
		}
		
		if(review == null){
			ErrorRV = "1";
		}
		}
		request.setAttribute("Error", Error);
		request.setAttribute("ErrorRV", ErrorRV);
		session.setAttribute("student", stu);
		return "index";
	}else {
		request.setAttribute("error",-1);
		return "LoginbyStudentPage";
	}
	
}


@RequestMapping(value="/loginTC", method=RequestMethod.POST)
public String loginTC(HttpServletRequest request ,Model md , HttpSession session) {
	
	try {
		request.setCharacterEncoding("UTF-8");
		}catch(UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
	
	String uname = request.getParameter("unameE");
	String pwd = request.getParameter("pwdE");

	teacher th = new teacher(0,"","","",uname,pwd,"","","");

	LoginbyStudentDB sm = new LoginbyStudentDB();
	th = sm.verifyLoginTC(th);
	
	if(th != null) {
		request.setAttribute("error",1);
		session.setAttribute("teacher",th);
		return "index";
	}else {	
		request.setAttribute("error",-1);
		//response.sendRedirect("login.jsp");
		return "LoginbyStudentPage";
	}
	
	
	
}

}
