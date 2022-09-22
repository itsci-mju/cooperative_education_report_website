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
import util.UploadVDODB;
@Controller
public class UploadVDOcontroller {

	public UploadVDOcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value = "/loadUploadVDOPage" , method = RequestMethod.GET)
	public String loadUploadVDOPage(HttpServletRequest  request ,HttpSession session) {
		
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		UploadVDODB UR = new UploadVDODB();
		List<Student> Lstd = UR.Liststudentidcom(student.getCompany_companyid(),student.getSemester());
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("Lstd", Lstd);
		return "UpdoadVDOPage";
	}
	
	@RequestMapping(value = "/loadEditVDOPage" , method = RequestMethod.GET)
	public String loadEditVDOPage(HttpServletRequest  request ,HttpSession session) {
		
		Student student = (Student)session.getAttribute("student");
		String Reportname = request.getParameter("getReportname");
		String Reportid = request.getParameter("Reportid");
		String VDOid = request.getParameter("VDOid");
		
		UploadVDODB UR = new UploadVDODB();
		List<Student> Lstd = UR.Liststudentidcom(student.getCompany_companyid(),student.getSemester());
		
		session.setAttribute("Reportname", Reportname);
		session.setAttribute("Reportid", Reportid);
		session.setAttribute("Lstd", Lstd);
		session.setAttribute("VDOid", VDOid);
		return "EditVDOPage";
	}


	@RequestMapping(value="/uploadVDO", method=RequestMethod.POST)
	public String uploadVDO(HttpServletRequest  request, HttpSession session) {       

	Student student = (Student)session.getAttribute("student");
	String Reportid = (String)session.getAttribute("Reportid");
	List<Student> Lstd = (List)session.getAttribute("Lstd"); 
	UploadVDODB UR = new UploadVDODB();
	List<teacher> Teacher = UR.ListTeacher();
	 int Reportidint = Integer.parseInt(Reportid);
	 
	
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
			String profile_pic = new File(data.get(0).getName()).getName();
				
			int getMaxVOD = UR.getMaxVOD();
			
			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
			
			int i = getMaxVOD+1;
			
			VDO vdo = new VDO(i,Reportid+"_"+student.getIdstudent()+"_"+date2+".mp4",date1,"ยังไม่ได้ให้คะแนนวิดีโอ",student.getCompany_companyid());
			int error1 = UR.addvdo(vdo);	
			
			for(Student sd :Lstd) {
			for(teacher TH : Teacher) {
				if(TH.getStatus().equals("อยู่")){
			evaluatevideo evvideo = new evaluatevideo(sd.getIdstudent(),i,0,null,TH.getTeacherid());		
			int error2 = UR.addevaluatevideo(evvideo);	
			}
			}
			}
			
			String path = request.getSession().getServletContext().getRealPath("/") + "//video//";
			System.out.println(path);
			data.get(0).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".mp4"));
			
		}catch (Exception e) {
			e.printStackTrace();
			
			}
	}
	return "notifysendingreportPage";
	}
	
	
	
	@RequestMapping(value="/EditVDO", method=RequestMethod.POST)
	public String EditVDO(HttpServletRequest  request, HttpSession session) {       

	Student student = (Student)session.getAttribute("student");
	String Reportid = (String)session.getAttribute("Reportid");
	List<Student> Lstd = (List)session.getAttribute("Lstd"); 
	UploadVDODB UR = new UploadVDODB();
	List<teacher> Teacher = UR.ListTeacher();
	 int Reportidint = Integer.parseInt(Reportid);
	 
	
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
			String profile_pic = new File(data.get(0).getName()).getName();
				
			int getMaxVOD = UR.getIDVOD(student.getIdstudent());
			
			Date dd = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(dd);
			c1.add(Calendar.YEAR,543);
			dd = c1.getTime();
			String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
			String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
			
			
			VDO vdo = new VDO(getMaxVOD,Reportid+"_"+student.getIdstudent()+"_"+date2+".mp4",date1,"ยังไม่ได้ให้คะแนนวิดีโอ",student.getCompany_companyid());
			int error1 = UR.Editvdo(vdo);	
			
			
			String path = request.getSession().getServletContext().getRealPath("/") + "//video//";
			System.out.println(path);
			data.get(0).write(new File(path +File.separator +Reportid+"_"+student.getIdstudent()+"_"+date2+".mp4"));
			
		}catch (Exception e) {
			e.printStackTrace();
			
			}
	}
	return "notifysendingreportPage";
	}
	
}
