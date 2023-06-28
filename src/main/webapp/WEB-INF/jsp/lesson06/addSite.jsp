<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<h1 class="font-weight-bold">즐겨 찾기 추가하기</h1>

	<label for="name"><b>제목</b></label>
	<input type="text" id="name" name="name" class="form-control col-6" placeholder="제목을 입력하세요">
	
	<label for="name"><b>주소</b></label>
	<input type="text" id="url" name="url" class="form-control col-6 mb-3" placeholder="이름을 입력하세요">
	
	<input type="button" id="joinBtn" class="btn btn-success col-6" value="추가">
	
	
	
	<script>
		$(document).ready(function() {
			$('#joinBtn').on('click', function() {
				
				let name = $('#name').val().trim();
				if(name == '') {
					alert("제목을 입력하세요");
					return false;
				}
				
				let url = $('#url').val().trim();
				if(url == '') {
					alert("url을 입력하세요");
					return false;
				}
				
				if(url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("프로토콜까지 입력하세요.");
					return false;
				}
				
				console.log(name);
				console.log(url);
				
				$.ajax({
					type:"post"
					, url:"/lesson06/quiz01/add_site"
					, data:{"name":name, "url":url}
				
					// response
					, success:function(data) {
						alert(data);
						if(data == "성공") {
							location.href = "/lesson06/quiz01/site_list_view";
						} else {
							"등록에 실패하였습니다."
						}
					}
					, complete:function(data) {
						alert("완료");
					}
					, error:function(request, status, error) {
						alert(request);
						alert(status);
						alert(error);
					}
				});
			});
		});
	</script>
	
</body>
</html>