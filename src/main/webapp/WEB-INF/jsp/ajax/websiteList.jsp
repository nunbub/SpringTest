<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>즐겨찾기 목록</title>
</head>
<body>

	<h2>즐겨 찾기 목록</h2>

	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="website" items="${websiteList }" varStatus="status">
				<tr>
					<td>${website.id  }</td>
					<td>${website.name }</td>
					<td>${website.url }</td>
					<td><button type="button" class="btn btn-danger btn-sm delete-btn" data-website-id="${website.id }">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
	
		$(document).ready(function(){
			// class 속성을 활용해서 이벤트를 등록 ( 여러 버튼에 같은 이벤트를 등록하기 위해서)
			$(".delete-btn").on("click", function(){
				
				// 현재 이벤트가 발생한 버튼 객체 가져오기 $(this)
				// 해당 버튼 객체에 삭제 대상 id 가 포함되어 있어야한다 ( data 속성)
				let websiteId = $(this).data("website-id");
				
				$.ajax({
					type:"get"
					, url:"/ajax/website/delete"
					, data:{"id":websiteId}
					, success:function(data) {
						if(data.result == "success"){
							location.reload(); // 새로고침
						}else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 에러");
					}
				});
			});
			
			
			
		});
	
	</script>

</body>
</html>