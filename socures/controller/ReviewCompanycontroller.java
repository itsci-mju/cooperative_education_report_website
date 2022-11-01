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
import util.ReviewCompanyDB;

@Controller
public class ReviewCompanycontroller {

	public ReviewCompanycontroller() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/loadReviewCompanyPage" , method = RequestMethod.GET)
	public String loadReviewCompanyPage() {
		
		return "ReviewCompanyPage";
	}

	
	@RequestMapping(value="/addReviewCompany", method=RequestMethod.POST)
	public String addReviewCompany(HttpServletRequest  request, HttpSession session) {
		int error = 0;
		ReviewCompanyDB RVC = new ReviewCompanyDB();
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
			
		String fileinput1 = new File(data.get(0).getName()).getName();
		String fileinput2 = new File(data.get(1).getName()).getName();
		String fileinput3 = new File(data.get(2).getName()).getName();
		String fileinput4 = new File(data.get(3).getName()).getName();
		String rating = new String(data.get(4).get(),StandardCharsets.UTF_8);
		String textReview = new String(data.get(5).get(),StandardCharsets.UTF_8);
				
		Student student = (Student) session.getAttribute("student");
		
		Date dd = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(dd);
		c1.add(Calendar.YEAR,543);
		dd = c1.getTime();
		String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
		String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
		String img = 1+date2+student.getIdstudent()+"_rv.png"+","+2+date2+student.getIdstudent()+"_rv.png"+","+3+date2+student.getIdstudent()+"_rv.png"+ ","+4+date2+student.getIdstudent()+"_rv.png";
		
		int id = RVC.getMaxreview();
		double ratingDouble = Double.valueOf(rating);
		 
		Review review = null;
		if(ratingDouble>=3) { 
		 review = new Review(id+1,img,textReview,date1,ratingDouble,"ผ่าน",student.getIdstudent());
		}else {
		 review = new Review(id+1,img,textReview,date1,ratingDouble,"ไม่ผ่าน",student.getIdstudent());
		}
		error = RVC.addreview(review);
		
		if(error == 1) {
			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";			
			 data.get(0).write(new File(path +File.separator+1+date2+student.getIdstudent()+"_rv.png"));	
			 data.get(1).write(new File(path +File.separator+2+date2+student.getIdstudent()+"_rv.png"));	
			 data.get(2).write(new File(path +File.separator+3+date2+student.getIdstudent()+"_rv.png"));	
			 data.get(3).write(new File(path +File.separator+4+date2+student.getIdstudent()+"_rv.png"));	
			 
			 double AVG = RVC.getscoreAVG(student.getCompany_companyid());
			 Double avg= ( Math.floor(AVG * 100) / 100 );
			 error = RVC.UPDATEAVG(avg,student.getCompany_companyid());
			 }
		
			}catch (Exception e) {
				e.printStackTrace();
				error = -1;
				}	
	}
		if(error == -1) { 
			request.setAttribute("error",error);
			return "ReviewCompanyPage"; 
		}else {	
			request.setAttribute("error",error);
			return "ReviewCompanyPage";
		}
	}
	
	@RequestMapping(value="/EditReviewCompany", method=RequestMethod.POST)
	public String EditReviewCompany(HttpServletRequest  request, HttpSession session) {
		int error = 0;
		ReviewCompanyDB RVC = new ReviewCompanyDB();
		Student student = (Student) session.getAttribute("student");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> data = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
		
		String fileinput1 = new File(data.get(0).getName()).getName();
		String fileinput2 = new File(data.get(1).getName()).getName();
		String fileinput3 = new File(data.get(2).getName()).getName();
		String fileinput4 = new File(data.get(3).getName()).getName();
		String rating = new String(data.get(4).get(),StandardCharsets.UTF_8);
		String textReview = new String(data.get(5).get(),StandardCharsets.UTF_8);
		
		Review reviewO = RVC.Searchreviewid(student.getIdstudent());
		
		String Fileinput1 = null;
		String Fileinput2 = null;
		String Fileinput3 = null;
		String Fileinput4 = null;
		
		Date dd = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(dd);
		c1.add(Calendar.YEAR,543);
		dd = c1.getTime();
		String date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);
		String date2 = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
		
		
		String imgStr = reviewO.getReviewpicture(); 
		String[] arr = imgStr.split(",");
		
		if(fileinput1=="") {
	      Fileinput1	= arr[0];
		}else {
		  Fileinput1 = 1+date2+student.getIdstudent()+"_rv.png";	
		}
		
		if(fileinput2=="") {
			 Fileinput2	= arr[1];
			}else {
			 Fileinput2	= 2+date2+student.getIdstudent()+"_rv.png";	
			}
		
		if(fileinput3=="") {
			 Fileinput3	= arr[2];
			}else {
			 Fileinput3	= 3+date2+student.getIdstudent()+"_rv.png";	
			}
		
		if(fileinput4=="") {
			 Fileinput4	= arr[3];
			}else {
			 Fileinput4	= 4+date2+student.getIdstudent()+"_rv.png";	
			}
		
				
		String img = Fileinput1+","+Fileinput2+","+Fileinput3+","+Fileinput4;
		
		
		double ratingDouble = Double.valueOf(rating);
		
		Review review = null;
		if(ratingDouble>=3) { 
			 review = new Review(0,img,textReview,date1,ratingDouble,"ผ่าน",student.getIdstudent());
		}else {
			 review = new Review(0,img,textReview,date1,ratingDouble,"ไม่ผ่าน",student.getIdstudent());
		}
		
		error = RVC.UPDATEreview(review);
		
		if(error == 1) {
			 String path = request.getSession().getServletContext().getRealPath("/") + "//images//";
			 
			 if(fileinput1!="") {
			 data.get(0).write(new File(path +File.separator+1+date2+student.getIdstudent()+"_rv.png"));
			 }
			 
			 if(fileinput2!="") {
			 data.get(1).write(new File(path +File.separator+2+date2+student.getIdstudent()+"_rv.png"));
			 }
			 
			 if(fileinput3!="") {
			 data.get(2).write(new File(path +File.separator+3+date2+student.getIdstudent()+"_rv.png"));
			 }
			 
			 if(fileinput4!="") {
			 data.get(3).write(new File(path +File.separator+4+date2+student.getIdstudent()+"_rv.png"));
			 }
			 
			 double AVG = RVC.getscoreAVG(student.getCompany_companyid());
			 Double avg= ( Math.floor(AVG * 100) / 100 );
			 error = RVC.UPDATEAVG(avg,student.getCompany_companyid());
			 }
		
			}catch (Exception e) {
				e.printStackTrace();
				error = -1;
				}	
	}
		if(error == -1) { 
			request.setAttribute("error",error);
			return "ReviewCompanyPage"; 
		}else {	
			request.setAttribute("error",error);
			return "ReviewCompanyPage";
		}
	}
}
