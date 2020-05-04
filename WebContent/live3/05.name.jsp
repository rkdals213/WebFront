<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JS name</title>
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
					<h2>getElementsByName</h2>
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
	let checkYN = true;
	function byName(name) {
		let names = document.getElementsByName(name);
		for(let i=0; i<names.length; i++){
			names[i].checked = checkYN;
		}
		if(checkYN == true) {
			checkYN = false;
		} else {
			checkYN = true;
		}
	}
	function send(name) {
		let names = document.getElementsByName(name);
		let tmpStr = "";
		for(let i=0; i<names.length; i++){
			if(names[i].checked == true){
				tmpStr = tmpStr + names[i].getAttribute("value");
			}
			if(i < names.length-1){
				tmpStr = tmpStr + ", "
			}
		}
		alert(tmpStr);
	}
</script>
<h1>
	<input type="checkbox" name="fruit" id="fruit_apple" value="apple"> apple <br>
	<input type="checkbox" name="fruit" id="fruit_banana" value="banana"> banana <br>
	<input type="checkbox" name="fruit" id="fruit_cherry" value="cherry"> cherry <br>
	<input type="checkbox" name="fruit" id="fruit_melon" value="melon"> melon <br>
	<input type="checkbox" name="fruit" id="fruit_peach" value="peach"> peach <br>
</h1>
<button onclick="javascript:byName('fruit');">getElementsByName(fruit)</button>
<button onclick="javascript:send('fruit');">send(fruit)</button>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-secondary rounded mt-1"></footer>
	</div>
</body>
</html>
