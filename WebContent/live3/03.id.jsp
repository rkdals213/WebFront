<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JS id</title>
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
					<h2>getElementById</h2>
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
	function byId(idName) {
		let tagColor;
		if(idName == "no3"){
			tagColor = "pink";
		} else {
			tagColor = "blue";
		}
		let tag = document.getElementById(idName);
		tag.style.backgroundColor = tagColor;
	}
</script>
<h1 id="no1">Element ID no 1</h1>
<h1 id="no2">Element ID no 2</h1>
<h1 id="no3">Element ID no 3</h1>
<h1 id="no4">Element ID no 4</h1>
<h1 id="no5">Element ID no 5</h1>
<button onclick="javascript:byId('no3');">getElementById(no3)</button>
<button onclick="javascript:byId('no5');">getElementById(no5)</button>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
