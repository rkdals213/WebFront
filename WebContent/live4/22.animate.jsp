<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jQuery Animate</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" type="text/css" href="13.bs4.css" />
	<script>
		//jquery datepicker
		$(function() {
			$("#cmpn_start_date").datepicker({
				changeMonth: true
				, changeYear: true
			});
			$("#cmpn_start_date").datepicker("option", "dateFormat", "yy-mm-dd");
		});
		//daum address
		$(document).ready(function(){
			$("#cmpn_addr1").click(function(){
			    new daum.Postcode({
			        oncomplete: function(data) {
		 	        	$("#cmpn_addr1").val(data.address);
			        }//oncomplete
			    }).open();
			});//click
		});//ready
	</script>
</head>
<body>
	<div class="container">
		<%@ include file="13.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>jQuery Animate</h2>
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

//radio & checkbox & eng
$(document).ready(function(){
	$(":radio").click(function(){
		if($(this).val() == 1) {
			//$(".cmpn_join").css("display","none");
			//$(".cmpn_join").hide(1000);
			//$(".cmpn_join").fadeOut(1000);
			$(".cmpn_join").slideUp(1000);
		} else {
			//$(".cmpn_join").css("display","block");
			//$(".cmpn_join").show(1000);
			//$(".cmpn_join").fadeIn(1000);
			$(".cmpn_join").slideDown(1000);
		}
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
	<div class="form-check">
		<label class="form-check-label">
		<input type="radio" class="form-check-input" id="mbr_lvl1" name="mbr_level" value="1"> 개인 회원
		</label>
	</div>
	<div class="form-check">
		<label class="form-check-label">
		<input type="radio" class="form-check-input" id="mbr_lvl2" name="mbr_level" value="2"> 기업 회원
		</label>
	</div>

	<div class="form-group cmpn_join" style="display:none;">
		<label for="cmpn_reg_no1" class="mr-sm-2">사업자 등록 번호:</label>
		<input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter 000"
				id="cmpn_reg_no1" name="cmpn_reg_no1" maxlength="3">
		<input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter 00"
				id="cmpn_reg_no2" name="cmpn_reg_no2" maxlength="2">
		<input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter 00000"
				id="cmpn_reg_no3" name="cmpn_reg_no3" maxlength="3">
	</div>
	<div class="form-group cmpn_join" style="display:none;">
		<label for="cmpn_nm">사업장명:</label>
		<input type="text" class="form-control" placeholder="Enter Company Name"
				id="cmpn_nm" name="cmpn_nm" maxlength="20">
	</div>
	<div class="form-group cmpn_join" style="display:none;">
		<label for="cmpn_ceo_nm">대표자명:</label>
		<input type="text" class="form-control" placeholder="Enter Company CEO Name"
				id="cmpn_ceo_nm" name="cmpn_ceo_nm" maxlength="10">
	</div>
	<div class="form-group cmpn_join" style="display:none;">
		<label for="cmpn_start_date">사업 시작일:</label>
		<input type="text" class="form-control" placeholder="Enter Company Name"
				id="cmpn_start_date" name="cmpn_start_date" readonly="readonly">
	</div>
	<div class="form-group cmpn_join" style="display:none;">
		<label for="cmpn_reg_no1" class="mr-sm-2">사업자 주소:</label>
		<input type="text" class="form-control mb-2 mr-sm-2" readonly="readonly"
				id="cmpn_addr1" name="cmpn_addr1">
		<input type="text" class="form-control mb-2 mr-sm-2" readonly="readonly"
				id="cmpn_addr2" name="cmpn_addr2">
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
