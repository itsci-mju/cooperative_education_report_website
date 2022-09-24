<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.*, util.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%ReviewCompanyDB RVC = new ReviewCompanyDB(); %>

<!DOCTYPE html>
<html>
<head>
<title>เว็บไซต์รายงานสหกิจศึกษา </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logosci.png" rel="icon">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href='https://fonts.googleapis.com/css?family=Kanit'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./css/web_css.css">

<script src="https://kit.fontawesome.com/e18a64822c.js"></script>

<style type="text/css">

.zoom {
	padding: 50px;
	background-color: green;
	transition: transform .2s;
	width: 200px;
	height: 200px;
	margin: 0 auto;
}

.zoom:hover {
	-ms-transform: scale(1.5); /* IE 9 */
	-webkit-transform: scale(1.5); /* Safari 3-8 */
	transform: scale(1.5);
}

.section {
	padding: 100px 0;
	position: relative;
}

.gray-bg {
	background-color: #ebf4fa;
}
/* Blog 
---------------------*/
.blog-grid {
	margin-top: 15px;
	margin-bottom: 15px;
}

.blog-grid .blog-img {
	position: relative;
	border-radius: 5px;
	overflow: hidden;
}

.blog-grid .blog-img .date {
	position: absolute;
	background: #3a3973;
	color: #ffffff;
	padding: 8px 15px;
	left: 0;
	top: 10px;
	font-size: 14px;
}

.blog-grid .blog-info {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	background: #ffffff;
	padding: 20px;
	margin: -30px 20px 0;
	position: relative;
}

.blog-grid .blog-info h5 {
	font-size: 22px;
	font-weight: 500;
	margin: 0 0 10px;
}

.blog-grid .blog-info h5 a {
	color: #3a3973;
}

.blog-grid .blog-info p {
	margin: 0;
}

.blog-grid .blog-info .btn-bar {
	margin-top: 20px;
}

.px-btn-arrow {
	padding: 0 50px 0 0;
	line-height: 20px;
	position: relative;
	display: inline-block;
	color: #fe4f6c;
	-moz-transition: ease all 0.3s;
	-o-transition: ease all 0.3s;
	-webkit-transition: ease all 0.3s;
	transition: ease all 0.3s;
}

.px-btn-arrow .arrow {
	width: 13px;
	height: 2px;
	background: currentColor;
	display: inline-block;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	right: 25px;
	-moz-transition: ease right 0.3s;
	-o-transition: ease right 0.3s;
	-webkit-transition: ease right 0.3s;
	transition: ease right 0.3s;
}

.px-btn-arrow .arrow:after {
	width: 8px;
	height: 8px;
	border-right: 2px solid currentColor;
	border-top: 2px solid currentColor;
	content: "";
	position: absolute;
	top: -3px;
	right: 0;
	display: inline-block;
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}





.cta-100 {
  margin-top: 100px;
  padding-left: 8%;
  padding-top: 7%;
}
.col-md-4{
    padding-bottom:20px;
}

.white {
  color: #fff !important;
}
.mt{float: left;margin-top: -20px;padding-top: 20px;}
.bg-blue-ui {
  background-color: #708198 !important;
}
figure img{width:300px;}

#blogCarousel {
  padding-bottom: 100px;
}

.blog .carousel-indicators {
  left: 0;
  top: -50px;
  height: 50%;
}

#Button4
{
   box-sizing: border-box;
   line-height: 21px;
   text-decoration: none;
   vertical-align: top;
   border: 2px solid #00A65A;
   border-radius: 3px;
   background-color: #FFFFFF;
   background-image: none;
   color: #00A65A;
   font-family: Arial;
   font-weight: normal;
   font-style: normal;
   font-size: 13px;
   padding: 0;
   text-align: center;
   -webkit-appearance: none;
   margin: 15px 0px 10px 10px;
}


</style>





<body>

	<jsp:include page="com/navbar.jsp"></jsp:include>


	<div style="margin-top: 0px;">
	
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  </ol>
 <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="./images/banner0.png" alt="First slide" width = "100%" height ="425 px" >
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="./images/banner4.png" alt="Second slide" width = "100%" height ="425 px">
    </div>
 
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	
	</div>

         <%List<Company> listCOM = RVC.companyALLDESC(); %>

				<section class="section " id="blog" style="margin-top: -60px; " >
		<div class="container" style="background-image:url('./img/line_bg.gif')">
			<h2 class="text-header text-center"> บริษัทฝึกสหกิจ </h2>
			<hr class="colorgraph">
			<%
				String date = "";
			%>
			<%
			if( listCOM.size() > 0){
				for (int i = 0; i < listCOM.size(); i++) {
					String img = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr = img.split(","); 
			%>
			<div class="row">

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img">
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./images/<%=arr[0]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div  style="height:  150px;" align = "center">
							<b style="word-wrap: break-word;">
							 <a href="#" tabindex="0">
                                <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>
                              </a>
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
						</div>
						
							
						
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

				<%
					i++;
				if (i < listCOM.size()) {
					String img1 = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr1 = img1.split(","); 
				%>

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img">
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./images/<%=arr1[0]%>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div style="height:  150px;" align = "center">
							<b style="word-wrap: break-word;">
							 <a href="#" tabindex="0">
                                <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>
                              </a>
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
							
						</div>
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>

				<%
					i++;
				if (i < listCOM.size()) {
					String img2 = RVC.getscorING(listCOM.get(i).getCompanyid());
			        String[] arr2 = img2.split(","); 
				%>

				<div class="col-lg-4">
					<div class="blog-grid">
						<div class="blog-img">
							<div class="date">
								<i class="fa-sharp fa-solid fa-star"></i> <%=listCOM.get(i).getAverage() %>
							</div>

							<img src="./images/<%=arr2[0] %>"
								width="350" height="280"
								style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; object-fit: cover; object-position: 100% 0;"
								title="" alt="">

						</div>
						<div class="blog-info">
						<div style="height:  150px;" align = "center">
							<b style="word-wrap: break-word;">
							 <a href="#" tabindex="0">
                                <h5> บริษัท <%=listCOM.get(i).getCompanyname()%> </h5>
                              </a>
							</b>
							
							 <b style="word-wrap: break-word; ">
							 <%if(listCOM.get(i).getAverage() == 5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
                              
							 <%}else if(listCOM.get(i).getAverage()>= 4.5){ %>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 4){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 3){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2.5){%>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							 <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							 <%}else if(listCOM.get(i).getAverage()>= 2){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <%}else if(listCOM.get(i).getAverage()>= 1.5){%>
							  <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							  <i style="color:#FF567D;" class="fa-solid fa-star-half"></i>
							   <%}else if(listCOM.get(i).getAverage()>= 1){%>
							   <i style="color:#FF567D;" class="fa-sharp fa-solid fa-star"></i>
							   <%}else{ %>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <i style="color:#FF567D;" class="fa-regular fa-star-sharp"></i>
							   <%} %>
						 
							</b>
							
							<br><br>
							<b style="word-wrap: break-word;">
							 <h6> <i style="color:#5392F9;" class="fa-sharp fa-solid fa-location-dot"></i> <i><%=listCOM.get(i).getCompanyaddress() %></i>  </h6>    
							</b>
							
						</div>
							<div class="btn-bar">
								<a  href="${pageContext.request.contextPath}/loadComReviewEPage?getCompanyid=<%=listCOM.get(i).getCompanyid()%>"  class="px-btn-arrow"> <span>Read More</span> <i
									class="arrow"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
				</div>
				<% 
					}
				%>

			<%
				}
			%>
			
			<br><br>
			<div align = "center">
			<a id="Button4" href="${pageContext.request.contextPath}/loadComReviewPage"  onmouseover="AnimateCss('Button4', 'animate-box-shadow', 0, 500);return false;" style="display: inline-block; width: 175px; height: 25px; z-index: 26; animation-delay: 0ms; animation-duration: 500ms; animation-fill-mode: both; animation-name: animate-box-shadow;"> Read More </a>
			</div>
		</div>
	</section>
				


	<jsp:include page="com/footer.jsp"></jsp:include>




</body>
</html>