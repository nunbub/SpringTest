<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/ajax/css/style.css" type="text/css">
<title></title>
</head>
<body>

	<div class="container">
	
		<header class="text-center pt-4">
                <div class="display-4 text-center pt-3">통나무 팬션</div>		
		</header>
		
		<nav class="main-menu">
                <ul class="nav nav-fill d-flex">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약안내</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
		
		</nav>
		<section class="content">

                <article class="main-banner">
                    <img id="banner" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="통나무 팬션 사진">
                    
                </article>

                <article class="login-menu d-flex">

                    <div class="reserve col-4 text-white align-items-center justify-content-center d-flex">
                        
                        <div class="display-4">
                            실시간<br>
                            예약하기
                        </div>

                    </div>

                    <div class="login col-5 text-white">
                        
                        <div class="d-flex align-items-end ml-3 mt-4">
                            <h2>예약 확인</h2>
                            
                        </div>

                        <div class="ml-4 mt-3" id="memberInputs">
                            <div class="d-flex">
                                <label class="mr-3">이름 </label><input type="text" id="nameInput" class="form-control col-6">
                            </div>
                            <div class="d-flex mt-3">    
                                <label class="mr-3">전화번호 </label><input type="text" id="phoneNumberInput" class="form-control col-6">
                            </div>
                        </div>

                      
                        
                        <button type="button" id="searchBtn" class="btn btn-success">조회 하기</button>

                    </div>
                    
                    <div class="contact col-3 text-white d-flex align-items-center justify-content-center">
                        <h1>예약문의:<br>
                            010-<br>
                            000-1111</h1>
                    </div>

                </article>
            </section>
            <footer class="text-secondary mt-3">
                <small>제주특별자치도 제주시 애월읍<br>
                사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                Copyright 2025 tongnamu All right reserved</small>
            </footer>
        </div>
        
        <script>
        	$(document).ready(function() {
        		
        		$("#searchBtn").on("click", function() {
        			
        			let name = $("#nameInput").val();
        			let phoneNumber = $("#phoneNumberInput").val();
        			
        			if(name == "") {
        				alert("이름을 입력하세요");
        				return ;
        			}
        			
        			if(phoneNumber == ""){
        				alert("전화번호를 입력하세요");
        				return ;
        			}
        			
        			$.ajax({
        				type:"post"
        				, url:"/ajax/booking/find"
        				, data:{"name":name, "phoneNumber":phoneNumber}
        				, success:function(data) {
        					
        					if(data.result == "fail") {
        						alert("조회된 결과가 없습니다");
        					} else {
        						
	        					alert("이름 : " + data.data.name + "\n"
	        							+ "날짜 : " + data.data.state + "\n"
	        							+ "숙박일 수 : " + data.data.day + "\n"
	        							+ "상태 : " + data.data.state);
        					}
        					
        				}
        				, error:function() {
        					alert("조회 에러");
        				}
        			});
        		});
        		
        	});
        
        </script>

</body>
</html>