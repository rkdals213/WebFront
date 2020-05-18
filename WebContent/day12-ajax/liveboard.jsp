<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./waitme/waitMe.min.css">
<script src="./waitme/waitMe.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<p>일부 시민 이태원 클럽 방문으로 코로나 확산 일로...</p>
	<div id="wait">
		<form id="replyform">
			<input type="text" id="writer" name="writer">
			<input type="text" id="message" name="reply">
		</form>
		<button id="send">보내기</button>
	</div>
	<ul id="reply">

	</ul>
</body>
<script>
	$("#send").on("click", function() {
		
		$('#wait').waitMe({
			effect : 'bounce',
			text : '',
			bg : 'rgba(255,255,255,0.7)',
			color : '#000',
			maxSize : '',
			waitTime : -1,
			textPos : 'vertical',
			fontSize : '',
			source : '',
			onClose : function() {}
			});
		
		$.ajax({
			url : "./LiveBoard",
			//data : {"reply" : $("#message").val(), "writer" : $("#writer").val(),},
			data: $("#replyform").serialize(),
			type : "post",
			success : function(data) {
				$("#reply").append($("<li>" + data + "</li>"));
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			},
			complete:function(){
				$('#wait').waitMe("hide");
			}
		});
	});

	setInterval(function() {
		$.ajax({
			url : "./LiveBoard",
			//type:"get",
			// data:{},
			success : function(data) {
				// 성공시 dom 편집
				console.log(data);
				$("#reply").append($("<li>" + data + "</li>"));
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	}, 1000 * 10)
</script>

</html>