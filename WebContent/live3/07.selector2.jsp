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
		h1, h2, h3 {
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
					<h2>querySelector 2</h2>
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
	function byQuerySelector(tagName) {
		let tagColor;
		if(tagName == "h2"){
			tagColor = "pink";
		} else {
			tagColor = "blue";
		}
		let tag = document.querySelector(tagName);
		//alert(tag.length);
		tag.style.backgroundColor = tagColor;
	}
</script>
<h1>Element h1 - Line No 1</h1>
<h2>Element h2 - Line No 2</h2>
<h3>Element h3 - Line No 3</h3>
<h2>Element h2 - Line No 4</h2>
<h1>Element h1 - Line No 5</h1>
<button onclick="javascript:byQuerySelector('h1');">querySelector(h1)</button>
<button onclick="javascript:byQuerySelector('h2');">querySelector(h2)</button>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
