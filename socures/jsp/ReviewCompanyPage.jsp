<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*, util.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    EditStudentProfileDB SM = new EditStudentProfileDB();
    ReviewCompanyDB RVC = new ReviewCompanyDB();
	Student student = (Student) session.getAttribute("student");
	Review review = null;
	try{
	review = RVC.Searchreviewid(student.getIdstudent());
	}catch(Exception e) {
	review = null;
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewCompany</title>
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
<link rel='stylesheet' href='css/UploadReport.css' type='text/css'/>



<style type="text/css">
.file-upload {
  background-color: #FCFAF1;
  width: 25%;
  margin: 0 auto;
  padding: 20px;
  float: left;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #1FB264;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  border: 4px dashed #E58808;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  color: #15824B;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

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
					<div class="col-xs-12 col-md-12" style="background-image:url('./images/student.png'); background-position:right; background-repeat:no-repeat">

<h3 style="color:#7EBC1B;" >ระบบประเมินความพึงพอใจที่มีต่อบริษัท</h3>
<div class="nav1" style="color:#FFFFFF;"><a href="${pageContext.request.contextPath}/loadhome" style="color:#FFFFFF;">หน้าหลัก</a> / <a class="a2" href="#" style="color:#E28A06;">แบบประเมินความพึงพอใจที่มีต่อบริษัท </a></div>

</div></div></div>
<br>
</div>


<%if(review == null){ %>
<form method="POST" enctype="multipart/form-data"action="${pageContext.request.contextPath}/addReviewCompany">
<section id="content">
<br><br><br>
<div class="container" style="margin-top: -20px">
<div class="row">
<div class="col-lg-12">
<h3 style="color:#850000;" >แบบประเมินความพึงพอใจที่มีต่อบริษัท </h3>
<hr class="style13">
</div>
</div>

<div class="container" style="margin-top: 5px">
					<div class="row">
											
							<div class="container">	

<div class="file-upload" id="file-upload1">
  <button class="file-upload-btn" id="file-upload-btn1" type="button" onclick="$('#file-upload-input1').trigger( 'click' )">เพิ่มรูปที่ 1</button>

  <div class="image-upload-wrap" id="image-upload-wrap1">
    <input class="file-upload-input" id="file-upload-input1" name="file-upload-input1" type="file" onchange="readURL1(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text1">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content1">
    <img class="file-upload-image" id="file-upload-image1" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap1">
      <button type="button" onclick="removeUpload1()" class="remove-image" id="remove-image1">Remove <span class="image-title" id="image-title1">Uploaded Image</span></button>
    </div>
  </div>
</div>

<div class="file-upload" id="file-upload2">
  <button class="file-upload-btn" id="file-upload-btn2" type="button" onclick="$('#file-upload-input2').trigger( 'click' )">เพิ่มรูปที่ 2</button>

  <div class="image-upload-wrap" id="image-upload-wrap2">
    <input class="file-upload-input" id="file-upload-input2" name="file-upload-input2" type="file" onchange="readURL2(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text2">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content2">
    <img class="file-upload-image" id="file-upload-image2" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap2">
      <button type="button" onclick="removeUpload2()" class="remove-image" id="remove-image2">Remove <span class="image-title" id="image-title2">Uploaded Image</span></button>
    </div>
  </div>
</div>

<div class="file-upload" id="file-upload3">
  <button class="file-upload-btn" id="file-upload-btn3" type="button" onclick="$('#file-upload-input3').trigger( 'click' )">เพิ่มรูปที่ 3</button>

  <div class="image-upload-wrap" id="image-upload-wrap3">
    <input class="file-upload-input" id="file-upload-input3" name="file-upload-input3" type="file" onchange="readURL3(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text3">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content3">
    <img class="file-upload-image" id="file-upload-image3" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap3">
      <button type="button" onclick="removeUpload3()" class="remove-image" id="remove-image3">Remove <span class="image-title" id="image-title3">Uploaded Image</span></button>
    </div>
  </div>
</div>


<div class="file-upload" id="file-upload4">
  <button class="file-upload-btn" id="file-upload-btn4" type="button" onclick="$('#file-upload-input4').trigger( 'click' )">เพิ่มรูปที่ 4</button>

  <div class="image-upload-wrap" id="image-upload-wrap4">
    <input class="file-upload-input" id="file-upload-input4" name="file-upload-input4" type="file" onchange="readURL4(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text4">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content4">
    <img class="file-upload-image" id="file-upload-image4" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap4">
      <button type="button" onclick="removeUpload4()" class="remove-image" id="remove-image4">Remove <span class="image-title" id="image-title4">Uploaded Image</span></button>
    </div>
  </div>
</div>

</div>
</div>
</div>
</div>
</section>


<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>	
<script>
function readURL1(input1) {
	  if (input1.files && input1.files[0]) {

	    var reader1 = new FileReader();

	    reader1.onload = function(e) {
	      $('#image-upload-wrap1').hide();

	      $('#file-upload-image1').attr('src', e.target.result);
	      $('#file-upload-content1').show();

	      $('#image-title1').html(input1.files[0].name);
	    };

	    reader1.readAsDataURL(input1.files[0]);

	  } else {
	    removeUpload1();
	  }
	}

	function removeUpload1() {
	  $('#file-upload-input1').replaceWith($('#file-upload-input1').clone());
	  $('#file-upload-content1').hide();
	  $('#image-upload-wrap1').show();
	}
	$('#image-upload-wrap1').bind('dragover', function () {
			$('#image-upload-wrap1').addClass('image-dropping');
		});
		$('#image-upload-wrap1').bind('dragleave', function () {
			$('#image-upload-wrap1').removeClass('image-dropping');
	});

	function readURL2(input2) {
	  if (input2.files && input2.files[0]) {

	    var reader2 = new FileReader();

	    reader2.onload = function(e) {
	      $('#image-upload-wrap2').hide();

	      $('#file-upload-image2').attr('src', e.target.result);
	      $('#file-upload-content2').show();

	      $('#image-title2').html(input2.files[0].name);
	    };

	    reader2.readAsDataURL(input2.files[0]);

	  } else {
	    removeUpload2();
	  }
	}

	function removeUpload2() {
	  $('#file-upload-input2').replaceWith($('#file-upload-input2').clone());
	  $('#file-upload-content2').hide();
	  $('#image-upload-wrap2').show();
	}
	$('#image-upload-wrap2').bind('dragover', function () {
			$('#image-upload-wrap2').addClass('image-dropping');
		});
		$('#image-upload-wrap2').bind('dragleave', function () {
			$('#image-upload-wrap2').removeClass('image-dropping');
	});


	function readURL3(input3) {
	  if (input3.files && input3.files[0]) {

	    var reader3 = new FileReader();

	    reader3.onload = function(e) {
	      $('#image-upload-wrap3').hide();

	      $('#file-upload-image3').attr('src', e.target.result);
	      $('#file-upload-content3').show();

	      $('#image-title3').html(input3.files[0].name);
	    };

	    reader3.readAsDataURL(input3.files[0]);

	  } else {
	    removeUpload3();
	  }
	}

	function removeUpload3() {
	  $('#file-upload-input3').replaceWith($('#file-upload-input3').clone());
	  $('#file-upload-content3').hide();
	  $('#image-upload-wrap3').show();
	}
	$('#image-upload-wrap3').bind('dragover', function () {
			$('#image-upload-wrap3').addClass('image-dropping');
		});
		$('#image-upload-wrap3').bind('dragleave', function () {
			$('#image-upload-wrap3').removeClass('image-dropping');
	});


	function readURL4(input4) {
	  if (input4.files && input4.files[0]) {

	    var reader4 = new FileReader();

	    reader4.onload = function(e) {
	      $('#image-upload-wrap4').hide();

	      $('#file-upload-image4').attr('src', e.target.result);
	      $('#file-upload-content4').show();

	      $('#image-title4').html(input4.files[0].name);
	    };

	    reader4.readAsDataURL(input4.files[0]);

	  } else {
	    removeUpload4();
	  }
	}

	function removeUpload4() {
	  $('#file-upload-input4').replaceWith($('#file-upload-input4').clone());
	  $('#file-upload-content4').hide();
	  $('#image-upload-wrap4').show();
	}
	$('#image-upload-wrap4').bind('dragover', function () {
			$('#image-upload-wrap4').addClass('image-dropping');
		});
		$('#image-upload-wrap4').bind('dragleave', function () {
			$('#image-upload-wrap4').removeClass('image-dropping');
	});

</script>
<br><br><br>
<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">
	      <h5 style="color:#850000;" >ข้อมูลรีวิว </h5>
	      <hr class="style13">
				                <br>
				                <div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">คะแนนความพึงพอใจ </label>
									<div class="col-sm-4">
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2"/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>
									</div>	
													
								   </div>
								
								<div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">ความพึงพอใจของคุณที่มีต่อบริษัท </label>
									<div class="col-sm-4">
										<textarea id="textReview" name="textReview" rows="4" cols="50"></textarea>
									</div>	
													
								</div>
								
								<br><br>
									<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" class="btn btn-success">
												บันทึกการรีวิว </button></a>
										<button type="reset" class="btn btn-warning">ยกเลิก</button>
									</div>
								</div>
</div>
</div>
</div>
</div>
</section>
</form>
<%}else{ %>
<%
String imgStr = review.getReviewpicture(); 
String[] arr = imgStr.split(",");
%>

<form method="POST" enctype="multipart/form-data"action="${pageContext.request.contextPath}/EditReviewCompany">
<section id="content">
<br><br><br>
<div class="container" style="margin-top: -20px">
<div class="row">
<div class="col-lg-12">
<h3 style="color:#850000;" >แก้ไขแบบประเมินความพึงพอใจที่มีต่อบริษัท </h3>
<hr class="style13">
</div>
</div>

<div class="container" style="margin-top: 5px">
					<div class="row">
											
							<div class="container">	

<div class="file-upload" id="file-upload1">
<img src="./images/<%=arr[0]%>" alt="Girl in a jacket" width="230" height="150">
  <button class="file-upload-btn" id="file-upload-btn1" type="button" onclick="$('#file-upload-input1').trigger( 'click' )">เพิ่มรูปที่ 1</button>

  <div class="image-upload-wrap" id="image-upload-wrap1">
    <input class="file-upload-input" id="file-upload-input1" name="file-upload-input1" type="file" onchange="readURL1(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text1">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content1">
    <img class="file-upload-image" id="file-upload-image1" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap1">
      <button type="button" onclick="removeUpload1()" class="remove-image" id="remove-image1">Remove <span class="image-title" id="image-title1">Uploaded Image</span></button>
    </div>
  </div>
</div>

<div class="file-upload" id="file-upload2">
<img src="./images/<%=arr[1]%>" alt="Girl in a jacket" width="230" height="150">
  <button class="file-upload-btn" id="file-upload-btn2" type="button" onclick="$('#file-upload-input2').trigger( 'click' )">เพิ่มรูปที่ 2</button>

  <div class="image-upload-wrap" id="image-upload-wrap2">
    <input class="file-upload-input" id="file-upload-input2" name="file-upload-input2" type="file" onchange="readURL2(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text2">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content2">
    <img class="file-upload-image" id="file-upload-image2" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap2">
      <button type="button" onclick="removeUpload2()" class="remove-image" id="remove-image2">Remove <span class="image-title" id="image-title2">Uploaded Image</span></button>
    </div>
  </div>
</div>

<div class="file-upload" id="file-upload3">
<img src="./images/<%=arr[2]%>" alt="Girl in a jacket" width="230" height="150">
  <button class="file-upload-btn" id="file-upload-btn3" type="button" onclick="$('#file-upload-input3').trigger( 'click' )">เพิ่มรูปที่ 3</button>

  <div class="image-upload-wrap" id="image-upload-wrap3">
    <input class="file-upload-input" id="file-upload-input3" name="file-upload-input3" type="file" onchange="readURL3(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text3">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content3">
    <img class="file-upload-image" id="file-upload-image3" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap3">
      <button type="button" onclick="removeUpload3()" class="remove-image" id="remove-image3">Remove <span class="image-title" id="image-title3">Uploaded Image</span></button>
    </div>
  </div>
</div>


<div class="file-upload" id="file-upload4">
<img src="./images/<%=arr[3]%>" alt="Girl in a jacket" width="230" height="150">
  <button class="file-upload-btn" id="file-upload-btn4" type="button" onclick="$('#file-upload-input4').trigger( 'click' )">เพิ่มรูปที่ 4</button>

  <div class="image-upload-wrap" id="image-upload-wrap4">
    <input class="file-upload-input" id="file-upload-input4" name="file-upload-input4" type="file" onchange="readURL4(this);" accept=".png, .jpg, .jpeg" />
    <div class="drag-text" id="drag-text4">
      <h3> เลือกไฟล์หรือลากและวางที่นี่ </h3>
    </div>
  </div>
  <div class="file-upload-content" id="file-upload-content4">
    <img class="file-upload-image" id="file-upload-image4" src="#" alt="your image" />
    <div class="image-title-wrap" id="image-title-wrap4">
      <button type="button" onclick="removeUpload4()" class="remove-image" id="remove-image4">Remove <span class="image-title" id="image-title4">Uploaded Image</span></button>
    </div>
  </div>
</div>

</div>
</div>
</div>
</div>
</section>


<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>	
<script>
function readURL1(input1) {
	  if (input1.files && input1.files[0]) {

	    var reader1 = new FileReader();

	    reader1.onload = function(e) {
	      $('#image-upload-wrap1').hide();

	      $('#file-upload-image1').attr('src', e.target.result);
	      $('#file-upload-content1').show();

	      $('#image-title1').html(input1.files[0].name);
	    };

	    reader1.readAsDataURL(input1.files[0]);

	  } else {
	    removeUpload1();
	  }
	}

	function removeUpload1() {
	  $('#file-upload-input1').replaceWith($('#file-upload-input1').clone());
	  $('#file-upload-content1').hide();
	  $('#image-upload-wrap1').show();
	}
	$('#image-upload-wrap1').bind('dragover', function () {
			$('#image-upload-wrap1').addClass('image-dropping');
		});
		$('#image-upload-wrap1').bind('dragleave', function () {
			$('#image-upload-wrap1').removeClass('image-dropping');
	});

	function readURL2(input2) {
	  if (input2.files && input2.files[0]) {

	    var reader2 = new FileReader();

	    reader2.onload = function(e) {
	      $('#image-upload-wrap2').hide();

	      $('#file-upload-image2').attr('src', e.target.result);
	      $('#file-upload-content2').show();

	      $('#image-title2').html(input2.files[0].name);
	    };

	    reader2.readAsDataURL(input2.files[0]);

	  } else {
	    removeUpload2();
	  }
	}

	function removeUpload2() {
	  $('#file-upload-input2').replaceWith($('#file-upload-input2').clone());
	  $('#file-upload-content2').hide();
	  $('#image-upload-wrap2').show();
	}
	$('#image-upload-wrap2').bind('dragover', function () {
			$('#image-upload-wrap2').addClass('image-dropping');
		});
		$('#image-upload-wrap2').bind('dragleave', function () {
			$('#image-upload-wrap2').removeClass('image-dropping');
	});


	function readURL3(input3) {
	  if (input3.files && input3.files[0]) {

	    var reader3 = new FileReader();

	    reader3.onload = function(e) {
	      $('#image-upload-wrap3').hide();

	      $('#file-upload-image3').attr('src', e.target.result);
	      $('#file-upload-content3').show();

	      $('#image-title3').html(input3.files[0].name);
	    };

	    reader3.readAsDataURL(input3.files[0]);

	  } else {
	    removeUpload3();
	  }
	}

	function removeUpload3() {
	  $('#file-upload-input3').replaceWith($('#file-upload-input3').clone());
	  $('#file-upload-content3').hide();
	  $('#image-upload-wrap3').show();
	}
	$('#image-upload-wrap3').bind('dragover', function () {
			$('#image-upload-wrap3').addClass('image-dropping');
		});
		$('#image-upload-wrap3').bind('dragleave', function () {
			$('#image-upload-wrap3').removeClass('image-dropping');
	});


	function readURL4(input4) {
	  if (input4.files && input4.files[0]) {

	    var reader4 = new FileReader();

	    reader4.onload = function(e) {
	      $('#image-upload-wrap4').hide();

	      $('#file-upload-image4').attr('src', e.target.result);
	      $('#file-upload-content4').show();

	      $('#image-title4').html(input4.files[0].name);
	    };

	    reader4.readAsDataURL(input4.files[0]);

	  } else {
	    removeUpload4();
	  }
	}

	function removeUpload4() {
	  $('#file-upload-input4').replaceWith($('#file-upload-input4').clone());
	  $('#file-upload-content4').hide();
	  $('#image-upload-wrap4').show();
	}
	$('#image-upload-wrap4').bind('dragover', function () {
			$('#image-upload-wrap4').addClass('image-dropping');
		});
		$('#image-upload-wrap4').bind('dragleave', function () {
			$('#image-upload-wrap4').removeClass('image-dropping');
	});

</script>
<br><br><br>
<section id="content">
				<div class="container" style="margin-top: -20px">
					<div class="row">
					
						<div class="col-lg-12">
							<div class="container">
	      <h5 style="color:#850000;" >ข้อมูลรีวิว </h5>
	      <hr class="style13">
				                <br>
				                <div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">คะแนนความพึงพอใจ </label>
									<div class="col-sm-4">							
<fieldset class="rating">
   <%if(review.getReviewrating()==5){ %>
    <input type="radio" id="star5" name="rating" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <%}else{ %>
     <input type="radio" id="star5" name="rating" value="5"/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <%} %>
    
     <%if(review.getReviewrating()==4.5){ %>
    <input type="radio" id="star4half" name="rating" value="4.5" checked/><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
     <%}else{ %>
      <input type="radio" id="star4half" name="rating" value="4.5"/><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
      <%} %>
      
     <%if(review.getReviewrating()== 4){ %>
    <input type="radio" id="star4" name="rating" value="4" checked/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <%}else{ %>
     <input type="radio" id="star4" name="rating" value="4"/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
     <%} %>
     
     <%if(review.getReviewrating()== 3.5){ %>
    <input type="radio" id="star3half" name="rating" value="3.5" checked/><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <%}else{ %>
     <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <%} %>
    
    <%if(review.getReviewrating()== 3){ %>
    <input type="radio" id="star3" name="rating" value="3" checked/><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <%}else{ %>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <%} %>
    
    <%if(review.getReviewrating()== 2.5){ %> 
    <input type="radio" id="star2half" name="rating" value="2.5" checked/><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
     <%}else{ %>
     <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
     <%} %>
     
     <%if(review.getReviewrating()== 2){ %> 
    <input type="radio" id="star2" name="rating" value="2" checked/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
     <%}else{ %>
     <input type="radio" id="star2" name="rating" value="2"/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
     <%} %>
     
     <%if(review.getReviewrating()== 1.5){ %> 
    <input type="radio" id="star1half" name="rating" value="1.5" checked/><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <%}else{ %>
    <input type="radio" id="star1half" name="rating" value="1.5"/><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
     <%} %>
     
     <%if(review.getReviewrating()== 1){ %> 
    <input type="radio" id="star1" name="rating" value="1" checked/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <%}else{ %>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
   <%} %> 
    
    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>
									</div>	
													
								   </div>
								
								<div class="form-group row">
								<label class="col-sm-2 col-form-label text-right">ความพึงพอใจของคุณที่มีต่อบริษัท </label>
									<div class="col-sm-4">
										<textarea id="textReview" name="textReview" rows="4" cols="50"><%=review.getReviewdetails() %></textarea>
									</div>	
													
								</div>
								
								<br><br>
									<div class="form-group row">
									<div class="col-sm-12 text-center">
										<a href="#"><button type="submit" class="btn btn-success">
												บันทึกการรีวิว </button></a>
										<button type="reset" class="btn btn-warning">ยกเลิก</button>
									</div>
								</div>
</div>
</div>
</div>
</div>
</section>
</form>

<%}%>
<br>
	<jsp:include page="com/footer.jsp"></jsp:include>
</body>
</html>