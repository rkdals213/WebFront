<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jQuery board</title>
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
					<h2>jQuery board</h2>
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
<!-- table start -->
<table class="table">
	<thead>
		<tr>
			<th>Firstname</th>
			<th>Lastname</th>
			<th>Email</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- table end -->

<!-- modal start -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-md" style="vertical-align: middle;">
		<div class="modal-content">

			<!-- ModalHeader -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="firstName">First Name:</label>
					<input type="text" class="form-control" placeholder="Enter first name" id="firstName">
				</div>
				<div class="form-group">
					<label for="lastName">Last Name:</label>
					<input type="text" class="form-control" placeholder="Enter last name" id="lastName">
				</div>
				<div class="form-group">
					<label for="email">Email address:</label>
					<input type="email" class="form-control" placeholder="Enter email" id="email">
				</div>
				<input type="text" id="hid_id_no">
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="modalRegistBtn" class="btn btn-primary" data-dismiss="modal">글 등록</button>
				<button type="button" id="modalModifyBtn" class="btn btn-info" data-dismiss="modal">글 수정</button>
				<button type="button" id="modalDeleteBtn" class="btn btn-danger" data-dismiss="modal">글 삭제</button>
				<button type="button" class="btn btn-warning dataDismiss" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<!-- modal end -->

<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" id="modal_open" data-toggle="modal" data-target="#myModal">
	글 쓰기
</button>

<script>
$(document).ready(function() {
	let id_no = 0;
	$("#modalRegistBtn").click(function() {
		let tmpStr = '<tr><td>'
					+$("#firstName").val()
					+'</td><td><a href="#" id="td_a_'+id_no+'">'
					+$("#lastName").val()
					+'</a></td><td>'
					+$("#email").val()
					+'</td></tr>';
		$("tbody").append(tmpStr);
		$(".dataDismiss").click();
		$("#td_a_"+id_no).on("click",function() {
// 			alert($(this).text());
// 			alert($(this).parent().html());
// 			alert($(this).parent().prev().text());
// 			alert($(this).parent().next().text());
			$("#firstName").val($(this).parent().prev().text());
			$("#lastName").val($(this).text());
			$("#email").val($(this).parent().next().text());
			$("#hid_id_no").val($(this).attr("id"));
			$("#modal_open").click();
		});
		id_no++;
	});//click
	$("#modalDeleteBtn").click(function() {
		$("#"+$("#hid_id_no").val()).parent().parent().remove();
		$(".dataDismiss").click();
	});//click
	$("#modalModifyBtn").click(function() {
		$("#"+$("#hid_id_no").val()).prev().text($("#firstName").val());
		$("#"+$("#hid_id_no").val()).text($("#lastName").val());
		$("#"+$("#hid_id_no").val()).next().text($("#email").val());
		$(".dataDismiss").click();
	});//click
	$(".dataDismiss").click(function() {
		$("#firstName").val("");
		$("#lastName").val("");
		$("#email").val("");
		$("#hid_id_no").val("");
	});//click
});//ready
</script>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
