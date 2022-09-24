<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<Student> student = (List)session.getAttribute("StuSemester"); 
List<teacher> teacherList = (List)session.getAttribute("teacherList"); 

ListStudentDB ListStu = new ListStudentDB();
teacher Teacher = (teacher)session.getAttribute("teacher");

String getSemester = (String)session.getAttribute("getSemester");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Student</title>

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


<script src="https://kit.fontawesome.com/e18a64822c.js"></script>


<style type="text/css">
hr.style13 {
    height: 10px;
    border: 0;
    box-shadow: 0 10px 10px -10px #880000 inset;
}
	</style>


</head>
<body>
	<jsp:include page="com/navbar.jsp"></jsp:include>
	
	<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >สรุปคะแนนเอกสารสหกิจ </h3>
<div class="nav1" style="color:#E28A06;"><a href="${pageContext.request.contextPath}/loadlistcomPage" style="color:#E28A06;"> สรุปคะแนนเอกสารสหกิจ </a></div>

</div></div></div>
<br>
</div>
<!-- mobile submit -->

<br><br>

<%String Rid = ListStu.AllReportStuid(student.get(0).getIdstudent()); %>
<%List<teacher> TC = ListStu.AllReportTname(Rid);%>


	<div align = "center">
	
	<div class="col-lg-12">
	<div class="container">	
	<h3 style="color:#850000;" align = "left">  สรุปคะแนนรายงานเอกสารฉบับสมบูรณ์และวิดีโอนำเสนอ </h3>
	<hr class="style13">
	</div>
	</div>
	
	
	 <form name="frm" method="post" action="${pageContext.request.contextPath}/ViewSummaryReportPageS" >
	 <div class="form-group row" style = "margin-right:100px">
	 
									<div class="col-sm-12" align = "center">
							<label class="col-sm-2 col-form-label text-right"> ภาคการศึกษา </label>
                           <% List<String> semester =  ListStu.AllListsemester(); %>
                                       <select name="searchDate" id="searchDate" >                                                                                    
                                             <%for(int i = 0; i<semester.size(); i++){ %>   
                                                 <%if(semester.get(i).equals(getSemester)){ %>
                                                 <option selected value="<%=semester.get(i)%>"><%=semester.get(i)%></option>         
                                                 <%}else{ %> 
                                                 <option value="<%=semester.get(i)%>"><%=semester.get(i)%></option>  
                                                 <%} %>  
                                             <%} %>                                   
                                        </select>
                                      &nbsp;   <a href="#"><button type="submit" class="btn btn-success">
												<i class="fa-sharp fa-solid fa-magnifying-glass"></i> </button></a>
                                       
                           </div>
                           
                           </div>	
                 </form>          
     <table class="table table-bordered" id="myTable" style="width:40%" > 
     <thead class="table-info" align = "center">
     <tr>
      <th>  รหัสอาจารย์ </th>
      <th>  ชื่ออาจารย์ </th>
     </tr>    
     </thead>
     <tbody>
     <%for(teacher T : teacherList){ %>
     <tr>
      <th> <%=T.getTeacherid() %> </th>
      <th> <%=T.getTeachername()%> <%=T.getTeacherlastname() %></th>
     </tr>
	 <%} %>
     </tbody>
     </table>                   
      <br><br>            
               <div align = "right" style = "margin-right:45px">
				<a href = "${pageContext.request.contextPath}/ViewExportSummaryReport?getSemester=<%=getSemester%>" class="btn btn-success" ><i class="fa-solid fa-file-export"></i> เอ็นพอยท์ผลการประเมิน  </a>
				
				</div>                        					
	<table class="table table-bordered" id="myTable" style="width:95%" >
								<thead class="table-info" align = "center">
									<tr>
										<th rowspan="2"> รหัสนักศึกษา </th>
										<th rowspan="2"> ชื่อนักศึกษา </th>										
										<th rowspan="2" > ระยะเวลาการฝึก </th>		
										<th rowspan="2"> ต้องการฝึกในตำแหน่ง </th>	
										<th  colspan="<%=TC.size()+1%>"> คะแนนรายงาน (10) </th>
										<th  colspan="<%=TC.size()+1%>"> คะแนนการนำเสนอ (10) </th>	
																																				
									</tr>
									<tr>
									<%for(teacher T : TC){ %>
										<th> <%=T.getTeacherid() %> </th>
										<%} %>
									<th> คะแนนรายงานเฉลี่ย </th>
									<%for(teacher T : TC){ %>
										<th> <%=T.getTeacherid() %> </th>
										<%} %>
									<th> คะแนนนำเสนอเฉลี่ย </th>
									</tr>
								</thead>
								<tbody>
								
								<%for(Student stu : student){ %>
								<%double scoreSUM = 0; %>
								<%double scoreVDOSUM = 0; %>
                                        <tr align = "center"> 
                                        <th><%=stu.getIdstudent() %></th>   
                                        <th><%=stu.getStudentname()%> <%=stu.getStudentlastname() %></th> 
                                        
                                        
                                        <% Date dt = new Date(stu.getStartdate().getTime());
								Calendar c = Calendar.getInstance(); 
								c.setTime(dt); 
								dt = c.getTime();
								String date = new SimpleDateFormat("dd/MM/yyyy").format(dt); %>
								
									 <% Date dt2 = new Date(stu.getEnddate().getTime());
								Calendar c2 = Calendar.getInstance(); 
								c2.setTime(dt2); 
								dt2 = c2.getTime();
								String date2 = new SimpleDateFormat("dd/MM/yyyy").format(dt2); %>
								
								<th style="white-space:nowrap"><i class='fa fa-calendar'></i> วันที่ <%=date%> - <%=date2%></th>	
								
								<th><%=stu.getWorkposition() %></th>
								<%String RidSUM = ListStu.AllReportStuid(stu.getIdstudent()); %>
								
								<%for(teacher T : TC){ %>		
								<%double score = ListStu.scoreSTU(RidSUM , T.getTeacherid()); %>
								<%scoreSUM = scoreSUM+score; %>
								  <th><%=score %></th>  
								  <%} %>
								  
								  <%Double AVG = scoreSUM/TC.size();%>
								   <%Double avgscore = ( Math.floor(AVG * 100) / 100 );%>
								   <th><%=avgscore %></th>   
								   
								  <%for(teacher T : TC){ %>		
								<%double scorevdo = ListStu.scoreSTUVDO(stu.getIdstudent() , T.getTeacherid()); %>
								<%scoreVDOSUM = scoreVDOSUM+scorevdo; %>
								  <th><%=scorevdo %></th>  
								  <%} %> 
								    <%Double AVGvdo = scoreVDOSUM/TC.size();%>
								   <%Double avgscorevdo = ( Math.floor(AVGvdo * 100) / 100 );%>
								     <th><%=avgscorevdo%></th>                           
                                        </tr>
                                 <%} %>
								</tbody>
							</table>
							
								
							</form>
</div>
	
  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

