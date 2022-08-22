<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>즐겨찾기 추가하기</title>
</head>
<body>

	<div class="container">
		
		<h2>즐겨 찾기 추가하기</h2>
		
		<!-- <form method="get" action="/ajax/website/list">  -->
			
			<label>제목</label>
			<input type="text" class="form-control" id="titleInput">
			
			<label>주소</label>
			<div class="d-flex">
				<input type="text" class="form-control col-10" id="urlInput"> 
				<button type="button" id="checkBtn" class="btn btn-info">중복확인</button>
			</div>
			<div class="text-danger small d-none" id="duplicateDiv">중복된 URL 입니다</div>
			<div class="text-success small d-none" id="availableDiv">사용가능한 URL 입니다</div>	
			<button type="button" id="addBtn" class="btn btn-success btn-block mt-3">추가</button>
		
		<!-- </form> -->
	
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			// 중복체크 확인 상태 저장 변수
			var isCheck = false;
			// 중복 상태 저장 변수
			var isDuplicateUrl = true;
			
			$("#urlInput").on("input", function() {
				// 중복체크 확인 상태를 초기화
				isCheck = false;
				isDuplicateUrl = true;
				
				$("#duplicateDiv").addClass("d-none");
				$("#availableDiv").addClass("d-none");
				
			});
			
			$("#checkBtn").on("click", function(){
				
				let url = $("#urlInput").val();
				
				if(url == "") {
					alert("주소를 입력하세요.");
					return ;
				}
				
				if(!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소 형식이 잘못되었습니다.");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/ajax/website/is_duplicate"
					, data:{"url":url}
					, success:function(data){
						
						isCheck = true;
						
						if(data.is_duplicate) {
							isDuplicateUrl = true;
							
							$("#duplicateDiv").removeClass("d-none");
							$("#availableDiv").addClass("d-none");
						}else{
							isDuplicateUrl = false;
							
							$("#duplicateDiv").addClass("d-none");
							$("#availableDiv").removeClass("d-none");
						}
					}
					, error:function(){
						alert("중복 확인 에러");
					}
				})
				
			})
			
			$("#addBtn").on("click", function(){
				
				let title = $("#titleInput").val();
				let url = $("#urlInput").val();
				
				// 유효성 검사
				// validation
				if(title == ""){
					alert("제목을 입력하세요.");
					return ;
				}
				
				if(url == "") {
					alert("주소를 입력하세요.");
					return ;
				}
				
				if(!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소 형식이 잘못되었습니다.");
					return ;
				}
				
				// url 중복 체크 여부 확인
				
				// 중복체크 여부 확인
				if(!isCheck){
					alert("주소 중복체크 여부 확인해주세요");
					return ;
				}
				// 중복상태 여부 확인
				if(isDuplicateUrl){
					alert("중복된 url 입니다");
					return ;
				}
				// api 호출
				$.ajax({
					type:"post"
					, url:"/ajax/website/add"
					, data:{"name":title, "url":url}
					, success:function(data) {
						
						if(data.result == "success") {
							location.href = "/ajax/website/list";
						}else {
							alert("저장 실패");
						}
						
					}
					, error:function() {
						alert("에러발생");
					}
				});
				
				
				
			});
			
		});
	
	</script>

</body>
</html>