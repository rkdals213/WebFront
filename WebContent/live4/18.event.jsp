<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>event</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="13.bs4.css" />
</head>
<body>
	<div class="container">
		<%@ include file="13.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>jQuery Event</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 350px;">
				<div class="card-body">

<!-- here start -->
<script>
$(document).ready(function() {
	$(".onlyEngNumEmail").change(function(){
		//alert($(this).val());
		var engStd = /^[0-9a-zA-Z@.]+$/;
		if($(this).val().match(engStd)){
			$("label[for=id]").text("ID:");
			$("label[for=id]").addClass("text-body");
		}else{
			$("label[for=id]").text("ID: 영문과 숫자만 입력 가능합니다.");
			$("label[for=id]").css("color","red");
			//$(this).val("");
			$(this).focus();
			return;
		}
	});//change
	$("#pwd_confirm").blur(function(){
		if($("#pwd_confirm").val().match($("#pwd").val())){
			$("label[for=pwd_confirm]").text("Password Confirm:");
			$("label[for=pwd_confirm]").addClass("text-body");
		}else{
			$("label[for=pwd_confirm]").text("Password Confirm: 패스워드를 확인해 주세요.");
			$("label[for=pwd_confirm]").css("color","red");
			return;
		}
	});//blur
	$("#key_test").keydown(function(event){
		//alert(event.which);
		if(event.which == 13){
			$("input[type=button]").click();
		}
	});//blur
	$("input[type=button]").click(function() {
		alert("input type=button clicked !!!");
	});//click
});//ready
</script>
<form action="">
	<div class="form-group">
		<label for="id">ID:</label>
		<input type="text" class="form-control onlyEngNumEmail" placeholder="Enter id" id="id">
	</div>
	<div class="form-group">
		<label for="pwd">Password:</label>
		<input type="text" class="form-control" placeholder="Enter password" id="pwd">
	</div>
	<div class="form-group">
		<label for="pwd_confirm">Password Confirm:</label>
		<input type="text" class="form-control" placeholder="Enter password" id="pwd_confirm">
	</div>
	<div class="form-group">
		<label for="key_test">Key Event Test:</label>
		<input type="text" class="form-control" placeholder="Enter Here !!!" id="key_test">
	</div>
	<input type="button" class="btn btn-primary" value="Submit">
</form> 
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
