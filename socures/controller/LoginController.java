package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
	
	try {
		request.setCharacterEncoding("UTF-8");
		}catch(UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
	
	String uname = request.getParameter("uname");
	String pwd = request.getParameter("pwd");

	Student stu = new Student(uname,"","",pwd,"",null,null,"",0,0,0,0);

	LoginbyStudentDB sm = new LoginbyStudentDB();
	stu = sm.verifyLoginSTU(stu);
	
	if(stu != null) {
		session.setAttribute("student", stu);
		return "index";
	}else {
		session.setAttribute("login","ข้อมูลไม่ถูกต้อง กรุณาลองใหม่");
		//response.sendRedirect("login.jsp");
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
		session.setAttribute("teacher",th);
		return "index";
	}else {
		session.setAttribute("login","ข้อมูลไม่ถูกต้อง กรุณาลองใหม่");
		//response.sendRedirect("login.jsp");
		return "LoginbyStudentPage";
	}
	
}

}
