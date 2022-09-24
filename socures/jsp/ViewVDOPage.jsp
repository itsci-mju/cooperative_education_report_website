<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*,java.io.File" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>



<% Student student1 = (Student)session.getAttribute("student1"); 
VDO vdo = (VDO)session.getAttribute("vdo"); 
ViewVDODB Vvdo = new ViewVDODB();
teacher teacheri = (teacher)session.getAttribute("teacher"); 
String getSemester = (String)session.getAttribute("getSemester"); 

String path = request.getSession().getServletContext().getRealPath("/") + "video//"+File.separator;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadReport</title>

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
<link rel='stylesheet' href='css/UploadReport.css' type='text/css' />


<meta property="og:url"           content="http://www.your-domain.com/your-page.html" />
<meta property="og:type"          content="website"/>
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Your description" />
<meta property="og:image"         content="http://www.your-domain.com/path/image.jpg" />

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

<h3 style="color:#7EBC1B;" >วีดีโอการฝึกปฏิบัติงานสหกิจศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadlistStuPage?getCompanyid=<%=student1.getCompany_companyid()%>&getSemester=<%=getSemester%>" style="color:#FFFFFF;">รายชื่อนักศึกษา</a> / <a class="a2" href="#" style="color:#E28A06;">วีดีโอการฝึกปฏิบัติงานสหกิจศึกษา </a></div>

</div></div></div>


<br>
</div>
<%if(vdo != null){%>
	<div class="container" style="margin-top: 35px;">
	    <section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					<div class="col-lg-12">
							<div class="container">
							<br><br>
							
                              <div align = "center">
								<video width="800"  controls>
                                <source src="./video/<%=vdo.getFilename()%>" type="video/mp4">
                                </video>
                              </div>
										
																																				
								
							    <br> <br>
								
					
												
							</div>
					</div>
					</div>
				</div>
		</section>
		
<%} %>
<!-- Load Facebook SDK for JavaScript -->

<div id="fb-root"></div>

<script>(function(d, s, id) {

var js, fjs = d.getElementsByTagName(s)[0];

if (d.getElementById(id)) return;

js = d.createElement(s); js.id = id;

js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";

fjs.parentNode.insertBefore(js, fjs);

}(document, 'script', 'facebook-jssdk'));</script>

 

<!-- Your share button code -->

<div class="fb-share-button"

data-href="<%=path%>/18_6104106304_15-09-2565-21.36.19.mp4"

data-layout="button_count">

</div>
<h5><%=path%>/18_6104106304_15-09-2565-21.36.19.mp4</h5>


	</div> 

	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>