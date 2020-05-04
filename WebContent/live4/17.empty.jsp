<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jQuery Attribute</title>
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
					<h2>jQuery Attribute</h2>
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
		$("#add_class").click(function() {
			$("#test_area").addClass("bg-secondary text-warning");
			$("#test_area").text("add class bg-secondary text-warning");
		});
		$("#remove_class").click(function() {
			$("#test_area").removeClass("bg-secondary");
			$("#test_area").text("remove class bg-secondary");
		});
	});//ready
	$(document).ready(function() {
		$("#empty").click(function() {
			$("#test_area").empty();
		});
		$("#remove").click(function() {
			$("#test_area").remove();
		});
		$("#append").click(function() {
			$(".card-body").append('<div id="test_area" class="border border-danger mt-2" style="width:100%;height:100px;"></div>');
		});
	});//ready
</script>

<button class="btn-warning" id="add_class">add class</button>
<button class="btn-danger" id="remove_class">remove class</button>

<button class="btn-danger" id="empty">empty</button>
<button class="btn-danger" id="remove">remove</button>

<button class="btn-warning" id="append">append</button>

<div id="test_area" class="border border-danger mt-2" style="width:100%;height:100px;"></div>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
