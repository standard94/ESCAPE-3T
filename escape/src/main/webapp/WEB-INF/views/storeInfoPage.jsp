<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌탈업체 정보 페이지</title>
</head>
<script src="resources/js/resource.js"></script>
<script src="resources/js/storeInfoPage.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/storeInfoPage.css" />
<body onLoad="delrecord();chooseFishingStoreList('1', '10', '2000');getFishingStorePage('1', '10', '2000')">

		<div id="basic">
			<div id="top">
				<div id="logo" onClick="getNewPage('basic')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" /></div>
				
				<div id="box1">
		 			<div id="login1"><span class="top_menu" onClick="getNewPage('memberLogIn')" >로그인/</span><span class="top_menu"  onClick="getNewPage('signUp')">회원가입</span></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
				<img id="list" src='resources/images/list.png'/>
			</div>
			
			
			<div id="mid">
				<div id="leftLine">
					<div id="titleDiv">
						<div id="title">렌탈업체</div>
						<div id="titleEng">RENTAL STORE</div>
					</div>
					<div id="leftMenu">
						<div id="myRentalGps" onClick="" >ㅡ 내 주변 렌탈업체 찾기</div>
						<div id="fishingRental" onClick="delrecord();chooseFishingStoreList('1', '10', '2000');getFishingStorePage('1', '10', '2000');" >ㅡ 낚시 렌탈업체</div>
						<div id="campingRental" onClick="delrecord();chooseFishingStoreList('1', '10', '1000');getFishingStorePage('1', '10', '1000');" >ㅡ 캠핑 렌탈업체</div>
					</div>
				</div>
				<div id="rightLine">
					<div id="fiter">
						<select id="job" name="job" size="1">
						<option value="">전체</option>
						<option value="지역명">지역명</option>
						<option value="상품명">상품명</option>
						</select>
						<div id="search2"><input id="searchFont2" type="text"  name="" placeholder="" /><input id="searchZoom2" class="divButton2" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
					
					</div>
					<div id="list2">
						
					</div>
				</div>
			
			</div>
			
			
			<div id="bottom">
				<div id="store_info"><span class="end">여기가 좋을 지도¿ CS NUMBER : 1644 - 3681</span></div>
				<div id="nate2"><span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span></div>
				<div id="nate3"><span class="nate">문의 : handaeng1220@gmail.com</span></div>
			</div>
			</div>



</body>
</html>