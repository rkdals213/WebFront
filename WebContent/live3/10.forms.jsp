<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JS forms</title>
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
					<h2>document.forms</h2>
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
<script type="text/javascript">
	function findElement() {
		let formArr = document.forms;
		alert("입력된 내용을 확인 하세요.\n"
				+formArr[0].childNodes[0].nodeValue+" : "+formArr[0].elements[0].value
				+formArr[0].childNodes[2].nodeValue+" : "+formArr[0].elements[1].value
				+formArr[1].childNodes[0].nodeValue+" : "+formArr[1].elements[0].value
				+formArr[1].childNodes[2].nodeValue+" : "+formArr[1].elements[1].value);
	}
</script>
<form action="">
	<div class="form-group">
		<label for="id">이름:</label>
		<input type="text" class="form-control onlyEngNumEmail" placeholder="Enter Name" id="name">
	</div>
	<div class="form-group">
		<label for="id">생년월일:</label>
		<input type="text" class="form-control onlyEngNumEmail" placeholder="Enter Birth" id="birth">
	</div>
</form>
<form action="">
	<div class="form-group">
		<label for="sel1">성별:</label>
		<select class="form-control" id="sel1">
			<option value="0">선택</option>
			<option value="male">남성</option>
			<option value="male">여성</option>
		</select>
	</div> 
	<div class="form-group">
		<label for="sel1">내외국인:</label>
		<select class="form-control" id="sel1">
				<option value="0">선택</option>
				<option value="1">내국인</option>
				<option value="2">외국인</option>
		</select>
	</div> 
</form>
<button class="btn btn-primary" onclick="javascript:findElement();">FindElement</button>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
