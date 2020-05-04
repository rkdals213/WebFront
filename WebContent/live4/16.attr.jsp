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
		$("#add_attr").click(function() {
			$("#test_area").attr("title","title attribute appended");
		});
		$("#add_prop").click(function() {
			$("#test_area").prop("memo","user defined propperty");
		});
	});//ready
	$(document).ready(function() {
		$("#get_attr").click(function() {
			$("#test_area").text($("#test_area").attr("title"));
		});
		$("#get_prop").click(function() {
			$("#test_area").text($("#test_area").prop("memo"));
		});
	});//ready
	$(document).ready(function() {
		$("#remove_attr").click(function() {
			$("#test_area").text("");
			$("#test_area").removeAttr("title");
		});
		$("#remove_prop").click(function() {
			$("#test_area").text("");
			$("#test_area").removeProp("memo");
		});
	});//ready
</script>

<button class="btn-warning" id="add_attr">add attr</button>
<button class="btn-warning" id="add_prop">add prop</button>

<button class="btn-primary" id="get_attr">get attr</button>
<button class="btn-primary" id="get_prop">get prop</button>

<button class="btn-danger" id="remove_attr">remove attr</button>
<button class="btn-danger" id="remove_prop">remove prop</button>

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
