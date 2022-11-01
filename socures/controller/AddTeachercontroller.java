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
import util.ListStudentDB;
import util.ListmentorDB;
import util.UploadReportDB;
import util.UploadVDODB;
import util.ViewReportDB;
import util.ViewVDODB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;

@Controller
public class AddTeachercontroller {

	public AddTeachercontroller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/loadAddTeacherPage" , method = RequestMethod.GET)
	public String loadAddTeacherPage() {	
		return "AddTeacherProfile";
	}
	
	@RequestMapping(value = "/loadListTeacherPage" , method = RequestMethod.GET)
	public String loadListTeacherPage(HttpServletRequest  request ,HttpSession session) {
		
		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();
		
		session.setAttribute("teacherlist", Teacher);
		
		return "ListTeacherProfile";
	}
	
	
	@RequestMapping(value = "/loadStatusTeacher" , method = RequestMethod.GET)
	public String loadStatusTeacher(HttpServletRequest  request ,HttpSession session) {
		
		int error = 0;
		
		String Teacherid = request.getParameter("Teacherid");
		String getStatus = request.getParameter("getStatus");
		teacherManager ListTM = new teacherManager();
		
		ViewVDODB vdo = new ViewVDODB();
		ViewReportDB ViewReport = new ViewReportDB();
		addTeacherDB teacher = new addTeacherDB();
		ListStudentDB ListStu = new ListStudentDB();
		UploadVDODB UR = new UploadVDODB();
		UploadReportDB URP = new UploadReportDB();
		error  = teacher.UPDATEStatusTeacher(Teacherid,getStatus);
		
        if(getStatus.equals("กำลังศึกษาต่อ")) {
        List<String> semesterList =  ListStu.AllListsemester();
        
        List<VDO> VDODT = vdo.AllListStuvdoDESC2(semesterList.get(0));
        List<Student> ListSTU = ListStu.AllListStuSemester(semesterList.get(0));
        
        for(VDO v : VDODT) {
        		error = ListTM.DELETEevaluatevideo1(Teacherid,v.getVideoid());
        }
        for(Student stu : ListSTU) {
        	
        	try {
        	report R = ViewReport.Viewreport(stu.getIdstudent());
        	error = ListTM.DELETEevaluatereport(Teacherid,R.getReportid());
        	}catch(Exception e) {
        		  //  Block of code to handle errors
        		}
        	
        }
        
        }else {
        	 List<String> semesterList =  ListStu.AllListsemester();
        	 List<VDO> VDODT = vdo.AllListStuvdoDESC2(semesterList.get(0));
             List<Student> ListSTU = ListStu.AllListStuSemester(semesterList.get(0));
             
             int idtc = Integer.parseInt(Teacherid);
             for(VDO vdo1 : VDODT) {
            	 List<Student> Lstd = UR.Liststudentidcom(vdo1.getCompany_companyid(),semesterList.get(0)); 
            	 for(Student S : Lstd) {
            	 evaluatevideo evvideo = new evaluatevideo(S.getIdstudent(),vdo1.getVideoid(),-1,null,idtc);
            	 error = UR.addevaluatevideo(evvideo);
            	 }    			
             }
             
             for(Student stu : ListSTU) {          	
             	try {
             	report R = ViewReport.Viewreport(stu.getIdstudent());
             	error = ListTM.DELETEevaluatereport(Teacherid,R.getReportid());      	
             	evaluatereport evvreport = new evaluatereport(R.getReportid(),idtc,0,null);		
				 error = URP.addevaluatereport(evvreport);
             	}catch(Exception e) {
             		  //  Block of code to handle errors
             		}
             	
             }
             
             
        }
		
		
		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();
		
		if(error == 1) {
		request.setAttribute("error", 2);
		}
		request.setAttribute("error", error);
		session.setAttribute("teacherlist", Teacher);
		
		return "ListTeacherProfile";
	}
	
	
	private int DELETEevaluatevideo(String teacherid, int videoid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@RequestMapping(value = "/loadStatusTeacherposition" , method = RequestMethod.GET)
	public String loadStatusTeacherposition(HttpServletRequest  request ,HttpSession session) {
		
		int error = 0;
		
		String Teacherid = request.getParameter("Teacherid");
		String Tid = request.getParameter("Tid");
		
		
		addTeacherDB teacher = new addTeacherDB();
		error  = teacher.UPDATEStatusTeacherposition(Teacherid);
		
		error  = teacher.UPDATEStatusTeacheris2(Tid);
		
		session.setMaxInactiveInterval(1);
		session.removeAttribute("student");
		session.removeAttribute("teacher");
		return "index";
		
	}
	
	
	@RequestMapping(value = "/loadDETeacher" , method = RequestMethod.GET)
	public String loadDETeacher(HttpServletRequest  request ,HttpSession session) {
		
		int error = 0;
		
		String Teacherid = request.getParameter("Teacherid");
		
		addTeacherDB teacher = new addTeacherDB();
		error  = teacher.UPDATEDETeacher(Teacherid);
		
		
		addTeacherDB Listteacher = new addTeacherDB();
		List<teacher> Teacher = Listteacher.AllListteacher();
		
		if(error == 1) {
		request.setAttribute("error",3);
		}
		request.setAttribute("error",error);
		session.setAttribute("teacherlist", Teacher);
		
		return "ListTeacherProfile";
	}
	
	
	
	@RequestMapping(value="/addTeacher", method=RequestMethod.POST)
	public String addmentor(HttpServletRequest  request, HttpSession session) {
		int error = 0;
		teacher errorM = null ;		
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				
		String imageUpload = new File(data.get(0).getName()).getName();	
		String teachername = new String(data.get(1).get(),StandardCharsets.UTF_8);
		String teacherlastname = new String(data.get(2).get(),StandardCharsets.UTF_8);
		String phonenumber = new String(data.get(3).get(),StandardCharsets.UTF_8);
		String teacheremail = new String(data.get(4).get(),StandardCharsets.UTF_8);
	

	
		addTeacherDB sm = new addTeacherDB();	
	
	      
		
			int MaxTeacher = sm.getMaxTeacher();
			int Teacherid = MaxTeacher+1;
			
			
			if(imageUpload != "") {
				teacher Teacher = new teacher(Teacherid,teachername,teacherlastname,phonenumber,teacheremail,phonenumber,"2",MaxTeacher+"_Mentor.png","อยู่");
			 error = sm.addTeacher(Teacher);
			}else {
				teacher Teacher = new teacher(Teacherid,teachername,teacherlastname,phonenumber,teacheremail,phonenumber,"2","user.png","อยู่");
				 error = sm.addTeacher(Teacher);
			}
			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
			 if(imageUpload != "") {			 
				 data.get(0).write(new File(path +File.separator +MaxTeacher+"_Mentor.png"));	
			 }
		
			}catch (Exception e) {
				e.printStackTrace();
				error = -1;
				}	
	}
		
		if(error == 1) {
			addTeacherDB Listteacher = new addTeacherDB();
			List<teacher> Teacher = Listteacher.AllListteacher();
			
			session.setAttribute("teacherlist", Teacher);
			request.setAttribute("error",error);
			return "ListTeacherProfile";
		}else {
			request.setAttribute("error",error);
			return "AddTeacherProfile";
		}
		
	}

}
