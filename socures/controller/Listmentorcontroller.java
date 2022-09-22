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
import util.ListmentorDB;
@Controller
public class Listmentorcontroller {

	public Listmentorcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value = "/loadListmentor" , method = RequestMethod.GET)
	public String loadLoginPage(HttpSession session , HttpServletRequest  request) {
		
		Student student = (Student)session.getAttribute("student");
		ListmentorDB   HM = new ListmentorDB();
		List<Mentor> st = HM.AllListmentor(student.getIdstudent());
		session.setAttribute("listmentors", st);
		return "EditStudentProfile";
	}

	@RequestMapping(value = "/loaddeletmentor" , method = RequestMethod.GET)
	public String loaddeletmentor(HttpSession session , HttpServletRequest  request) {
		
		String mentorid = request.getParameter("idMentor");
		System.out.println("idMentor = "+mentorid);
		ListmentorDB   HM = new ListmentorDB();
		int error = HM.deletmentor(mentorid);
		
		Student student = (Student)session.getAttribute("student");
		List<Mentor> st = HM.AllListmentor(student.getIdstudent());
		
		return "EditStudentProfile";
	}


}
