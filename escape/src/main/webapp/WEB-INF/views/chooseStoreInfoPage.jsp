<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클릭한 렌탈업체 상세 정보 페이지</title>
</head>
<script src="resources/js/resource.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/chooseStoreInfoPage.css" />
<body onLoad="findStoreInfo('S003')">

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
							<span id="category" class = "txt" >낚시용품</span>
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
					<div id="storeTitle" name="storeTitle">제목</div>
					
					<div id="line1">
						<div id="storeAddress" name="storeAddress">주소</div>
						<div id="storeNumber" name="storeNumber">전화번호</div>
						<div id="storeEmail" name="storeEmail">이메일</div>
					</div>
					
					<div id="line2">
						<div id="storeMap" name="storeMap">지도</div>
						<div id="storeImage" name="storeImage">이미지</div>
					</div>
					
					<div id="storeDetail" name="storeDetail">내용</div>
					
     				<div id="line3">
     					<div id="storeGoods1" name="storeGoods1">상품</div>
     					<div id="storeGoods1" name="storeGoods1">상품</div>
     					<div id="storeGoods1" name="storeGoods1">상품</div>
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
<script>

function getAjaxJson(action, data, fn) {
    
    const ajax = new XMLHttpRequest();

    ajax.onreadystatechange = function() {
       if (ajax.readyState == 4 && ajax.status == 200) {
          
          if (ajax.responseText != "") {
             if (ajax.responseText.indexOf(":") > 0) {
                window[fn](JSON.parse(ajax.responseText));
             } else {
                window[fn](ajax.responseText);
             }
          }
       }
    };
    ajax.open("post", action, true);
    ajax.setRequestHeader("Content-type", "application/json;charset=utf-8");
    ajax.send(data);
   }

function findStoreInfo(pSrCode) {
  
    let jsonData = [];
    jsonData.push({
       srCode : pSrCode
    });
    const clientData = JSON.stringify(jsonData);
    alert(clientData);
    getAjaxJson("findStoreInfo", clientData, "getStoreInfo");
 }

function getStoreInfo(info){
	console.log(info)
}

</script>
</body>
</html>