<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JS create</title>
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
<script type="text/javascript">
	function addButton() {
		let label_name = document.createElement("label");
		label_name.innerText = "이름 ";
		let input_name = document.createElement("input");
		input_name.setAttribute("style","color: blue");

		let label_birth = document.createElement("label");
		label_birth.innerText = " 생년월일 ";
		let input_birth = document.createElement("input");
		input_birth.setAttribute("style","color: red");

		let label_gender = document.createElement("label");
		label_gender.innerText = " 성별 ";
		let select = document.createElement("select");
		let option0 = document.createElement("option");
		let option1 = document.createElement("option");
		let option2 = document.createElement("option");
		option0.innerText = " 선택 ";
		option1.innerText = " 남성 ";
		option2.innerText = " 여성 ";
		option0.setAttribute("value","0");
		option1.setAttribute("value","male");
		option2.setAttribute("value","female");
		select.appendChild(option0);select.appendChild(option1);select.appendChild(option2);

		let label_relation = document.createElement("label");
		label_relation.innerText = " 관계 ";
		let select_relation = document.createElement("select");
		let option0_relation = document.createElement("option");
		let option1_relation = document.createElement("option");
		let option2_relation = document.createElement("option");
		let option3_relation = document.createElement("option");
		let option4_relation = document.createElement("option");
		option0_relation.innerText = " 선택 ";
		option1_relation.innerText = " 본인 ";
		option2_relation.innerText = " 부모 ";
		option3_relation.innerText = " 배우자 ";
		option4_relation.innerText = " 자녀 ";
		option0_relation.setAttribute("value","0");
		option1_relation.setAttribute("value","1");
		option2_relation.setAttribute("value","2");
		option3_relation.setAttribute("value","3");
		option4_relation.setAttribute("value","4");
		select_relation.appendChild(option0_relation);
		select_relation.appendChild(option1_relation);
		select_relation.appendChild(option2_relation);
		select_relation.appendChild(option3_relation);
		select_relation.appendChild(option4_relation);

		let input_btn = document.createElement("input");
		let label_btn = document.createElement("label");
		label_btn.innerText = " 행삭제 ";
		input_btn.setAttribute("type","button");
		input_btn.setAttribute("value","delete");
		let tags = document.getElementsByTagName("p");
		input_btn.setAttribute("onclick","javascript:removeButton2(this);");

		let p1 = document.createElement("p");
		p1.appendChild(label_name);p1.appendChild(input_name);
		p1.appendChild(label_birth);p1.appendChild(input_birth);
		p1.appendChild(label_gender);p1.appendChild(select);
		p1.appendChild(label_relation);p1.appendChild(select_relation);
		p1.appendChild(label_btn);p1.appendChild(input_btn);

		let formArr = document.forms;
		formArr[0].appendChild(p1);
	}
	function removeButton() {
		let tags = document.getElementsByTagName("p");
		let formArr = document.forms;
		formArr[0].removeChild(formArr[0].childNodes[tags.length-1]);
	}
	function removeButton2(obj) {
		let formArr = document.forms;
		formArr[0].removeChild(obj.parentNode);
	}
</script>
<button class="mb-2" onclick="javascript:addButton();">addButton</button>
<button class="mb-2" onclick="javascript:removeButton();">removeButton</button>
<form action="">

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
