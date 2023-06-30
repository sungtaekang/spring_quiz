<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" class="container">
    	<jsp:include page="header.jsp" />
    	<jsp:include page="menu.jsp" />
    	<section class="contents mb-5">
    		<h2 class="text-center font-weight-bold p-3">예약 목록 보기</h1>
    		
    		<table class="table text-center">
    			<thead>
    				<tr>
    					<th>이름</th>
    					<th>예약날짜</th>
    					<th>숙박일수</th>
    					<th>숙박인원</th>
    					<th>전화번호</th>
    					<th>예약상태</th>
    					<th></th>
    				</tr>
    			</thead>
    			<tbody>
    			<c:forEach items="${bookingList}" var="list">
    				<tr>
    					<td>${list.name}</td>
    					<td>${list.date}</td>
    					<td>${list.day}</td>
    					<td>${list.headcount}</td>
    					<td>${list.phoneNumber}</td>
    					<td>${list.state}</td>
    					<td><button class="btn btn-danger">삭제</button></td>
    				</tr>
    			</c:forEach>
    			</tbody>
    		</table>
    	</section>
    	<jsp:include page="footer.jsp" />
    </div>
</body>
</html>