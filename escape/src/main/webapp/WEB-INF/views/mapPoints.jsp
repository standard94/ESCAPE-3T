<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta charset="utf-8">
    <title>낚시 포인트</title>
   
</head>
<link rel="stylesheet" type="text/css" href="resources/css/mapPoints.css" />
<script src="resources/js/resource.js"></script>
<body onLoad="getCampingList()">

	<div id="basic">
		<div id="top">
			<div id="logo"/></div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
				<div id="box1">
		 			<div id="login1"><span class="top_menu" onClick="getNewPage('memberLogIn')" >로그인/</span><span class="top_menu" onClick="getNewPage('commonSignUp')">회원가입</span></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
			<img id="list" src='resources/images/list.png'/>
		</div>
		
		<div id="mid">
			<div id="leftList">
				<div id="listFilter"><input id="insert" type="button" value="등록" onClick=""/>
					<label for="job">필터링</label> 
		<select id="job" name="job" size="1">
			<option value="">눌러봅시당</option>
			<option value="조회순">조회순</option>
			<option value="조아요순">조아요순</option>
		</select>
					</div>
					<div id="listPoints">
						<div id="mySideStore" onClick="">카라반</div>
						<div id="fishingPoint" onClick="">클램핑</div>
						<div id="camping" onClick="">캠핑</div>
						<div id="glamping" onClick="">낚시 포인트</div>
						<div id="caravan" onClick="">내 주변 업체</div>
					</div>
				<div id="campingList">
				</div>
			</div>
			
			
   	 	<div id="map"></div>
    		
     
		</div>
				
				
				
		
		
		
		<div id="bottom">
			<div id="store_info"><span class="end">여기가 좋을 지도¿ CS NUMBER : 1644 - 3681</span></div>
			<div id="nate2"><span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span></div>
			<div id="nate3"><span class="nate">문의 : handaeng1220@gmail.com</span></div>
		</div>
		
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83c735083178ecf82197f105cee12951&libraries=services"></script>
	<script>
	
	
	
	function getAjaxJson(action, data, fn) {
		const ajax = new XMLHttpRequest();

		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
				if(ajax.responseText !=""){
					if(ajax.responseText.indexOf(":")>0){
						window[fn](JSON.parse(ajax.responseText));
					}else{
						window[fn](ajax.responseText);
					}
				}
			}
		};
		ajax.open("post", action, true);
		ajax.setRequestHeader("Content-type","application/json;charset=utf-8");
		ajax.send(data);
	}
	
	function getCampingList(){
		let jsonData=[];
		jsonData.push({maMmCode:"9999"});
		const clientData = JSON.stringify(jsonData);
		getAjaxJson("GetCampingList",clientData,"setPoint");
	}
	
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 


var geocoder = new kakao.maps.services.Geocoder();


var campingList = new Array();

var campList = JSON.stringify('${maAddress}');

for(var k in campList){
	var $obj = campList[k];
	var aa = $obj.maAddress;
	campingList.push(aa);
}

campingList.forEach(function(addr, index){
	
	geocoder.addressSearch(addr , function(result, status){
		
		if(status === kakao.maps.services.Status.ok){
		
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		var marker = new kakao.maps.Marker({
			map: map,
			position: coords
		});
		
		var content = '<div class="overlay_info">';
		content += '    <div class="desc">';
        content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
        content += '        <span class="address">'+ maAddress[index] +'</span>';
        content += '    </div>';
        content += '</div>';

		var infowindow = new kakao.maps.InfoWindow({
			content: content,
				disableAutoPan: true
		});
		infowindow.open(map, marker);
			if(index == 0){
				map.setCenter(coords);
		
			}
		}
	});
});


/* function setPoint(campingList){
	alert(JSON.stringify(campingList));
	
	geocoder.addressSearch(JSON.stringify(campingList) , function(result, status){
		
	}
}*/
 

/* 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}*/
</script>

</body>

</html>