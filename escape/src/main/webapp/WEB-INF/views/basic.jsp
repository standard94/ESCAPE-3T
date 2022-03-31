<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면틀</title>
</head>
<script src="resources/js/resource.js"></script>



<link rel="stylesheet" type="text/css" href="resources/css/topBottom1.css" />
<link rel="stylesheet" type="text/css" href="resources/css/medium.css" />

<body onLoad = "getPublic(),initPage('${msg}')">
	
		
		<div id="basic">
			<div id="top">
				<div id="logo" onClick="getNewPage('basic')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
				<div id="box1">
		 			<div id="login1"><span class="top_menu" onClick="getNewPage('memberLogIn')" >로그인/</span><span class="top_menu" onClick="getNewPage('signUp')">회원가입</span></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
				<img id="list" onClick="openModal(this)" src='resources/images/list.png'/>
			</div>
		   
			<div id="mid">
			
			<div id="remocon" style="z-index: 3; padding:1% 1%;  height: 50%;  width: 9%; border: 1px solid #999966; background-color: white; position : absolute; right:1%; top:10%; box-shadow: 3px 3px 10px #566270; border-radius: 10px;">
                  <button id="rmcHome" onClick="getNewPage('basic')" style=" height: 15%;  width: 50%; border: 1px solid #999966; font-size: 15pt; font-weight: bold; background-color: #292929; color: white; border-radius: 10px; margin: 4% 25%;">HOME</button>
                  <button id="rmcMap" onClick="getNewPage('campingMap')" style=" height: 15%;  width: 100%; border: 1px solid #999966; font-size: 12pt; background-color: white; border-radius: 10px; margin: 1%;">지도</button>
                  <button id="rmcRental" onClick="getNewPage('campingRental')" style=" height: 15%;  width: 100%; border: 1px solid #999966; font-size: 12pt; background-color: white; border-radius: 10px; margin: 1%;">렌탈</button>
                  <button id="rmcMyPage" style=" height: 15%;  width: 100%; border: 1px solid #999966; font-size: 12pt; background-color: white; border-radius: 10px; margin: 1%;">마이페이지</button>
                  <button id="rmcRtStore" onClick="getNewPage('storeInfoPage')" style=" height: 15%;  width: 100%; border: 1px solid #999966; font-size: 12pt; background-color: white; border-radius: 10px; margin: 1%;">렌탈 업체</button>
                  <button id="rmcTwoMore" style=" height: 15%;  width: 100%; border: 1px solid #999966;  background-color: white; border-radius: 10px; margin: 1%;">두개더</button>   
               </div>
               
				<div id="line1"></div>
				<div id="box2">
					
					<div id="campingMap"><span onClick="getNewPage('campingMap')"><img id="campingMap1" src='resources/images/tent.png' onMouseOver="this.src='resources/images/campingPoint.jpg'" onmouseout="this.src='resources/images/tent.png'"/></span></div>
					<div id="fishingMap"><span onClick="getNewPage('fishingMap')"><img id="fishingMap1" src='resources/images/fishing.png' onMouseOver="this.src='resources/images/fishingPoint.jpg'" onmouseout="this.src='resources/images/fishing.png'"/></span></div>
					<div id="rentalEquipment"><span onClick="getNewPage('campingRental')"><img id="rentalEquipment1" src='resources/images/sleeping-bag.png' onMouseOver="this.src='resources/images/rentalEquipment.jpg'" onmouseout="this.src='resources/images/sleeping-bag.png'"/></span></div>
					<div id="rentalStore"><span onClick="getNewPage('storeInfoPage')"><img id="rentalStore1" src='resources/images/location.png' onMouseOver="this.src='resources/images/rentalStore.jpg'" onmouseout="this.src='resources/images/location.png'"/></span></div>
					<div id="buy"><span onClick="getNewPage('chooseStoreInfoPage')"><img id="buy1" src='resources/images/changeBuy.png' onMouseOver="this.src='resources/images/buy.jpg'" onmouseout="this.src='resources/images/changeBuy.png'"/></span></div>
					
				</div>
				
			
				<div id="rank"><span>핫 딜!</span></div>
				<div id="rank_list">
			
  
				</div>
			</div>
			
			<div id="bottom1">
				<div id="store_name"><span class="end">여기가 좋을 지도¿</span></div>
				<div id="cs_number">
					<div id="cs"><span class="end">CS NUMBER</span></div>
					<div id="number"><span class="end">1644 - 3681</span></div>
				</div>
				<div id="nate1"><span class="nate">21968 인천광역시 연수구 원인재로 81(동춘동, 삼성럭키아파트) ㈜CHILDNATE｜대표이사 : NATE</span></div>
				<div id="nate2"><span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span></div>
				<div id="nate3"><span class="nate">문의 : handaeng1220@gmail.com</span></div>
				<div id="nate4"><span class="nate">㈜CHILDNATE의 사전 서면동의 없이 여기 좋을 지도 사이트(PC, 모바일, 앱)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</span></div>
			</div>
			
			<div class="container" id="container">
			<div id="fishingBox"></div>
			
			<div id="campingBox"></div>
			
			<div id="myPageBox"></div>
			
			<div id="csCenterBox"></div>
			</div>
		</div>
	
	<script>
   		document.addEventListener('scroll', function() {
        var currentScrollValue = document.documentElement.scrollTop;
        console.log('currentScrollValue is ' + currentScrollValue);
        if(currentScrollValue>350){
           document.getElementById("remocon").style.top = '38%'
        }else if(currentScrollValue<350 && currentScrollValue>250){
           document.getElementById("remocon").style.top = '25%'
        }else{
           document.getElementById("remocon").style.top = '10%'
        }
   		});

</script>

</body>
</html>