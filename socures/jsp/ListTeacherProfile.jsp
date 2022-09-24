<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>


<%
List<teacher> Teacher = null;
try{
 Teacher = (List)session.getAttribute("teacherlist");
}
catch(Exception e) {
	Teacher = null;
	}

%>

<%int error = 0; %>

<%
try{
	error = (int)request.getAttribute("error");
}catch(Exception e) {
	error = 0;
	}
%>

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
<link rel="stylesheet" href="./css/Alert.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://kit.fontawesome.com/e18a64822c.js"></script>

</head>
<body>
<jsp:include page="com/navbar.jsp"></jsp:include>


<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/TEACHER1.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบจัดการข้อมูลอาจารย์ </h3>
<div class="nav1" style="color:#E28A06;"><a style="color:#E28A06;"> รายชื่ออาจารย์ </a> </div>

</div></div></div>
<br>
</div>

<%if(error == 1){ %>
<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong> <i class="fa-sharp fa-solid fa-circle-check"></i> เพิ่มข้อมูลสำเร็จ : </strong> บันทึกข้อมูลเรียนร้อยแล้ว  
</div>
<%} %>

	<div class="container" style="margin-top: 35px;">
<br><br>
                <div align = "right">
				<a href = "${pageContext.request.contextPath}/loadAddTeacherPage" class="btn btn-primary" ><i class="fa fa-fw -square -circle fa-plus-square" ></i> เพิ่มข้อมูลอาจารย์ </a>
				
				</div>
   <table class="table table-bordered" id="myTable">
                    <thead class="table-info">
                        <tr>
                            <th>รหัสอาจารย์</th>
                            <th>ชื่อ-นามสกุลอาจารย์</th>
                            <th>เบอร์โทรศัพท์</th>
                            <th>อีเมล</th>
                            <th>แก้ไขสถานะ</th>   
                            <th>ลบข้อมูล</th>                         
                        </tr> 
                    </thead>   
                    <tbody>
                   <%if(Teacher != null){ %>
                    <%for(teacher t : Teacher){ %>
                        <tr>
                         
                          <th><%=t.getTeacherid()%></th>
                          <th><%=t.getTeachername()%> <%=t.getTeacherlastname()%></th>
                          <th><%=t.getPhonenumber()%></th>
                          <th><%=t.getTeacheremail() %></th>
                          <%if(t.getStatus().equals("อยู่")){ %>
                          <th><a href="${pageContext.request.contextPath}/loadStatusTeacher?Teacherid=<%=t.getTeacherid()%>&getStatus=กำลังศึกษาต่อ" ><button class="btn btn-success" ><%=t.getStatus()%></button></a></th>
                           <%}else{ %>
                          <th><a href="${pageContext.request.contextPath}/loadStatusTeacher?Teacherid=<%=t.getTeacherid()%>&getStatus=อยู่" ><button class="btn btn-danger" ><%=t.getStatus()%></button></a></th> 
                           <%} %>
                         
                         <th><a href="${pageContext.request.contextPath}/loadDETeacher?Teacherid=<%=t.getTeacherid()%>" ><button class="btn btn-danger" >ลบข้อมูล </button></a></th> 
                        </tr>                    
                <%} %>
                <%}else{ %>
               
                 <tr>
                    	 <td colspan = "6" align="center"><h5 style="color:#850000"> <i class="fa fa-ban"></i> ไม่มีข้อมูลอาจารย์ </h5></td>
                </tr>
                  <%}%>
                    </tbody>    
                              
                </table>
			  			      
	</div>

<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>   
	             <jsp:include page="com/footer.jsp"></jsp:include>
	  
</body>
</html>