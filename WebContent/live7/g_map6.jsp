<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>g_map6</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live7/00.bs4.css" />
</head>
<body>
	<div class="container">
		<%@ include file="/live7/00.bs4_header.jsp" %>
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>g_map6</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">

<!-- here start -->
<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function(){
	$.get("${pageContext.request.contextPath}/FSelectBoxController"
		,{command:"sido"}
		,function(data, status){
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});//each
		}//function
		, "json"
	);//get
});//ready
$(document).ready(function(){
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#gugun").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController"
				,{command:"dong", gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController"
				,{command:"apt", dong:$("#dong").val()}
				,function(data, status){
					$("#searchResult").empty();
					$.each(data, function(index, vo) {
						let str = "<tr class="+colorArr[index%3]+">"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td>" + vo.AptName + "</td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.code
						+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
						$("tbody").append(str);
						$("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
					});//each
					geocode(data);
				}//function
				, "json"
		);//get
	});//change
});//ready
function geocode(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyC3Jh6Rt72qHXe5GomCfP_4LAuHjs_sr0U'
					, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
				}
				, function(data, status) {
					//alert(data.results[0].geometry.location.lat);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.AptName);
				}
				, "json"
		);//get
	});//each
}
</script>
시도 : <select id="sido">
	<option value="0">선택</option>
</select>
구군 : <select id="gugun">
	<option value="0">선택</option>
</select>
읍면동 : <select id="dong">
	<option value="0">선택</option>
</select>
<table class="table mt-2">
	<thead>
		<tr>
			<th>번호</th>
			<th>법정동</th>
			<th>아파트이름</th>
			<th>지번</th>
			<th>지역코드</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- here end -->
<!-- map start -->
<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3Jh6Rt72qHXe5GomCfP_4LAuHjs_sr0U&callback=initMap"></script>
<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		var marker = new google.maps.Marker({position: multi, map: map});
	}
	function addMarker(tmpLat, tmpLng, aptName) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			label: aptName,
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo();
		});
		marker.setMap(map);
	}
	function callHouseDealInfo() {
		alert("you can call HouseDealInfo");
	}
</script>
<!-- map end -->

				</div>
			</div>
		</section>
		<!-- section end -->
<!-- 		<footer class="col-ms-12 bg-dark rounded mt-1"></footer> -->
	</div>
</body>
</html>
