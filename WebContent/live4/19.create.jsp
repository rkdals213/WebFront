<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>createElement</title>
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
					<h2>피부양자 추가</h2>
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
		let btn_no = 0;
		let input_name = '이름 <input type="text" style="color:blue;">';
		let input_birth = ' 생년월일 <input type="text" style="color:red;">';
		let select_gender = ' 성별 <select><option value="0">선택</option><option value="male">남성</option><option value="female">여성</option></select>';
		let select_relation = ' 관계 <select><option value="0">선택</option><option value="1">본인</option><option value="2">부모</option><option value="3">배우자</option><option value="4">자녀</option></select>';
		$("#addButton").click(function() {
			let input_del_btn = ' 행삭제 <input type="button" id="btn_'+btn_no+'" value="delete">';
			$("#addForm").append('<p class="mt-1">'
					+input_name
					+input_birth
					+select_gender
					+select_relation
					+input_del_btn+'</p>');
			$("#btn_"+btn_no).on("click",function() {
				//alert($(this).attr("id"));
				$(this).parent().remove();
			});
			btn_no++;
		});//click
		$("#removeButton").click(function() {
			$("#addForm").children().last().remove();
		});//click
	});//ready
</script>
<button id="addButton">addButton</button>
<button id="removeButton">removeButton</button>
<form id="addForm" action="" class="mt-1">

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
