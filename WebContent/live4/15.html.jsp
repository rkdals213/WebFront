<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jQuery Html</title>
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
					<h2>jQuery Html</h2>
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
		$("#set_html").click(function() {
			$("#test_area").html("<h1>set html - test area</h1>");
		});
		$("#add_css").click(function() {
			$("#test_area").css("border","2px red solid");
		});
		$("#set_text").click(function() {
			$("#test_area").text("<h1>set text - test area</h1>");
		});
	});//ready
	$(document).ready(function() {
		$("#get_html").click(function() {
			$("#test_area").text($("#test_area").html());
		});
		$("#get_css").click(function() {
			$("#test_area").text($("#test_area").css("border"));
		});
		$("#get_text").click(function() {
			alert($("#test_area").text());
		});
	});//ready
</script>

<button class="btn-warning" id="set_html">set html</button>
<button class="btn-warning" id="add_css">add css</button>
<button class="btn-warning" id="set_text">set text</button>

<button class="btn-primary" id="get_html">get html</button>
<button class="btn-primary" id="get_css">get css</button>
<button class="btn-primary" id="get_text">get text</button>

<div id="test_area" class="mt-2" style="width: 100%; height: 100px;">test area</div>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
