<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>JSTL Core 라이브러리 2</title>
</head>
<body>
	<div class="container">
		<h2>HOT 5</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="musicList" items="${music }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${musicList }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<h2>멤버십</h2>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화 번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="members" items="${member }">
					<tr>
						<td>${members.name }</td>
						<td>${members.phoneNumber }</td>
						
						<c:choose>
							<c:when test="${members.grade eq 'VIP' }">
								<td class="text-danger">${members.grade }</td>
							</c:when>
							<c:when test="${members.grade eq 'GOLD' }">
								<td class="text-warning">${members.grade }</td>
							</c:when>
							<c:otherwise>
								<td>${members.grade }</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${members.point >= 5000 }">
								<td class="text-primary">${members.point }P</td>	
							</c:when>
							<c:otherwise>
								<td>${members.point }P</td>
							</c:otherwise>
						</c:choose>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>