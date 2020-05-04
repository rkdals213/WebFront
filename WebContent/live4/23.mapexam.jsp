<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>map exam</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="13.bs4.css" />
    <style>
      #map {
        height: 100%;
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
					<h2>map exam</h2>
				</div>
			</div>
		</div>
		</section>
	</div>
    <div id="map" style="width: 58%; height: 500px; margin: auto;"></div>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3Jh6Rt72qHXe5GomCfP_4LAuHjs_sr0U&callback=initMap"></script>
    <script>
		var multi = {lat: 37.5012743, lng: 127.039585};
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center: multi, zoom: 17
			});
			var marker = new google.maps.Marker({position: multi, map: map});
		}
	</script>
	<footer class="bg-secondary rounded mt-1" style="width: 58%; height: 100px; margin: auto;"></footer>
</body>
</html>
