<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Format</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live5/00.bs4.css" />
</head>
<body>
	<div class="container">
		<%@ include file="/live5/00.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>Format Page</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">

<!-- here start -->
<h1>
	<span id="span_login" data-toggle="modal" data-target="#myModal" style="cursor: pointer;">로그인</span>
	<span id="span_id" style="display: none;"></span>
	<span id="span_logout" style="display: none; cursor: pointer;">로그아웃</span>
</h1>

<!-- modal start -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-md" style="vertical-align: middle;">
		<div class="modal-content">

			<!-- ModalHeader -->
			<div class="modal-header">
				<h4 class="modal-title">LogIn</h4>
				<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="mbr_id">ID:</label>
					<input type="text" id="mbr_id" class="form-control" placeholder="Enter ID">
				</div>
				<div class="form-group">
					<label for="mbr_pwd">Password:</label>
					<input type="password" id="mbr_pwd" class="form-control" placeholder="Enter Password">
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="modalLogInBtn" class="btn btn-primary" data-dismiss="modal">LogIn</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<!-- modal end -->
<script>
//1. ajax를 이용한 로그인 처리
//2. ajax를 이용한 로그아웃 처리
//3. session 여부에 따른 화면 요소 display 처리
</script>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
