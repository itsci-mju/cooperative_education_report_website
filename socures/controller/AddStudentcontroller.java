package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import ddf.ReadWriteExcel1;
import util.EditmentorDB;
import util.ListCompanyDB;
import util.ListStudentDB;
import util.ListmentorDB;
import util.addTeacherDB;
import util.addmentorDB;
import util.teacherManager;

@Controller
public class AddStudentcontroller {

	public AddStudentcontroller() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/AddStudentPage" , method = RequestMethod.POST)
	public ModelAndView doImportExcel(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	
		ListCompanyDB LC = new ListCompanyDB();
		teacherManager TM = new teacherManager();
		ListStudentDB LSTU = new ListStudentDB();
		
		List<AddStudent> listStudent = new ArrayList<>();
		List<Student> Student = new ArrayList<>();
		String yearE = null;	 
		String inlineRadio1 = null;
		int error = 0;
		List errorlist = new ArrayList<>();
		
		Date dd = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(dd);
		c1.add(Calendar.YEAR,543);
		dd = c1.getTime();
		String dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH.mm.ss").format(dd);
		
			if (ServletFileUpload.isMultipartContent(request)) {
				request.setCharacterEncoding("UTF-8");
				try {
					List<FileItem> multiFileItem = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

	
					 yearE = new String(multiFileItem.get(0).get(),StandardCharsets.UTF_8);
					 inlineRadio1 = new String(multiFileItem.get(1).get(),StandardCharsets.UTF_8);
					System.out.println(yearE+inlineRadio1);
					
					
					String fileName = multiFileItem.get(2).getName();

					System.out.println("fileName : " + fileName);
					
					String path = request.getSession().getServletContext().getRealPath("/") + "//EX//";
					
					
					
					
					String file = path + File.separator + dateFormat + fileName;
					
					multiFileItem.get(2).write(new File(file));

					ReadWriteExcel1 readWriteExcel = new ReadWriteExcel1();
					
					System.out.println(file);
					
					try {
						readWriteExcel.xlRead(file, 0);
						// System.out.println(readWriteExcel.getxRows()); 
						String[][] data = readWriteExcel.getData();
						// System.out.println(data[0][0]); 
						for (int i = 1; i < data.length; i++) {

							String student_id = data[i][0];
							String firstname = data[i][1];
							String lastname = data[i][2];
							String workposition = data[i][3];
							String Company = data[i][4];
							String Teacher = data[i][5];
							String startdate = data[i][6];
							String enddate = data[i][7];
                            
												
							
							Date date1 =  new SimpleDateFormat("dd/MM/yyyy").parse(startdate);  
							Date date2 =  new SimpleDateFormat("dd/MM/yyyy").parse(enddate); 
							
							long ligdate1 = date1.getTime();
							long ligdate2 = date2.getTime();
							
						   java.sql.Date SQLdate1 = new java.sql.Date(ligdate1);
						   java.sql.Date SQLdate2 = new java.sql.Date(ligdate2);
							
							AddStudent ST = new AddStudent(student_id,firstname,lastname,student_id,workposition,SQLdate1,SQLdate2,Teacher,Company);
							listStudent.add(ST);													
							
						}

					} catch (Exception e) {
						e.printStackTrace();
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			for(AddStudent s : listStudent) {
				
				int COMid = 0;
				  int TSid = 0;
					try {
					COMid = LC.SearchcompanyName(s.getCompany_companyname());							
					} catch (Exception e) {
						e.printStackTrace();
						COMid = 0;
					}
					
					try {
						TSid = TM.Searchteachername(s.getTeacher_teachername());														
					} catch (Exception e) {
						e.printStackTrace();
						TSid = 0;
					}
					
					String semester = null;
					
					if(inlineRadio1.equals("V1")) {
						semester = "ภาคเรียนที่2/"+yearE;
					}else {
						semester = "ภาคเรียนที่2/"+yearE+" "+"ซัมเมอร์";
					}
					
					Student STU = new Student (s.getIdstudent(),s.getStudentname(),s.getStudentlastname(),s.getPassword(),s.getWorkposition(),s.getStartdate(),s.getEnddate(),semester,TSid,COMid);
					error = LSTU.addStudent(STU);
					if(error == -1) {
						errorlist.add(s.getIdstudent());						
					}else {
						Student.add(STU);
					}
				
			}
			if(errorlist.size() == 0) {
				errorlist.add("1");
			}
			request.setAttribute("errorlist", errorlist);
			session.setAttribute("listSTU", Student);
			ModelAndView mav = new ModelAndView("AddStudentPage");
			return mav;
		}

	
	
	@RequestMapping(value = "/loadAddStudentPage" , method = RequestMethod.GET)
	public String loadAddStudentPage() throws Exception {	
	
		return "AddStudentPage";
	}
	

}
