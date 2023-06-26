<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
	#wrap{height:1200px;}
	aside{margin:0;}
	footer{height:80px;}
	.contents{min-height:500px}
</style>
</head>
<body>
	<div id="wrap" class="container">
		<div class="d-flex">
			<jsp:include page="aside.jsp" />
			<section class="bg-primary contents col-10">
				<h1 class="font-weight-bold">과거 날씨</h1>
				
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weather}" var="weathers">
							<tr>
								<td>${weathers.date}</td>
								<td>
									<c:choose>
										<c:when test="${weathers.weather eq '비'}">
											<img src="/image/rainy.jpg">
										</c:when>
										<c:when test="${weathers.weather eq '흐림'}">
											<img src="/image/cloudy.jpg">
										</c:when>
										<c:when test="${weathers.weather eq '구름조금'}">
											<img src="/image/partlyCloudy.jpg">
										</c:when>
										<c:otherwise>
											<img src="/image/sunny.jpg">
										</c:otherwise>
									</c:choose>
								</td>
								<td>${weathers.temperatures}℃amp;</td>
								<td>${weathers.precipitation}</td>
								<td>${weathers.microDust}</td>
								<td>${weathers.windSpeed}km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>