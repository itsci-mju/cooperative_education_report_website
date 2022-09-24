<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

 <%EditStudentProfileDB SM = new EditStudentProfileDB(); %>
 <%teacherManager TM = new teacherManager(); %>
 
<%Student student = (Student)session.getAttribute("student");%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
}
</style>

<meta charset="UTF-8">
<title>Edit Student Profile</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kanit'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/student.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ข้อมูลสหกิจศึกษา</h3>
<div class="nav1" style="color:#FFFFFF;"><a href="#" style="color:#E28A06;">ดูข้อมูลสหกิจศึกษา </a> </div>

</div></div></div>
<br>
</div>

	<div class="container" style="margin-top: 35px;">
<br><br>

			<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">						
								                        
								<h5 style="color:#850000;"> ข้อมูลของนักศึกษา</h5>
								<hr class="style13">
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right" > รหัสนักศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="studentid" name="studentid"
											class="form-control data" value="<%=student.getIdstudent()%>" readonly>
									</div>
									
								</div>
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อนักศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="studentname" name="studentname"
											class="form-control data" value="<%=student.getStudentname()%>" readonly>
									</div>	
									
									<label class="col-sm-2 col-form-label text-right">นามสกุล</label>
									<div class="col-sm-4">
										<input type="text" name="studentlastname" id="studentlastname"
											class="form-control data" value="<%=student.getStudentlastname()%>" readonly>
									</div>					
								</div>
                                <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">รหัสผ่าน</label>
									<div class="col-sm-4">
										<input type="password" id="password" name="password"
											class="form-control data" placeholder="รหัสผ่าน" value="<%=student.getPassword()%>" readonly>
									</div>						
								</div>
								
								

								<br>
								<hr class="style13">
								<h5 style="color:#850000">ข้อมูลสหกิจศึกษา</h5>
                                  <%Company COname = SM.Searchcompanyid(student.getCompany_companyid()); %>
								  <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ชื่อบริษัท</label>
									<div class="col-sm-4">
										<input type="text" id="Company" name="Company"
											class="form-control data" value="<%=COname.getCompanyname()%>" readonly>
									</div>						
								</div>
							
                               <div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">ตำแหน่งงาน</label>
									<div class="col-sm-4">
										<input type="text" id="Company" name="Company"
											class="form-control data" value="<%=student.getWorkposition()%>" readonly>
									</div>		
												
								</div>
								
								<% Date dt = new Date(student.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								c.setTime(dt); 
								dt = c.getTime();
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									<% Date dt2 = new Date(student.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<div class="form-group row">
									<label class="col-sm-2 col-form-label text-right">เวลาเริ่มสหกิจศึกษา</label>
									<div class="col-sm-4">
										<input type="text" id="mentornickname" name="mentornickname"
											class="form-control data" value="<%=date%>" readonly>
									</div>	
									
									
									<label class="col-sm-2 col-form-label text-right">เวลาสิ้นสุด</label>
									<div class="col-sm-4">
										<input type="text" name="lastname" id="lastname"
											class="form-control data" value="<%=date2%>" readonly>
									</div>					
								</div>
								<br>							 								
								<hr class="style13">
					          <h5 style="color:#850000">ข้อมูลพนักงานพี่เลี้ยง</h5>
                 <br> 
                      
				<div id="tableSericeRequestForm">
                <table class="table table-bordered" id="myTable">
                    <thead class="table-info">
                        <tr>
                            <th>ชื่อพนักงานพี่เลี้ยง</th>
                            <th>นามสกุลพนักงานพี่เลี้ยง</th>
                            <th>ชื่อเล่นพนักงานพี่เลี้ยง</th>
                            <th>อีเมล</th>
                            <th>เบอร์โทรศัพท์</th>
                          
                        </tr> 
                    </thead>   
                    <tbody>
                    <%ListmentorDB   HM = new ListmentorDB();
            		List<Mentor> st = HM.AllListmentor(student.getIdstudent()); %>
            		<%if(st.size() != 0){ %>
                    <%for(Mentor MM : st){ %>
                        <tr>
                            <td><%=MM.getMentorname()%></td>
                            <td><%=MM.getMentorlastname()%></td>
                            <td><%=MM.getMentornickname()%></td>
                            <td><%=MM.getMetoremail()%></td>
                            <td><%=MM.getPhonenumber()%></td>    
                          
                        </tr>                    
                    <%} %>
                 <%}else{ %>
                 <tr>
                    	 <td colspan = "5" align="center"><h5 style="color:#850000"> <i class="fa fa-ban"></i> ไม่มีข้อมูลพนักงานพี่เลี้ยง </h5></td>
                </tr>
                    <%} %>
                    </tbody>    
                    
                              
                </table>
				</div>	
				<br><br>
			
					<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="${pageContext.request.contextPath}/loadEditStudentProfile"><button class="btn btn-success">
												แก้ไขข้อมูล</button></a>
									
									</div>
								</div>
								
							</div>
						</div>					
					</div>
				</div>				
			</section>    		     			      
	</div>


	             <jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>