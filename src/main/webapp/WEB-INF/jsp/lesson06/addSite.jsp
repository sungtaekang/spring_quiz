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
	<div class="container">
		<h1 class="font-weight-bold">즐겨 찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name"><b>제목</b></label>
			<input type="text" id="name" class="form-control" placeholder="제목을 입력하세요">
		</div>
		
		<div class="form-group">
			<label for="name"><b>주소</b></label>
			<div class="d-flex w-100">
				<input type="text" id="url" class="form-control mb-3 mr-3 col-11" placeholder="주소를 입력하세요">
				<button type="button" class="btn btn-info h-100 col-1" id="urlCheckBtn">중복확인</button>
			</div>
				<small id="urlStatusArea" class="text-danger d-none">중복된 url 입니다.</small>
				<small id="urlAvailableArea" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		
		<input type="button" id="addSiteBtn" class="btn btn-success w-100" value="추가">
	</div>
	
	
	<script>
		$(document).ready(function() {
			$('#addSiteBtn').on('click', function() {
				
				let name = $('#name').val().trim();
				if(name == '') {
					alert("제목을 입력하세요");
					return;
				}
				
				let url = $('#url').val().trim();
				if(url == '') {
					alert("url을 입력하세요");
					return;
				}
				
				if(url.startsWith("http://") == false && url.startsWith("https://") == false) {
					alert("프로토콜까지 입력하세요.");
					return;
				}
				
				/* console.log(name);
				console.log(url); */
				
				// 문제 2) 중복확인 체크
				if ($('#urlAvailableArea').hasClass('d-none')) { // 잘못된 경우	urlAvailableArea  d-none
					alert("중복된 url입니다. 다시 확인해주세요.");
					return;
				}
				
				// AJAX 통신 => 서버 요청
				
				$.ajax({
					type:"post"
					, url:"/lesson06/quiz01/add_site"
					, data:{"name":name, "url":url}
				
					// response
					, success:function(data) { // String, JSON => 자바스크립트의 객체 변환
						/* alert(data.code);
						alert(data.result); */
						
						if(data.result == "성공") {
							location.href = "/lesson06/quiz01/site_list_view"; // GET
						} else {
							"등록에 실패하였습니다."
						}
					}
					, error:function(request, status, error) {
						alert("즐겨찾기 추가하는데 실패했습니다.");
					}
				});
			});
			
			// 문제 2-1)
			$('#urlCheckBtn').on('click', function() {
				
				let url = $('#url').val().trim();
				
				if (!url) {
					alert("검사할 url을 입력해주세요.")
					return;
				}
				
				// AJAX 통신 => DB URL 존재 여부				
				$.ajax({
					type:"post"
					, url:"/lesson06/quiz01/is_duplication"
					, data:{"url":url}
				
					, success:function(data) {
						// {"code":1, "isDuplication":true}
						if (data.isDuplication) { // 중복
							$('#urlStatusArea').removeClass('d-none');
							$('#urlAvailableArea').addClass('d-none');
						} else { // 사용 가능(중복 아님)
							$('#urlStatusArea').addClass('d-none');
							$('#urlAvailableArea').removeClass('d-none');
						}
					}
				});
			});
		});
	</script>
	
</body>
</html>