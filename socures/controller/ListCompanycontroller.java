package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ReviewCompanyDB;
@Controller
public class ListCompanycontroller {

	public ListCompanycontroller() {
		// TODO Auto-generated constructor stub
	}

	
	@RequestMapping(value = "/loadlistcomPage" , method = RequestMethod.GET)
	public String loadlistcomPage(HttpSession session) {
		
		
		ListCompanyDB ListCom = new ListCompanyDB();
		ListStudentDB ListStu = new ListStudentDB();
				
		
		List<String> semesterList =  ListStu.AllListsemester();
		List<Company>company = ListCom.SearchcompanyALL(semesterList.get(0));
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",semesterList.get(0));
		
		return "ListCompanyPage";
	}
	
	@RequestMapping(value = "/loadnamecomPage" , method=RequestMethod.POST)
	public String loadnamecomPage(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String NAME = request.getParameter("NAME");
		String search = request.getParameter("search");
		String searchDate = request.getParameter("searchDate");
	
		
		
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = null;
		
		if(search.equals("Company")) {
		company = ListStu.Searchcompanyname(NAME,searchDate);
		}
		
		session.setAttribute("ListCompany",company);
		session.setAttribute("semester",searchDate);
		
		return "ListCompanyPage";
	}
	
	@RequestMapping(value = "/loadViewcomPage" , method = RequestMethod.GET)
	public String loadViewcomPage(HttpServletRequest  request ,HttpSession session) {
		
		String Companyid = request.getParameter("getCompanyid");
		
		int Companyidint = Integer.parseInt(Companyid);
		ListCompanyDB ListStu = new ListCompanyDB();
		
		Company company = ListStu.Searchcompanyid(Companyidint);
		
		session.setAttribute("vCompany",company);
		
		return "ViewCompany";
	}

	@RequestMapping(value = "/loadListCompanyE" , method = RequestMethod.GET)
	public String loadListCompanyE(HttpSession session) {
		
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = ListStu.SearchcompanyALL1();
		
		session.setAttribute("ListCompany",company);
		
		return "ListCompanyE";
	}
	
	@RequestMapping(value = "/loadListCompanyEname" , method = RequestMethod.POST)
	public String loadListCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		ListCompanyDB ListStu = new ListCompanyDB();
		List<Company> company = ListStu.SearchcompanyALL1();
				
		
		String NAME = request.getParameter("NAME");
		String search = request.getParameter("search");
			
		
		if(search.equals("Company")) {
		company = ListStu.SearchcompanyALLname(NAME);
		}
		
		session.setAttribute("ListCompany",company);
		
		
		return "ListCompanyE";
	}
	
	@RequestMapping(value = "/loadAddCompanyE" , method = RequestMethod.GET)
	public String loadAddCompanyE(HttpServletRequest  request ,HttpSession session) {
		
	
		try {
		String Companyname = request.getParameter("Companyname");
		session.setAttribute("Companyname",Companyname);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "AddCompany";
	}
	
	
	@RequestMapping(value = "/AddCompanyE" , method=RequestMethod.POST)
	public String AddCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		int error = 0;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String namecom = request.getParameter("namecom");
		String address = request.getParameter("address");
		String coordinator = request.getParameter("coordinator");
		String telephone = request.getParameter("telephone");
		String metoremail = request.getParameter("metoremail");
		String website = request.getParameter("website");
		String metorfacebook = request.getParameter("metorfacebook");
		
	
		ListCompanyDB ListStu = new ListCompanyDB();
		
		int MaxCompany = ListStu.getMaxCompany();
		int Companyid = MaxCompany+1;
		
		Company com = new Company(Companyid,namecom,address,coordinator,telephone,metoremail,website,metorfacebook,0);
		
		error = ListStu.addCompany(com);
		
		if(error == 1) {
			List<Company> company = ListStu.SearchcompanyALL1();
			session.setAttribute("ListCompany",company);
			request.setAttribute("error",error);
		    return "ListCompanyE";
		}else {
			request.setAttribute("error",error);
			return "AddCompany";
		}
	}
	
	
	
	@RequestMapping(value = "/EditloadCompanyE" , method = RequestMethod.GET)
	public String EditloadCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		String IDcom = request.getParameter("getCompanyid");
		int IDcomint = Integer.parseInt(IDcom);
		
		ListCompanyDB ListStu = new ListCompanyDB();
		Company company = ListStu.Searchcompanyid(IDcomint);
		
		session.setAttribute("Company",company);
		
		return "EditCompany";
	}
	
	
	
	
	@RequestMapping(value = "/EditCompanyE" , method=RequestMethod.POST)
	public String EditCompanyE(HttpServletRequest request ,Model md , HttpSession session) {
		
		int error = 0;
		
		try {
			request.setCharacterEncoding("UTF-8");
			}catch(UnsupportedEncodingException e1) {
			e1.printStackTrace();
			}
		
		String IDcom = request.getParameter("IDcom");
		String namecom = request.getParameter("namecom");
		String address = request.getParameter("address");
		String coordinator = request.getParameter("coordinator");
		String telephone = request.getParameter("telephone");
		String metoremail = request.getParameter("metoremail");
		String website = request.getParameter("website");
		String metorfacebook = request.getParameter("metorfacebook");
		
		 int IDcomint = Integer.parseInt(IDcom);
	
		ListCompanyDB ListStu = new ListCompanyDB();
		
		
		Company com = new Company(IDcomint,namecom,address,coordinator,telephone,metoremail,website,metorfacebook,0);
		
		error = ListStu.UPDATECompany(com);
		
		
			
			Company company = ListStu.Searchcompanyid(IDcomint);
			
			session.setAttribute("Company",company);
			request.setAttribute("error",error);
			
		    return "EditCompany";
		
	}

	@RequestMapping(value = "/loadComReviewPage" , method = RequestMethod.GET)
	public String loadComReviewPage(HttpSession session) {
		
		
		return "ListCompanyReviewPage";
	}
	
	@RequestMapping(value = "/loadComReviewEPage" , method = RequestMethod.GET)
	public String loadComReviewEPage(HttpServletRequest request ,Model md , HttpSession session) {
		
        String Companyid = request.getParameter("getCompanyid");
		
		int Companyidint = Integer.parseInt(Companyid);
		ListCompanyDB ListStu = new ListCompanyDB();
		ReviewCompanyDB RC = new ReviewCompanyDB();
		
		
		Company company = ListStu.Searchcompanyid(Companyidint);
		List<Review> review = RC.reviewALL(Companyidint);
		System.out.println(review.get(0).getReviewid() +" fffffffff");
		
		session.setAttribute("vCompany",company);
		session.setAttribute("reviewList",review);
		
		
		return "ListCompanyReviewEPage";
	}

}
