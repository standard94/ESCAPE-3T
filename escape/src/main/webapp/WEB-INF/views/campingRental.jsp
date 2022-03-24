<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<title>낚시 포인트</title>

</head>



<link rel="stylesheet" type="text/css" href="resources/css/campingRental.css" />
<script src="resources/js/resource.js"></script>
<script src="resources/js/rentalGoods.js"></script>

<body onLoad=""/>

	<div id="basic">
		<div id="top">
			<div id="logo" onClick="getNewPage('basic')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
				<div id="box1">
		 			<div id="login1"><span class="top_menu" >${sessionInfo.mmId}님</span>
		 			<input id="logOutButton" type = "button" value= "로그아웃" onClick="logOutMember('${sessionInfo.mmId}','${sessionInfo.publicIp}','${sessionInfo.mmCode}')"/></div>
		 			
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
			<img id="list" src='resources/images/list.png'/>
		</div>
		
		<div id="mid">
			<div id="sideBar">
     			<div id="sideContents">
     				<div id="sideTitle">
     					<div id = "inTitle">RENTAL</div>
     				</div>
     				<div id="campingBar" class="menuTop" onClick ="openCloseMenu('a')">
     					<div class="text1" >캠핑 장비
     						<div class="triangle" ></div>
     					</div>
     				</div>
     				<div id="campingItem" style="display:block">
	     				<div id="cpMenu1" class="cpMenu" >
	     					<div class="textLocation">캠핑 패키지</div>
	     				</div>
	     				<div id="cpMenu2" class="cpMenu" >
	     					<div class="textLocation">텐트</div>
	     				</div>
	     				<div id="cpMenu3" class="cpMenu" >
	     					<div class="textLocation">타프</div>
	     				</div>
	     				<div id="cpMenu4" class="cpMenu" >
	     					<div class="textLocation">매트/침낭</div>
	     				</div>
	     				<div id="cpMenu5" class="cpMenu" >
	     					<div class="textLocation">테이블/체어</div>
	     					</div>
	     				<div id="cpMenu6" class="cpMenu" >
	     					<div class="textLocation">바베큐용품</div>
	     				</div>
	     				<div id="cpMenu7" class="cpMenu" >
	     					<div class="textLocation">기타용품</div>
	     				</div>
     				</div>
     				
     				<div id="fishingBar" class="menuTop" onClick ="openCloseMenu('b')">
     					<div class="text1">낚시 장비
     						<div class="triangle"></div>
     					</div>
     				</div>
     				<div id="fishingItem" style="display:none">
	     				<div id="fiMenu1" class="fiMenu" >
	     					<div class="textLocation" >바다 장비</div>
	     				</div>
	     				<div id="fiMenu2" class="fiMenu" >
	     					<div class="textLocation" >민물/중층 장비</div>
	     				</div>
	     				<div id="fiMenu3" class="fiMenu" >
	     					<div class="textLocation" >루어 장비</div>
	     				</div>
	     				<div id="fiMenu4" class="fiMenu" >
	     					<div class="textLocation" >릴</div>
	     				</div>
	     				<div id="fiMenu5" class="fiMenu" >
	     					<div class="textLocation" >줄(라인)</div>
	     				</div>
	     				<div id="fiMenu6" class="fiMenu" >
	     					<div class="textLocation" >기타용품</div>
	     				</div>
     				</div>
     			</div>
     		</div>
     		
     		<div id="regForm">
     			
     		</div>
		</div>
				
		<div id="bottom">
         <div id="bottom_store">여기가 좋을 지도¿</div>
         <div id="bottom_store2">CS NUMBER : 1644 - 3681｜사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</div>
         <div id="bottom_store3">문의 : handaeng1220@gmail.com</div>
      </div>
		
	</div>


</body>

</html>