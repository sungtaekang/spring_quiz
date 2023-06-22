<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h1>1. JSTL core 변수</h1>
	<c:set var="n1" value="36" />
	<c:set var="n2" value="3" />
	<h3>첫번째 숫자: ${n1}</h3> <br>
	<h3>두번째 숫자: ${n2}</h3> <br>
	
	<h1>2. JSTL core 연산</h1>
	<h3>더하기: ${n1 + n2}</h3> <br>
	<h3>빼기: ${n1 - n2}</h3> <br>
	<h3>곱하기: ${n1 * n2}</h3> <br>
	<h3>나누기: ${n1 / n2}</h3> <br>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out<title>" /><br>
	
	<h1>4. JSTL core if</h1>
	<c:if test="${(n1 + n2) / 2 >= 10}">
		<h1>${(n1 + n2) / 2}</h1>
	</c:if>
	<c:if test="${(n1 + n2) / 2 < 10}">
		<h3>${(n1 + n2) / 2}</h3>
	</c:if>
	
	<c:if test="${n1 * n2 > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
	
	
</body>
</html>