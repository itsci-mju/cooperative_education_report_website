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
import util.ListWeeklyReporDB;
import util.ViewVDODB;

@Controller
public class ViewVDOcontroller {

	public ViewVDOcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/loadViewVDOPage" , method = RequestMethod.GET)
	public String loadLoginPage(HttpServletRequest  request ,HttpSession session) {
		
		String STUid = request.getParameter("STUID");
		
		ListWeeklyReporDB LWR = new ListWeeklyReporDB();
		Student student = LWR.vSTU(STUid);
		
		ViewVDODB Vvdo = new ViewVDODB();
		VDO vdo = Vvdo.Viewvideo(STUid);
		
		
		session.setAttribute("student1", student);
		session.setAttribute("vdo", vdo);
		
		return "ViewVDOPage";
	}
	
	

	
}
