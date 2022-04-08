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
<body onLoad= 'init("${objName}")'/>

		<div id="basic">
			<div id="top">
				<div id="logo" onClick="getNewPage('basic')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" /></div>
				
				<div id="box1">
		 			<div id="login1"><span class="top_menu" onClick="getNewPage('memberLogIn')" >로그인/</span><span class="top_menu"  onClick="getNewPage('signUp')">회원가입</span></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu"  onClick="notMember()">장바구니</span></div>
				</div>
			</div>
			
			
			<div id="mid">
				<div id="sideBar">
     			<div id="sideContents">
     				<div id="sideTitle">
     					<div id = "inTitle">RENTAL STORE</div>
     				</div>
     				<div id="myRentalGps" class="menuTop" onClick ="getNewPage('campingMap')">
     					<div class="text1" >ㅡ내 주변 렌탈업체 찾기
     					</div>
     				</div>
     		
     				
     				<div id="fishingRental" class="menuTop" onClick ="getNewPage('storeInfoPage')">
     					<div class="text1">ㅡ낚시 렌탈업체
     					</div>
     				</div>
     				
     				<div id="campingRental" class="menuTop" onClick ="getNewPage('storeInfoPage0')">
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
					<div id="storeTitle">[${storeInfo[0].srName}]</div>
					
					<div id="line0">
						<div id="address">찾아오는길 ☟</div>
					</div>
					
					<div id="line1">
						<div id="storeAddress">${storeInfo[0].srAddress}</div>
						<div id="storeNumber">${storeInfo[0].srNumber}</div>
						<div id="storeEmail">${storeInfo[0].srEmail}</div>
					</div>
				
					<div id="line2">
						<div id="storeMap">지도</div>
						<div id="storeImage"><img id="storeImage1" src="/resources/images/store/${storeInfo[0].srImage}"/></div>
					</div>
					
					<div id="storeDetail">${storeInfo[0].srDetails}</div>
					<div id="clickStore" onClick="getNewPage('campingRental')" onMouseOver="this.style.color='blue'" onmouseout="this.style.color='red'">>이 업체 상품보러 가기</div>
					
     				<div id="line3">
     					<div class="box">
  							<div class="marquee">
   								<p><img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[0].gdImage}"/>
   	  							   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[1].gdImage}"/>
   	  					 		   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[2].gdImage}"/>
   	 							   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[3].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[4].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[5].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[6].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[7].gdImage}"/>
   	 							   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[8].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[9].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[10].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[11].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[12].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[13].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[14].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[15].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[16].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[17].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[18].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[19].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[20].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[21].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[22].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[23].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[24].gdImage}"/>
   								   <img id="storeGoods2" src="/resources/images/cpFi/${storeInfo[25].gdImage}"/>
   	 						   </p>
							</div>
						</div>
					</div>
     				
				</div>
			
			</div>
			
			

 

			
			
			<div id="bottom">
				<div id="store_info"><span class="end">여기가 좋을 지도¿ CS NUMBER : 1644 - 3681</span></div>
				<div id="nate2"><span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span></div>
				<div id="nate3"><span class="nate">문의 : handaeng1220@gmail.com</span></div>
			</div>
		</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83c735083178ecf82197f105cee12951&libraries=services"></script>
<script>

var mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div 
mapOption = {
   center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
   level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
 var map = new kakao.maps.Map(mapContainer, mapOption); 


var geocoder = new kakao.maps.services.Geocoder();

var srAddress = document.getElementById('storeAddress').innerText;

geocoder.addressSearch(srAddress, function(result, status) {
      // 정상적으로 검색이 완료됐으면 
      if (status === kakao.maps.services.Status.OK) {
         // 마커 하나를 지도위에 표시합니다 
         addSrMarker(new kakao.maps.LatLng(result[0].y, result[0].x),map);
      }
   });

function addSrMarker(position,pMap){
  // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
     map : pMap,
     position : position

    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(pMap);

 pMap.setCenter(position);
 }

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
    getAjaxJson("findStoreInfo", clientData, "getStoreInfo");
 }

function getStoreInfo(info){
	console.log(info)
}

</script>
</body>
</html>