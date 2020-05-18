<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Join Member</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live5/00.bs4.css" />
</head>
<body>
	<div class="container">
		<%@ include file="/live5/00.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>Join Member</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">

<!-- here start -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<form id="join_form" name="join_form" method="post">
	<input type="hidden" name="command" value="join_member"/>
	<label for="mbr_jid"><strong>User ID (* 20자 이내) <span id="id_chk_res"></span></strong></label>
	<input type="text" id="mbr_jid" name="mbr_id" class="form-control mb-3" placeholder="ID" />
	<br>
	<label for="mbr_jpwd"><strong>User Password (* 20자 이내) <span id="pwd_chk_res" class="text-danger"></span></strong></label>
	<input type="password" id="mbr_jpwd" name="mbr_pwd" class="form-control mb-3" placeholder="Password"/>
	<br>
	<label for="mbr_pwd_re"><strong>User Password Confirm (* 20자 이내)</span></strong></label>
	<input type="password" id="mbr_pwd_re" name="mbr_pwd_re" class="form-control mb-3" placeholder="Password" />
	<br>
	<label for="mbr_nm"><strong>User Name (* 10자 이내) <span id="nm_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_nm" name="mbr_nm" class="form-control mb-3" placeholder="Name"  />
	<br>
	<label for="mbr_tel"><strong>User CellPhone (* 20자 이내) <span id="tel_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_tel" name="mbr_tel" class="form-control mb-3" placeholder="01055557777"  />
	<br>
	<label for="mbr_email"><strong>User E-mail (* 50자 이내) <span id="email_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="mbr_email" name="mbr_email" class="form-control mb-3" placeholder="example@example.com" />
	<br>
	<label for="mbr_addr1"><strong>User Address (*)</strong></label>
	<input type="text" id="mbr_addr1" name="mbr_addr1" class="form-control mb-3" placeholder="Click!" />
	<br>
	<label for="mbr_addr2"><strong>User Address 2 (50자 이내)</strong></label>
	<input type="text" id="mbr_addr2" name="mbr_addr2" class="form-control mb-3" placeholder="주소 상세" />
	<br>
	<input type="submit" id="join_btn" class="btn btn-primary btn-block" value="JOIN IN" />
</form>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
<script>
// 사용자 정의의 메서드 추가
	$.validator.addMethod("regex", function(value, element, regex) {
		let re = new RegExp(regex);
		let res = re.test(value);
		return res;
	});


	// form이 전송될 때 validation 처리
	$("#join_form").validate({
		rules:{
			mbr_id: {
				required: true,
				maxlength: 20
			},
			mbr_nm: {
				regex: "^[가-힣]{3,10}$"
			},
			mbr_pwd:{
				regex: "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$"
			},
			mbr_tel:{
				regex: "(010|011)[- ]?[0-9]{3,4}[- ]?[0-9]{4}"
			}
		},		// validation을 체크할 항목
		messages:{
			mbr_id: {
				required: "아이디는 필수 항목입니다",
				maxlength: "아이디는 최대 20글자가 필요해요"
			},
			mbr_nm: {
				regex: "이름은 한글로 3~10글자"
			},
			mbr_pwd:{
				regex: "숫자, 알파벳, 특수문자가 반드시 포함되어야 하고 전체적으로 6~20글자"
			},
			mbr_tel:{
				regex: "010, 011 로 시작하고 숫자만 입력해야 합니다"
			}
		}		// validatiob 체크가 실패했을 때 화면에 보여줄 메세지
		
		// 기본 submit 행동을 중지 시키고 필요한 동작 처리 - ajax
		,
		submitHandler : function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/CJoinMemberController",
				data : $("#join_form").serialize(),
				success : function(data) {
					alert("회원가입 완료: " + data);
				},
				error : function(xhr, status, error) {
					alert("회원가입 실패: " + error);
				}
			});
		}

	});


/* 	$("#join_btn").on("click", function(){
		// 사용자의 입력이 제대로 되어있나? - validation 체크
		if(!checkId()){
			alert("id확인");
			return;
		}
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/CJoinMemberController",
			data:$("#join_form").serialize(),
			success:function(data){
				alert("회원가입 완료 : " + data);
			},
			error:function(xhr, status, error){
				alert("회원가입 실패 : " + error);
			},
		});
	});
//1. ID중복 체크
//2. 필수 항목 data 입력 여부 체크
	function checkId(){
		let id = $("#mbr_jid").val();
		return id && id.length<=20;
	}
//3. ajax를 이용한 회원 가입 처리
	$(document.ready(function(){
		$("#join_btn").click(function(){
			$.post(
				"${pageContext.request.contextPath}/CJoinMemberController",
				{command:'join_member',
					id:$("#mbr_jid").val,
					pwd:$("#mbr_jpwd").val,
					name:$("#mbr_nm").val,
					tel:$("#mbr_tel").val,
					email:$("#mbr_email").val,
					address:$("#mbr_addr1").val
					},
				function(data, status){
					if(data == 1){
						//성공
					}else if(data == -1){
						//실패
					}else if(data == 0){
						//서버 에러
					}
				}//function
			);//post
		});//click
	}); */
//4. [선택] 다음 주소 연동
</script>
</html>
