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
<body onLoad="delrecord();chooseFishingStoreList('1', '10', '1000');getFishingStorePage('1', '10', '1000')">

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
				<div id="sideBar">
     			<div id="sideContents">
     				<div id="sideTitle">
     					<div id = "inTitle">RENTAL STORE</div>
     				</div>
     				<div id="myRentalGps" class="menuTop" onClick ="openCloseMenu('a')">
     					<div class="text1" >ㅡ내 주변 렌탈업체 찾기
     					</div>
     				</div>
     		
     				
     				<div id="fishingRental" class="menuTop" onClick ="delrecord();chooseFishingStoreList('1', '10', '2000');getFishingStorePage('1', '10', '2000');">
     					<div class="text1">ㅡ낚시 렌탈업체
     					</div>
     				</div>
     				
     				<div id="campingRental" class="menuTop" onClick ="delrecord();chooseFishingStoreList('1', '10', '1000');getFishingStorePage('1', '10', '1000');">
     					<div class="text1">ㅡ캠핑 렌탈업체
     					</div>
     				</div>
     				
     			</div>
     		</div>
				<div id="regForm">
     			<div id="topForm">
						<div id="leftTitle">
							<div id="subTitle">
							<div id="rentalGoods">렌탈업체</div>
							
							
							<span id="storeName2" class = "txt">업체별</span>
							<span id="arrow1" class = "txt">></span>
							<span id="category" class = "txt" ></span>
							</div>
						</div>
						<div id="rightTitle">
							<div id="rightTop">
							<label for="job"></label>
								<select id="job" name="job" size="1">
								<option value="">전체</option>
								<option value="srAddress">지역명</option>
								<option value="goName">상품명</option>
								</select>
								<input id="searchText" type="text" value="" placeholder="검색어 입력" onClick=""/>
								<button id="searchClick" >검색</button>
							</div>
						</div>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83c735083178ecf82197f105cee12951&libraries=services"></script>

</body>
</html>