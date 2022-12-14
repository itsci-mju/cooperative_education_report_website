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
import util.UploadReportDB;
import util.UploadVDODB;
@Controller
public class UploadReportcontroller {

	public UploadReportcontroller() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/loadUploadReportPage" , method = RequestMethod.GET)
	public String loadaddmentorPage(HttpServletRequest  request ,HttpSession session) {
		
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		return "UploadReportPage";
	}
	

	@RequestMapping(value = "/loadEditReportPage" , method = RequestMethod.GET)
	public String loadEditReportPage(HttpServletRequest  request ,HttpSession session) {
		UploadReportDB UR = new UploadReportDB();
		
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		
		report RP = UR.Viewreport(Reportid,student.getIdstudent() );
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("FRP", RP);
		return "EditReportPage";
	}


	@RequestMapping(value="/uploadReport", method=RequestMethod.POST)
	public String uploadReport(HttpServletRequest  request, HttpSession session) {       

	Student student = (Student)session.getAttribute("student");
	String Reportid = (String)session.getAttribute("Reportid");
	
	int error = 0;
	
	 int Reportidint = Integer.parseInt(Reportid);
	
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
			String profile_pic = new File(data.get(1).getName()).getName();
			
			UploadReportDB UR = new UploadReportDB();
			int getMaxreport = UR.getMaxreport();
			UploadVDODB VD = new UploadVDODB();
			List<teacher> Teacher = VD.ListTeacher();
			
			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
			report report = new report(getMaxreport+1,Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf",date1,"?????????????????????????????????????????????????????????????????????",student.getIdstudent(),Reportidint);
			
			 error = UR.addreport(report);	
			
			
			if(Reportidint == 17) {
				for(teacher TH : Teacher) {
					if(TH.getStatus().equals("????????????")) {
					evaluatereport evvreport = new evaluatereport(getMaxreport+1,TH.getTeacherid(),0,null);		
					 error = UR.addevaluatereport(evvreport);	
					}
				}
				}
			
			String path = request.getSession().getServletContext().getRealPath("/") + "//document//";
			data.get(1).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf"));
			
		}catch (Exception e) {
			e.printStackTrace();
			error = -1;
			
			}
	}
	request.setAttribute("error", error);
	return "notifysendingreportPage";
	}
	
	
	@RequestMapping(value="/EditReport", method=RequestMethod.POST)
	public String EditReport(HttpServletRequest  request, HttpSession session) {       

	Student student = (Student)session.getAttribute("student");
	String Reportid = (String)session.getAttribute("Reportid");
	int error = 0;
	 int Reportidint = Integer.parseInt(Reportid);
	
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
			String profile_pic = new File(data.get(1).getName()).getName();
			
			UploadReportDB UR = new UploadReportDB();
			int getMaxreport = UR.getMaxreport();
			
			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
			
			report report = new report(getMaxreport+1,Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf",date1,"?????????????????????????????????????????????????????????????????????",student.getIdstudent(),Reportidint);
			
			 error = UR.UPDATEreport(report);	
			String path = request.getSession().getServletContext().getRealPath("/") + "//document//";
			System.out.println(path);
			data.get(1).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".pdf"));
			
		}catch (Exception e) {
			e.printStackTrace();
			error = -1;
			
			}
	}
	request.setAttribute("error", error);
	return "notifysendingreportPage";
	}

}
