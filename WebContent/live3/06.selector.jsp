<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JS selector</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="13.bs4.css" />
	<style type="text/css">
		h1 {
			background-color: #ffd966;
		}
	</style>
</head>
<body>
	<div class="container">
		<%@ include file="13.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>querySelector</h2>
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
	function byQuerySelector(className) {
		let tagColor;
		if(className == "no1"){
			tagColor = "pink";
		} else {
			tagColor = "blue";
		}
		let classes = document.querySelector("."+className);
		//alert(tag.length);
		classes.style.backgroundColor = tagColor;
	}
</script>
<h1 class="no1">Head Line no 1</h1>
<h1 class="no2">Head Line no 2</h1>
<h1 class="no1">Head Line no 3</h1>
<h1 class="no2">Head Line no 4</h1>
<h1 class="no1">Head Line no 5</h1>
<button onclick="javascript:byQuerySelector('no1');">querySelector(no1)</button>
<button onclick="javascript:byQuerySelector('no2');">querySelector(no2)</button>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
