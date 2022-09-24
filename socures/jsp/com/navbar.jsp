<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<%int Level = 0;%>
<%Student studenti = null;%>
<%teacher teacheri = null;%>
  <%try{ 
	 studenti = (Student)session.getAttribute("student"); 
	 String id = studenti.getIdstudent();
	   Level = 1;
   } catch(Exception e){
	   try{ 
	   teacheri = (teacher)session.getAttribute("teacher"); 
	   Level = Integer.parseInt(teacheri.getTeachertype());
	   } catch(Exception t){
		   Level = 0;
	   }
   }%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
	function LineAuth() {
		var URL = 'https://notify-bot.line.me/oauth/authorize?';
		URL += 'response_type=code';
		URL += '&client_id=LI9HWJcCJ9MROcOlByMDCt';
		URL += '&redirect_uri=http://www.itsci.mju.ac.th/ScientificInstrumentService/lineRegister';
		URL += '&scope=notify';
		URL += '&state=true';

		window.open(URL);
	}
	
	
</script>
<style type="text/css">

a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease; 
	}
    a:hover {
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; /* IE 8 */
        filter: alpha(opacity=50); /* IE7 */
        opacity: 0.6;
        text-decoration: none;
    }
    
</style>
<body>

	

		<header>
			<div class="navbar navbar-default navbar-static-top" style="background-color: #FCFAF1;">
				<div class="container">
					<div class="navbar-header" >
						<a class="navbar-brand" href="${pageContext.request.contextPath}/loadhome"> <img
							src="./images/nn1.png" class="hidden-xs" alt="" width=""
							height="100" style="margin-left: -30px;">
						</a>

					</div>
					
					<div class="widget hidden-xs hidden-sm"
						style="margin-right: -40px;">
						<div class="pull-right top1">
						
						<%if(Level == 0) {%>	
							<span style="color: forestgreen;"> <a href="${pageContext.request.contextPath}/loadlogin"
								class=" btn btn-success"> <i class="fa fa-sign-in">&nbsp;เข้าสู่ระบบ
								</i>
							</a>
							</span>
                        <%} %>
                       <%if(Level == 1) {%> 
							<span style="color: green;"> <i class="fa fa-user"></i>
								ผู้ใช้งานระบบ :  <%=studenti.getStudentname()%> <%=studenti.getStudentlastname()%>  
							</span> &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/loadlogout"
								class="btn btn-danger btn-xs"> <i class="fa fa-sign-out">ออกจากระบบ </i>
							</a> 
						<%}%>
						 <%if(Level == 2 || Level == 3) {%> 
							<span style="color: green;"> <i class="fa fa-user"></i>
								ผู้ใช้งานระบบ :  <%=teacheri.getTeachername()%> <%=teacheri.getTeacherlastname() %>  
							</span> &nbsp;&nbsp; <a href="${pageContext.request.contextPath}/loadlogout"
								class="btn btn-danger btn-xs"> <i class="fa fa-sign-out">ออกจากระบบ </i>
							</a> 
						<%}%>												
						</div>
					</div>
					
				</div>
			</div>			
		</header>

		
		<div style="width: 100%; background-color: #990000;">
			<nav class="navbar navbar-expand-sm navbar-dark container">

				<ul class="nav navbar-nav pull-center">
					<li class="nav-item  active "><a href="${pageContext.request.contextPath}/loadhome"
						class="nav-link ">หน้าหลัก </a></li>
						
				<%if(Level == 1) {%>		
				    <li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadViewStudentProfile" class="nav-link">แก้ไขข้อมูลสหกิจศึกษา </a></li>
						
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadnotifyPage" class="nav-link"> ส่งเอกสาร </a></li>
						
					<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadReviewCompanyPage" class="nav-link"> รีวิวผลการฝึกสหกิจศึกษา  </a></li>
												
				<%}else if(Level == 2 || Level == 3){%>
				    <li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadViewTeacherProfile" class="nav-link"> แก้ไขข้อมูลส่วนตัว </a></li>		
						
				    <li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadlistcomPage" class="nav-link"> ประเมินให้คะแนนเอกสารสหกิจ </a></li>		
						
						<%if(Level == 3){ %>
						<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/loadListTeacherPage" class="nav-link">จัดการข้อมูลอาจารย์ </a></li>
						
						 <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> จัดการข้อมูลสหกิจศึกษา </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item " href="${pageContext.request.contextPath}/loadListCompanyE">จัดการข้อมูลบริษัท</a>
							<a class="dropdown-item " href="${pageContext.request.contextPath}/loadAddStudentPage">เพิ่มข้อมูลนักศึกษา </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/loadlistStuEPage ">จัดการข้อมูลนักศึกษา</a>
						</div></li>
						
			
									
											
						
						<li class="nav-item  active"><a
						href="${pageContext.request.contextPath}/ViewSummaryReportPage" class="nav-link">สรุปคะแนนนักศึกษา </a></li>
												
						<%} %>	
				<%} %>
				</ul>
				<div class="navbar-nav ml-auto">
					<div class="hidden-lg hidden-md hidden-sm">
						<div style="height: 40px; line-height: 40px; text-align: left">
							<!-- <span style="color: #000;">
					<i class="fa fa-bell"></i>
					</span>	 -->
						</div>
					</div>
				</div>
			</nav>
	
	


	</div>

</body>

</html>