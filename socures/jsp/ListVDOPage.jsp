<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
ViewVDODB vdo = new ViewVDODB(); 
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
<link rel="stylesheet" href="./css/VReport.css">

	
<style type="text/css">


	</style>


</head>




<body>
	<jsp:include page="com/navbar.jsp"></jsp:include>
	
	<div style="background-color:#2B2C2F;">
<br>
<div class="container">
				<div class="row no-gutter">
					<div class="col-xs-12 col-md-12" >

<h3 style="color:#7EBC1B;" > วีดีโอผลการปฏิบัติงานสหกิจศึกษา </h3>
<div class="nav1" style="color:#FFFFFF;"><a class="a2" href="#" style="color:#E28A06;">วีดีโอผลการปฏิบัติงานสหกิจศึกษา </a></div>

</div></div></div>
<br>
</div>

	
<br><br><br><br>

<section class="section " id="blog" style="margin-top: -60px; " >
<div class="main">
  <h2 class="text-header text-center"> วีดีโอผลการปฏิบัติงานสหกิจศึกษา  </h2>
			<hr class="colorgraph">
  <ul class="cards">
  
  <%List<VDO> Listvdo = vdo.AllListStuvdoDESC1(); %>
  <%for(int i= 0; i<Listvdo.size() ; i++){ %>
    <li class="cards_item">
      <div class="card">
      
      <% String[] arr = Listvdo.get(i).getFilename().split("src="); %>
	  <% String[] arr1 = arr[1].split("title="); %>
        <div class="card_image">
       <iframe width="350" height="300" src=<%=arr1[0]%> title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
       
      </div>
    </li>
<%}%>
  </ul>
  <br>
</div>
</section>

  <jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>

