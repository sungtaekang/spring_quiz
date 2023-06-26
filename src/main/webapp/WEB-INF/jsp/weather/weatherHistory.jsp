<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/weather/style.css">
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<%-- 메뉴 영역 --%>
			<nav class="col-2">
				<%-- 상단 로고 --%>
				<div class="logo d-flex justify-content-center mt-3">
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" width="25">
					<span class="text-white font-weight-bold ml-2">기상청</span>
				</div>

				<%-- flex-column: 세로 메뉴 --%>
				<ul class="nav flex-column mt-4">
					<li class="nav-item"><a href="/weather/weather_history_view" class="nav-link menu-font">날씨</a></li>
					<li class="nav-item"><a href="/weather/add_weather_view" class="nav-link menu-font">날씨입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link menu-font">테마날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link menu-font">관측	기후</a></li>
				</ul>
			</nav>

			<%-- 날씨 히스토리 --%>
			<section class="weather-history col-10 mt-3 ml-5">
				<h3>과거 날씨</h3>

				<table class="table text-center">
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