<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낚시 포인트</title>

</head>

<style>
#place-content:after {
   top: 98.5%;
   transform: translate(-1px, 3px);
   left: 251px;
   border: solid transparent;
   content: " ";
   height: 0;
   width: 0;
   position: absolute;
   pointer-events: none;
   border-color: rgba(56, 77, 157, 0);
   border-top-color: white;
   border-width: 25px;
   margin-left: -48px;

}
</style>

<link rel="stylesheet" type="text/css" href="resources/css/mapPoints_logIn.css" />
<body onLoad="checkCa('C002'), init('${objName}')"/>

   <div id="basic">
      <div id="top">
         <div id="logo" onClick="getNewPageMember('${sessionInfo.mmId}','memberMain','${sessionInfo.publicIp}','${sessionInfo.mmCode}')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
				<div id="box1">
		 			<div id="login1"><span class="top_menu" id='mmId' >${sessionInfo.mmId}님</span>
		 			<input id="logOutButton" type = "button" value= "로그아웃" onClick="logOutMember('${sessionInfo.mmId}','${sessionInfo.publicIp}','${sessionInfo.mmCode}')"/></div>
		 			
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu"onClick="getNewPageMember('${sessionInfo.mmId}','cart_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}')">장바구니</span></div>
				</div>
      </div>
      
      <div id="mid">
         <div id="leftList">
            <div id="listFilter"><input id="insert" type="button" value="등록" onClick="getNewPageMember('${sessionInfo.mmId}','regMapMember','${sessionInfo.publicIp}','${sessionInfo.mmCode}')"/>
               <label for="job"></label> 
      <select id="job" name="job" size="1">
         <option value="">전체</option>
         <option value="조회순">조회순</option>
         <option value="조아요순">좋아요순</option>
         <option value="조아요순">찜순</option>
      </select>
               </div>
               
                <div id="listPoints">
                  <div id="mySideStore" onClick="delrecord();getNewPageMember('${sessionInfo.mmId}','caravanMap_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}');">카라반</div>
                  <div id="fishingPoint" onClick="delrecord();getNewPageMember('${sessionInfo.mmId}','glampingMap_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}');">글램핑</div>
                  <div id="camping" onClick="delrecord(); getNewPageMember('${sessionInfo.mmId}','campingMap_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}');">캠핑</div>
                  <div id="glamping" onClick="getNewPageMember('${sessionInfo.mmId}','fishingMap_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}');">낚시 포인트</div>
                  <div id="caravan" onClick="nearStore()">내 주변 업체</div>
               </div>
               
               <div id="listButton">
                  <ul id="campingPage">
                      </ul>
               </div>
            <div id="campingList" class="container">   
            </div>
         </div>
         
         <div id="rightview" class="shadow">
         </div>
       
         	<div id="remocon" style="z-index: 3; padding:1% 1%;  height: 50%;  width: 9%; border: 1px solid #999966; background-color: white; position : absolute; right:1%; top:10%; box-shadow: 3px 3px 10px #566270; border-radius: 10px;">
                  <button id="rmcHome" onClick="getNewPageMember('${sessionInfo.mmId}','memberMain','${sessionInfo.publicIp}','${sessionInfo.mmCode}')" >HOME</button>
                  <button id="rmcMap" onClick="getNewPageMember('${sessionInfo.mmId}','campingMap_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}')">지도</button>
                  <button id="rmcRental" onClick="getNewPageMember('${sessionInfo.mmId}','campingRental_member,'${sessionInfo.publicIp}','${sessionInfo.mmCode}')">렌탈</button>
                  <button id="rmcMyPage" onClick="getNewPageMember('${sessionInfo.mmId}','cart_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}')" >장바구니</button>
                  <button id="rmcRtStore" onClick="getNewPageMember('${sessionInfo.mmId}','storeInfoPage2','${sessionInfo.publicIp}','${sessionInfo.mmCode}')" >렌탈 업체</button>
                  
               </div>
         
          <div id="map"></div>
          
      </div>

      <div id="bottom">
         <div id="bottom_store">여기가 좋을 지도¿</div>
         <div id="bottom_store2">CS NUMBER : 1644 - 3681｜사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</div>
         <div id="bottom_store3">문의 : handaeng1220@gmail.com</div>
      </div>
      
   </div>
<script src="resources/js/resource.js"></script>
<script src="resources/js/regMapPoints.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83c735083178ecf82197f105cee12951&libraries=services"></script>
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
   
   var mapContainer = document.getElementById('map'), // 지도의 중심좌표
   
   mapOption = {
   
      center : new kakao.maps.LatLng(37.57437853540586, 126.9767793075412),   // 지도의 중심좌표
      level : 9   // 지도의 확대 레벨
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
   
   function checkCa(caCode){
      shareCaCode(caCode);
      
      if (navigator.geolocation) {

         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다      
            searchAddrFromCoords(locPosition, function(result, status) {
               if (status === kakao.maps.services.Status.OK) {
                  myMarker(locPosition, result[0].address_name, result[0].region_1depth_name, caCode);
               }
            });
            // 마커와 인포윈도우를 표시합니다

         });

      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

         var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '시스템 오류 : 주소를 찾을 수 없습니다.'

         myMarker(locPosition, message,'', caCode);
      }
   }
   

   function searchAddrFromCoords(coords, callback) {
      // 좌표로 행정동 주소 정보를 요청합니다
      geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
   }

   var markers = [];

   function setMarkers(map) {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
      }
   }
   
   var mks = [];

   function setMks(map) {
      for (var i = 0; i < mks.length; i++) {
         mks[i].setMap(map);
      }
   }
   
   
   // 지도에 마커와 인포윈도우를 표시하는 함수입니다
   function myMarker(locPosition, message, pHaName, caCode) {
	   var haName;
	      
	   var cmpList = document.getElementById("campingList");
	   var page = document.getElementById("campingPage");
	   while (page.hasChildNodes()) {
		   
	    	  page.removeChild(page.firstChild);
	       }
	   
	   while (cmpList.hasChildNodes()) {
	   cmpList.removeChild(cmpList.firstChild);
	   }
	   
      if (clickedoverlay) {
         clickedoverlay.setMap(null);
      }
      
      setSrMarkers(null);
      
      // 마커를 생성합니다
      var myMarker = new kakao.maps.Marker({
         map : map,
         position : locPosition
      });

      if(pHaName.substring(0,1)=="충" || pHaName.substring(0,1)=="전"){
    		haName = pHaName.substring(0,1)+pHaName.substring(2,3);
    	}else if(pHaName.substring(0,1)=="경"){
    		if(pHaName.substring(1,2)=="기"){
    			haName = pHaName.substring(0,2);
    		}else{
    			haName = pHaName.substring(0,1)+pHaName.substring(2,3);
    		}
    	}else{
    		haName = pHaName.substring(0,2);
    	}
      getStoreList('1000');
      
      getCampingList(caCode, '1000', haName)
      
      getCampingPage('1','10', caCode, '1000', haName);

      chooseCampingList('1','10', caCode,'1000', haName);

      map.setCenter(locPosition);

      // 생성된 마커를 배열에 추가합니다
      mks.push(myMarker);

      document.getElementById("mp").innerText = message;

      // 현재 지도의 레벨을 얻어옵니다
      var level = map.getLevel();

      // 지도를 1레벨 올립니다 (지도가 축소됩니다)
      map.setLevel(9);
   }
   
   //캠핑장리스트 가져오기
   function getCampingList(pCpCaCode, pCpMaCfCode, pHaName) {
   
      setMks(null);
      setMarkers(null);
      
      let jsonData = [];
      jsonData.push({
         cpCaCode : pCpCaCode,
         cpMaCfCode : pCpMaCfCode,
         haName : pHaName
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("GetCampingList", clientData, "setPoint");
   }
   
   function setPoint(list) {
	 
	   if(list[0].maAddress!=null){
		   for (let n = 0; n < list.length; n++) {
		         geocoder.addressSearch(list[n].maAddress, function(result, status) {
		            // 정상적으로 검색이 완료됐으면 
		            if (status === kakao.maps.services.Status.OK) {

		               // 마커 하나를 지도위에 표시합니다 
		               addMarker(new kakao.maps.LatLng(result[0].y, result[0].x),
		                     list[n].cpName, list[n].maAddress,
		                     list[n].cpNumber, list[n].cpImage,
		                     list[n].cpCaCode, list[n].cpMaCfCode,
		                     list[n].cpCode, new kakao.maps.LatLng(
		                           parseFloat(result[0].y) + 0.11,
		                           parseFloat(result[0].x) + 0.23));
		            }
		         });
		      }
	   }
   }
   
   //업체리스트 가져오기
   function getStoreList(pSrCfCode) {
      setMarkers(null);
      
      let jsonData = [];
      jsonData.push({
         srCfCode : pSrCfCode
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("GSL", clientData, "setStorePoint");
   }
   
   function setStorePoint(list) {
	   if(list[0].srAddress!=null){
		   for (let n = 0; n < list.length; n++) {
		         geocoder.addressSearch(list[n].srAddress, function(result, status) {
		            // 정상적으로 검색이 완료됐으면 
		            if (status === kakao.maps.services.Status.OK) {

		               // 마커 하나를 지도위에 표시합니다 
		               addSrMarker(new kakao.maps.LatLng(result[0].y, result[0].x),
		                     list[n].srName, list[n].srAddress,
		                     list[n].srNumber, list[n].srImage,
		                     list[n].srCfCode,
		                     list[n].srCode,
		                     new kakao.maps.LatLng(parseFloat(result[0].y) + 0.11, parseFloat(result[0].x) + 0.23));
		            }
		         });
		      }
	   }
   }

   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();

   var clickedoverlay = null;

   function addMarker(position, name, address, phone, img, cpC, cpM, cp, wishPos) {
      if(cpC=="C001"){
            var imageSrc = 'resources/images/camping.png' // 마커이미지의 주소입니다
         }else if(cpC=="C002"){
            var imageSrc = 'resources/images/glamping.png' // 마커이미지의 주소입니다
         }else if(cpC=="C003"){
            var imageSrc = 'resources/images/caravan.png' // 마커이미지의 주소입니다
         }else{
            
         }    
      imageSize = new kakao.maps.Size(28, 28) // 마커이미지의 크기입니다

      // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize), markerPosition = position

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map : map,
         position : position,
         image : markerImage

      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      // 생성된 마커를 배열에 추가합니다
      markers.push(marker);

      kakao.maps.event.addListener(marker, 'click', function() {
         if (clickedoverlay) {
            clickedoverlay.setMap(null);
         }
         findCampingDetail(cpC, cpM, cp);
         overlay.setMap(map);
         clickedoverlay = overlay;
         map.setCenter(wishPos);

         // 현재 지도의 레벨을 얻어옵니다
         var level = map.getLevel();

         // 지도를 1레벨 올립니다 (지도가 축소됩니다)
         map.setLevel(9);
      });
   

      var overlay = new kakao.maps.CustomOverlay({
         yAnchor : 1.2,
         position : position
      });

      makeOverlay(name, img, phone, address, overlay);

   }
   
   var srMarkers = [];

   function setSrMarkers(map) {
      for (var i = 0; i < srMarkers.length; i++) {
         srMarkers[i].setMap(map);
      }
   }
   
   function addSrMarker(position, name, address, phone, img, srCf, sr,
         wishPos) {
      var imageSrc = 'resources/images/store.png', // 마커이미지의 주소입니다    
      imageSize = new kakao.maps.Size(28, 28) // 마커이미지의 크기입니다

      
      
      // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize), markerPosition = position
      
      var myPoint= document.getElementById("mp").innerText
      if(address.substring(0,2)== myPoint.substring(0,2) || address.substring(0,1)+address.substring(2,3)== myPoint.substring(0,2)){
         
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map : map,
         position : position,
         image : markerImage

      });
      
      marker.setMap(map);
      
      // 생성된 마커를 배열에 추가합니다
      srMarkers.push(marker);

      kakao.maps.event.addListener(marker, 'click', function() {
         if (clickedoverlay) {
            clickedoverlay.setMap(null);
         }
         findStoreDetail(srCf, sr);
         overlay.setMap(map);
         clickedoverlay = overlay;
         map.setCenter(wishPos);

         // 현재 지도의 레벨을 얻어옵니다
         var level = map.getLevel();

         // 지도를 1레벨 올립니다 (지도가 축소됩니다)
         map.setLevel(9);
      });
   
      }
      var overlay = new kakao.maps.CustomOverlay({
         yAnchor : 1.2,
         position : position
      });
     
      makeOverlay(name, img, phone, address, overlay);

   }

   //캠핑 : 클릭한 페이지에 해당하는 리스트 불러오기
   function chooseCampingList(pPageNumber, pAmount, pCpCaCode, pCpMaCfCode, pHaName) {
      let jsonData = [];
      jsonData.push({
         pageNumber : pPageNumber,
         amount : pAmount,
         cpCaCode : pCpCaCode,
         cpMaCfCode : pCpMaCfCode,
         haName : pHaName
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("ChooseCampingList", clientData, "getPoint");
   }
   
   //캠핑 페이지 번호 불러오기
   function getCampingPage(pPageNumber, pAmount, pCpCaCode, pCpMaCfCode, pHaName) {
      let jsonData = [];
      jsonData.push({
         pageNumber : pPageNumber,
         amount : pAmount,
         cpCaCode : pCpCaCode,
         cpMaCfCode : pCpMaCfCode,
         haName : pHaName
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("GetCampingPage", clientData, "alertPage");
   }
   
   function shareCaCode(caCode){
      //내 위치 변경 버튼 생성
      var changeMyPoint = document.createElement("div")
      changeMyPoint.id = "cmp"
      changeMyPoint.innerHTML = "내 위치 변경"
      changeMyPoint.style.cssText = 'z-index:2; color:white; position : absolute; background: #292929; width:6%; height:2.5%; padding:0.2% 1%;'
      changeMyPoint.onclick = function() {

         //다음 주소 찾기 창 생성
         var findMyPoint = document.createElement("div")
         findMyPoint.id = "fmp"
         findMyPoint.style.cssText = 'z-index:1; background: white; position : absolute; top:3.2%; width:38%; height: 58%;'
         mapContainer.appendChild(findMyPoint)

         //다음 주소 찾기 창 닫기 버튼 생성
         var cmpClose = document.createElement("div")
         cmpClose.id = "mpC"
         cmpClose.innerHTML = "X"
         cmpClose.style.cssText = 'z-index:2; color:white; position : absolute; bottom:100%; right:0%; background: red; width:2.1%; height:4.4%; padding: 0.5% 2.3%;'
         cmpClose.onclick = function() {
            mapContainer.removeChild(mapContainer.lastChild);
         }
         findMyPoint.appendChild(cmpClose)

         //다음 주소 찾기 div내 구성
         new daum.Postcode({
            oncomplete : function(data) {

               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
               // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var jibunAddr = data.jibunAddress; // 지번 주소 변수
               // 우편번호와 주소 정보를 해당 필드에 넣는다.

               mapContainer.removeChild(mapContainer.lastChild);

               geocoder.addressSearch(data.address, function(result, status) {
                  // 정상적으로 검색이 완료됐으면 
                  if (status === kakao.maps.services.Status.OK) {
                     // 마커 하나를 지도위에 표시합니다 
                     myMarker(new kakao.maps.LatLng(result[0].y,
                           result[0].x), result[0].address.address_name, result[0].road_address.region_1depth_name, caCode);
                  }
               });
            }
         }).embed(findMyPoint);
      };
      
      mapContainer.appendChild(changeMyPoint)

   }
   
   var myPoint = document.createElement("div")
   myPoint.id = "mp"
   myPoint.style.cssText = 'z-index:2; color:white; opacity : 0.9; position : absolute; left:8%; background: black; width:25.5%; height:2.5%; padding:0.2% 1%;'
   mapContainer.appendChild(myPoint)

   // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
   var mapTypeControl = new kakao.maps.MapTypeControl();

   // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
   // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
   map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

   // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

   function alertPage(jsonData) {
	  
      let page = document.getElementById("campingPage");
      let pageInfo = "";
      let startPage = jsonData.startPage - 1;
      let endPage = jsonData.endPage + 1;
      
      makePage(jsonData.haName, page, pageInfo, startPage, endPage, jsonData.cpCaCode, jsonData.cpMaCfCode, jsonData.pageNumber, jsonData.next, jsonData.prev);
    
   }
   
   function makePage(address, page, pageInfo, startPage, endPage, jsonCpCaCode, jsonCpMaCfCode, jsonPageNumber, jsonNext, jsonPrev){
	   var haName = address.substring(0,2);
	   
 	  if (jsonPrev != false) {

 	         pageInfo = "<div class='pageInfo_btn_prev'><li onClick =\"delrecord();getCampingPage('"
 	               + startPage
 	               + "','10','"
 	               + jsonCpCaCode
 	               + "','"
 	               + jsonCpMaCfCode
 	               + "','"+haName+"');chooseCampingList('"
 	               + startPage
 	               + "','10','"
 	               + jsonCpCaCode
 	               + "','"
 	               + jsonCpMaCfCode + "','"+haName+"');\" >이전</li></div>";

 	      } else {
 	         pageInfo = "<div id='pageInfo_btn_prev_hold'><li>이전</li></div>"
 	      }

 	      for (i = startPage+1; i < endPage; i++) {
 	         if (i == jsonPageNumber) {
 	            pageInfo += "<div class='pageInfo_btn_selected' style='width:4%;' ><li onClick =\"delrecord();getCampingPage('"
 	                  + i
 	                  + "','10','"
 	                  + jsonCpCaCode
 	                  + "','"
 	                  + jsonCpMaCfCode
 	                  + "','"+haName+"');chooseCampingList('"
 	                  + i
 	                  + "','10','"
 	                  + jsonCpCaCode
 	                  + "','"
 	                  + jsonCpMaCfCode + "','"+haName+"');\">" + i + "</li></div>";
 	         } else if (i !== jsonPageNumber) {
 	            pageInfo += "<div class='pageInfo_btn' style='width:4%;'><li onClick =\"delrecord();getCampingPage('"
 	                  + i
 	                  + "','10','"
 	                  + jsonCpCaCode
 	                  + "','"
 	                  + jsonCpMaCfCode
 	                  + "','"+haName+"');chooseCampingList('"
 	                  + i
 	                  + "','10','"
 	                  + jsonCpCaCode
 	                  + "','"
 	                  + jsonCpMaCfCode + "','"+haName+"');\">" + i + "</li></div>";
 	         }
 	      }
 	      if (jsonNext != false) {
 	         pageInfo += "<div class='pageInfo_btn_next'><li onClick =\"delrecord();getCampingPage('"
 	               + i
 	               + "','10','"
 	               + jsonCpCaCode
 	               + "','"
 	               + jsonCpMaCfCode
 	               + "','"+haName+"');chooseCampingList('"
 	               + i
 	               + "','10','"
 	               + jsonCpCaCode
 	               + "','"
 	               + jsonCpMaCfCode + "','"+haName+"');\" );'>다음</li></div>";
 	      }
 	      page.innerHTML = pageInfo;
 	     
   }
   
   /* 모든 record 삭제하기*/
   function delrecord() {
      const div = document.getElementById("campingList");
      while (div.hasChildNodes()) {
         div.removeChild(div.firstChild);
      }

   }

   const columnName = [ "cpImage", "cpName", "maAddress", "haName", "thName",
         "cpNumber" ];
   let column;
   let n = 0;

   function getPoint(list) {
	   if(list[0].maAddress!=null){
		   for (let x = 0; x < list.length; x++) {
		         geocoder.addressSearch(list[x].maAddress, function(result, status) {
		            // 정상적으로 검색이 완료됐으면 
		            if (status === kakao.maps.services.Status.OK) {
		               // 마커 하나를 지도위에 표시합니다 
		               getLeftCampingList(new kakao.maps.LatLng(result[0].y,
		                     result[0].x), list[x].cpImage, list[x].cpName,
		                     list[x].maAddress, list[x].haName, list[x].thName,
		                     list[x].cpNumber, list[x].cpCaCode,
		                     list[x].cpMaCfCode, list[x].cpCode, list[x].haName,
		                     new kakao.maps.LatLng(
		                           parseFloat(result[0].y) + 0.11,
		                           parseFloat(result[0].x) + 0.23));
		            }
		         });
		      }
	   }
      
   }
   
   function getLeftCampingList(mPos, cpI, cpN, maA, haN, thN, cpNb, cpCa,
	         cpMa, cpCd, haN, wishPos) {
	      const div = document.getElementById("campingList");
	      let cpList = createDiv("cpList", "cpList");
	      for (let i = 0; i < 6; i++) {
	         column = createDiv(columnName[i], "cpList " + columnName[i]);
	         column.innerHTML = (i == 0) ? "<img id='image' src=resources/images/camping/"+cpI+"/>"
	               : (i == 1) ? cpN : (i == 2) ? maA : (i == 3) ? haN
	                     : (i == 4) ? "#" + thN : "☎" + cpNb;
	         cpList.appendChild(column);

	         var overlay2 = new kakao.maps.CustomOverlay({
	            yAnchor : 1.2,
	            position : mPos
	         });

	         makeOverlay(cpN, cpI, cpNb, maA, overlay2);
	         cpList.onclick = function() {
	            getCampingList(cpCa, '1000', haN)
	            findCampingDetail(cpCa, cpMa, cpCd);
	            if (clickedoverlay) {
	               clickedoverlay.setMap(null);
	            }
	            overlay2.setMap(map);
	            clickedoverlay = overlay2;
	            map.setCenter(wishPos);

	            // 현재 지도의 레벨을 얻어옵니다
	            var level = map.getLevel();

	            // 지도를 1레벨 올립니다 (지도가 축소됩니다)
	            map.setLevel(9);
	         };
	      }
	      div.appendChild(cpList);
	   }
   
   //특정 캠핑장 상세정보값 보내기
   function findCampingDetail(pCpCaCode, pCpMaCfCode, pcpCode) {
      let jsonData = [];
      jsonData.push({
         cpCode : pcpCode,
         cpCaCode : pCpCaCode,
         cpMaCfCode : pCpMaCfCode
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("findCampingDetail", clientData, "getCampingDetail");
   }
   
   function findStoreDetail(pSrCfCode, pSrCode) {
      let jsonData = [];
      jsonData.push({
         srCode : pSrCode,
         srCfCode : pSrCfCode
      });
      const clientData = JSON.stringify(jsonData);
      getAjaxJson("findStoreDetail", clientData, "getStoreDetail");
   }

   function getCampingDetail(detail) {
         var panel = document.getElementById('rightview');

         var cacode = detail[0].cpCaCode
         var mobile = detail[0].cpNumber
         var admobile = null;

         if (cacode = "C001") {
            cacode = "유료캠핑장"
         } else if (cacode = "C002") {
            cacode = "글램핑"
         } else if (cacode = "C003") {
            cacode = "카라반"
         } else if (cacode = "C004") {
            cacode = "낚시터"
         } else if (cacode = "C005") {
            cacode = "대어자랑"
         } else {
            cacode = "분류설정이필요합니다."
         }

         if (mobile != null) {
            var admobile = mobile.substring(0, 3) + "-" + mobile.substring(3, 7) + "-" + mobile.substring(7)
         } else {
            var admobile = "번호정보 업데이트중"
         }

         if (panel.hasChildNodes()) {
            panel.removeChild(panel.lastChild);
         }

         var rightViewInfo = document.createElement("div")
         rightViewInfo.className = "Info"
         rightViewInfo.id = "InfoBox"
         rightViewInfo.style.cssText = 'border: 4px dashed #bcbcbc; width:95.5%; height:97%; margin: 10px ;'

         var head = document.createElement("div")
         head.className = "Head"
         head.id = "HeadBox"

         var content = document.createElement("div")
         content.className = "Content"
         content.id = "ContentBox"
         content.style.csstext = 'font-size: 12px; font-family: roboto,Noto Sans KR,malgun gothic,dotum,gothic; font-weight: 400; -webkit-font-smoothing: antialiased; word-break: break-all;height: 97%;overflow: hidden;letter-spacing: -0.01em;'

         var title = document.createElement("div")
         title.className = "Title"
         title.id = "TitleBox"
         title.innerHTML = detail[0].cpName
         title.style.cssText = 'font-size: 26px; font-weight: bold; letter-spacing: -1px;padding: 0; width:90%; margin: 3% 1% 0% 5%; color: #25a5f0;height: 5%;line-height: 40px;border-bottom: 2px #25a5f0 solid;'

         var category = document.createElement("div")
         category.className = "Category"
         category.id = "CategoryBox"
         category.innerHTML = cacode
         category.style.cssText = 'position: absolute; right: 7.5%; top: 5.5%; font-size: 15px; font-weight: bold;'

         var locIcon = document.createElement("div")
         locIcon.className = "LocIcon"
         locIcon.id = "LocIconBox"
         locIcon.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp'
         locIcon.style.cssText = 'background: url(resources/images/ico_addr.png) no-repeat; position: absolute; left:6%; top:10%;'

         var division = document.createElement("div")
         division.className = "Division"
         division.id = "DivisionBox"
         division.innerHTML = detail[0].haName
         division.style.cssText = 'position: absolute; left:9.5%; top:10%; display: inline-block; height: 18px;line-height: 19px;padding: 0 7px;background: #eee;margin-right: 5px;color: #000;border-radius: 3px;border: 1px #ccc solid;'

         var address = document.createElement("div")
         address.className = "Address"
         address.id = "AddressBox"
         address.innerHTML = " > " + detail[0].maAddress
         address.style.cssText = 'position: absolute; left:17%; top:10.2%; width:65%'

         var postbox = document.createElement("div")
         postbox.className = "PostBox"
         postbox.id = "PostBox"
         postbox.innerHTML = "우편번호"
         postbox.style.cssText = 'position: absolute; left:9.5%; top:13%; display: inline-block; height: 18px;line-height: 19px;padding: 0 7px;background: #eee;margin-right: 5px;color: #000;border-radius: 3px;border: 1px #ccc solid;'

         var post = document.createElement("div")
         post.className = "Post"
         post.id = "Post"
         post.innerHTML = " - " + detail[0].cpMaPost
         post.style.cssText = 'position: absolute; left:22%; top:13%; width:40%'

         var numberbox = document.createElement("div")
         numberbox.className = "NumberBox"
         numberbox.id = "NumberBox"
         numberbox.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp'
         numberbox.style.cssText = 'background: url(resources/images/ico_tel.png) no-repeat; position: absolute; left:6%; top:18%;'

         var number = document.createElement("div")
         number.className = "Number"
         number.id = "Number"
         number.innerHTML = admobile
         number.style.cssText = 'position: absolute; left:10%; top:17.9%; width:60%'

         var facilities = document.createElement("div")
         facilities.className = "facilityBox"
         facilities.id = "facilityBox"
         facilities.style.cssText = 'border:1px #dedede solid;background:#f6f6f6;margin:0;text-align:center;border-right:none;border-left:none; position: absolute; right:5%; top:25.9%; width:25%; height:35%; padding:17px 20px 17px 10px; display:inline-block;text-align:center;vertical-align:top;margin:15px 0 10px 0;'

         var facilityList = document.createElement("div")
         facilityList.className = "facilityList"
         facilityList.id = "facilityList"

         var list = detail[0].cpFacility;
         var listArr = list.split(",");

         for (i = 0; i < listArr.length; i++) {
            facilityList.innerHTML += "<div id=facilityList" + i
                  + " style='float:left; position: relative; top:2%;'>"
                  + listArr[i] + "</div><br>";

         }

         facilityList.style.cssText = 'position: relative; top:3%; display:inline-block;'

         var explanation = document.createElement("div")
         explanation.className = "explanationBox"
         explanation.id = "explanationBox"
         explanation.style.cssText = 'border:1px #dedede solid;background:#f6f6f6;margin:0;text-align:left;border-right:none;border-left:none; position: absolute; left:5%; top:25.9%; width:55%; height:35%; padding:17px 20px 17px 10px; display:inline-block;text-align:left;vertical-align:top;margin:15px 0 10px 0;'

         var explanationList = document.createElement("div")
         explanationList.className = "explanationList"
         explanationList.id = "explanationList"
         explanationList.innerHTML = detail[0].cpContents
         explanationList.style.cssText = 'position: relative; top:3%; display:inline-block; float:center;'

         rightViewInfo.append(head, content)
         head.append(title, category)
         content.append(locIcon, division, address, postbox, post, numberbox, number, facilities, explanation)
         facilities.append(facilityList)
         explanation.append(explanationList)
         panel.append(rightViewInfo)
      }
   
   function getStoreDetail(detail) {
       var panel = document.getElementById('rightview');

         var cacode = detail[0].srCaCode
         var mobile = detail[0].srNumber
         var admobile = null;

         if (mobile != null) {
            var admobile = mobile.substring(0, 3) + "-" + mobile.substring(3, 7) + "-" + mobile.substring(7)
         } else {
            var admobile = "번호정보 업데이트중"
         }

         if (panel.hasChildNodes()) {
            panel.removeChild(panel.lastChild);
         }

         var rightViewInfo = document.createElement("div")
         rightViewInfo.className = "Info"
         rightViewInfo.id = "InfoBox"
         rightViewInfo.style.cssText = 'border: 4px dashed #bcbcbc; width:95.5%; height:97%; margin: 10px ;'

         var head = document.createElement("div")
         head.className = "Head"
         head.id = "HeadBox"

         var content = document.createElement("div")
         content.className = "Content"
         content.id = "ContentBox"
         content.style.csstext = 'font-size: 12px; font-family: roboto,Noto Sans KR,malgun gothic,dotum,gothic; font-weight: 400; -webkit-font-smoothing: antialiased; word-break: break-all;height: 97%;overflow: hidden;letter-spacing: -0.01em;'

         var title = document.createElement("div")
         title.className = "Title"
         title.id = "TitleBox"
         title.innerHTML = detail[0].srName
         title.style.cssText = 'font-size: 26px; font-weight: bold; letter-spacing: -1px;padding: 0; width:90%; margin: 3% 1% 0% 5%; color: #25a5f0;height: 5%;line-height: 40px;border-bottom: 2px #25a5f0 solid;'
         /* 특정렌탈업체 이동*/
        
         
         var category = document.createElement("div")
         category.className = "Category"
         category.id = "CategoryBox"
         category.innerHTML = cacode
         category.style.cssText = 'position: absolute; right: 7.5%; top: 5.5%; font-size: 15px; font-weight: bold;'

         var locIcon = document.createElement("div")
         locIcon.className = "LocIcon"
         locIcon.id = "LocIconBox"
         locIcon.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp'
         locIcon.style.cssText = 'background: url(resources/images/ico_addr.png) no-repeat; position: absolute; left:6%; top:10%;'

         var division = document.createElement("div")
         division.className = "Division"
         division.id = "DivisionBox"
         division.innerHTML = detail[0].haName
         division.style.cssText = 'position: absolute; left:9.5%; top:10%; display: inline-block; height: 18px;line-height: 19px;padding: 0 7px;background: #eee;margin-right: 5px;color: #000;border-radius: 3px;border: 1px #ccc solid;'

         var address = document.createElement("div")
         address.className = "Address"
         address.id = "AddressBox"
         address.innerHTML = " > " + detail[0].srAddress
         address.style.cssText = 'position: absolute; left:17%; top:10.2%; width:65%'

         var postbox = document.createElement("div")
         postbox.className = "PostBox"
         postbox.id = "PostBox"
         postbox.innerHTML = "우편번호"
         postbox.style.cssText = 'position: absolute; left:9.5%; top:13%; display: inline-block; height: 18px;line-height: 19px;padding: 0 7px;background: #eee;margin-right: 5px;color: #000;border-radius: 3px;border: 1px #ccc solid;'

         var post = document.createElement("div")
         post.className = "Post"
         post.id = "Post"
         post.innerHTML = " - " + detail[0].srMaPost
         post.style.cssText = 'position: absolute; left:22%; top:13%; width:40%'

         var numberbox = document.createElement("div")
         numberbox.className = "NumberBox"
         numberbox.id = "NumberBox"
         numberbox.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp'
         numberbox.style.cssText = 'background: url(resources/images/ico_tel.png) no-repeat; position: absolute; left:6%; top:18%;'

         var number = document.createElement("div")
         number.className = "Number"
         number.id = "Number"
         number.innerHTML = admobile
         number.style.cssText = 'position: absolute; left:10%; top:17.9%; width:60%;'

         rightViewInfo.append(head, content)
         head.append(title, category)
         content.append(locIcon, division, address, postbox, post, numberbox, number)
         panel.append(rightViewInfo)
     
   }

   function createDiv(name, className) {
      const div = document.createElement("div"); // <div></div>
      div.setAttribute("name", name); // <div name=""></div>
      div.setAttribute("class", className);
      return div;
   }

   function makeOverlay(name, img, phone, address, overlay) {
      var placeContent = document.createElement("div")
      placeContent.className = "place-content"
      placeContent.id = "place-content"
      placeContent.style.cssText = 'background: white; width:100%; height:20%; box-shadow: 3px 3px 10px #566270; border-radius: 5px;';

      var placeHead = document.createElement("div")
      placeHead.className = "place-head"
      placeHead.style.cssText = 'height:20px; background: black; color:white; border: 1px solid black; border-radius: 5px 5px 0px 0px; padding : 10px 10px';

      var placeBody = document.createElement("div")
      placeBody.className = "place-body"
      placeBody.style.cssText = 'width:450px; height:180px; background: white; border: 1px solid white; border-radius: 0px 0px 5px 5px;';

      var placeInfo = document.createElement("div")
      placeInfo.className = "place-info"
      placeInfo.style.cssText = 'background: white; width:300px; height:110px; float:left; margin:10px 0px';

      var placeFooter = document.createElement("div")
      placeFooter.className = "place-footer"
      placeFooter.style.cssText = 'background: white; width:420px; height:30px; float:left; margin:5px 0px 0px 0px; padding:5px 15px'

      var placeName = document.createElement("div")
      placeName.innerHTML = name
      placeName.style.cssText = 'float:left;font-weight:bold;';

      var placeAddImg = document.createElement("img")
      placeAddImg.style.cssText = 'width:110px; height:110px; background: red; float:left; margin:10px';
      placeAddImg.src = "resources/images/camping/" + img

      var placePhone = document.createElement("div")
      placePhone.className = "place-phone"
      placePhone.innerHTML = "☎ " + phone
      placePhone.style.cssText = 'color:blue; font-size:10pt;';

      var placeAddress = document.createElement("div")
      placeAddress.className = "place-address"
      placeAddress.innerHTML = address
      placeAddress.style.cssText = ' font-weight:bold;font-size:11pt';

      var placeDetail = document.createElement("div")
      placeDetail.innerHTML = "상세정보 열기 >"
      placeDetail.className = "place-desc"
      placeDetail.id = "place1"
      placeDetail.style.cssText = 'float:right; background: white; color:black; width:120px; height:24px; border: 1px solid black; font-size:12pt; padding:3px 10px; dispaly:block;'
      placeDetail.onclick = function openPanel() {
         const element = document.getElementById('rightview');
         element.style.right = '0%';
         const deplace = document.getElementById('deplace1');
         deplace.style.display = "block";
         const place = document.getElementById('place1');
         place.style.display = "none";
      }

      var deplaceDetail = document.createElement("div")
      deplaceDetail.innerHTML = "상세정보 닫기 <"
      deplaceDetail.className = "deplace-desc"
      deplaceDetail.id = "deplace1"
      deplaceDetail.style.cssText = 'float:right; background: white; color:black; width:120px; height:24px; border: 1px solid black; font-size:12pt; padding:3px 10px; display:none;'
      deplaceDetail.onclick = function closePanel() {
         const element = document.getElementById('rightview');
         element.style.right = '-33%';
         const place = document.getElementById('place1');
         place.style.display = "block";
         const deplace = document.getElementById('deplace1');
         deplace.style.display = "none";
      }

      var closeBtn = document.createElement('div');
      closeBtn.innerHTML = 'X';
      closeBtn.style.cssText = 'float:right; background: black; color:white;'
      closeBtn.onclick = function() {
         overlay.setMap(null);
      };

      placeContent.append(placeHead, placeBody)
      placeHead.append(placeName, closeBtn)
      placeBody.append(placeAddImg, placeInfo, placeFooter)
      placeInfo.append(placeAddress, placePhone)
      placeFooter.append(placeDetail, deplaceDetail)
      overlay.setContent(placeContent)
   }
   
   function nearStore(){
	   
	   var nS = document.getElementById('mp').innerText;
	   var haName;
	   const div = document.getElementById("campingList");
	   while(div.hasChildNodes()){
	    	  div.removeChild(div.firstChild);
	      }
	   
	   if(nS.substring(0,1)=="충" || nS.substring(0,1)=="전"){
   		haName = nS.substring(0,1)+nS.substring(2,3);
   	}else if(nS.substring(0,1)=="경"){
   		if(nS.substring(1,2)=="기"){
   			haName = nS.substring(0,2);
   		}else{
   			haName = nS.substring(0,1)+nS.substring(2,3);
   		}
   	}else{
   		haName = nS.substring(0,2);
   	}
	   getStoreList('1000');
	   getStorePage('1','10', '1000', haName);
	   chooseStoreList('1','10', '1000', haName);
   }
   
   function getStorePage(pPageNumber, pAmount, pSrMaCfCode, pHaName) {
	      let jsonData = [];
	      jsonData.push({
	         pageNumber : pPageNumber,
	         amount : pAmount,
	         srCfCode : pSrMaCfCode,
	         haName : pHaName
	      });
	      const clientData = JSON.stringify(jsonData);
	      getAjaxJson("GetStorePage", clientData, "settingPage");
	   }
   
   function settingPage(jsonData) {
	      let page = document.getElementById("campingPage");
	      let pageInfo = "";
	      let startPage = jsonData.startPage - 1;
	      let endPage = jsonData.endPage + 1;      
	      
	      makeSrPage(jsonData.haName, page, pageInfo, startPage, endPage, jsonData.srCfCode, jsonData.pageNumber, jsonData.next, jsonData.prev);
	    
	   }
   
   function makeSrPage(address, page, pageInfo, startPage, endPage, jsonSrCfCode, jsonPageNumber, jsonNext, jsonPrev){
	   var haName = address.substring(0,2);
	   
 	  if (jsonPrev != false) {

 	         pageInfo = "<div class='pageInfo_btn_prev'><li onClick =\"delrecord();getStorePage('"
 	               + startPage
 	               + "','10','"
 	               + jsonSrCfCode
 	               + "','"+haName+"');chooseStoreList('"
 	               + startPage
 	               + "','10','"
 	               + jsonSrCfCode + "','"+haName+"');\" >이전</li></div>";

 	      } else {
 	         pageInfo = "<div id='pageInfo_btn_prev_hold'><li>이전</li></div>"
 	      }

 	      for (i = startPage+1; i < endPage; i++) {
 	         if (i == jsonPageNumber) {
 	            pageInfo += "<div class='pageInfo_btn_selected' style='width:4%;' ><li onClick =\"delrecord();getStorePage('"
 	                  + i
 	                  + "','10','"
 	                  + jsonSrCfCode
 	                  + "','"+haName+"');chooseStoreList('"
 	                  + i
 	                  + "','10','"
 	                  + jsonSrCfCode + "','"+haName+"');\">" + i + "</li></div>";
 	         } else if (i !== jsonPageNumber) {
 	            pageInfo += "<div class='pageInfo_btn' style='width:4%;'><li onClick =\"delrecord();getStorePage('"
 	                  + i
 	                  + "','10','"
 	                  + jsonSrCfCode
 	                  + "','"+haName+"');chooseStoreList('"
 	                  + i
 	                  + "','10','"
 	                  + jsonSrCfCode + "','"+haName+"');\">" + i + "</li></div>";
 	         }
 	      }
 	      if (jsonNext != false) {
 	         pageInfo += "<div class='pageInfo_btn_next'><li onClick =\"delrecord();getStorePage('"
 	               + i
 	               + "','10','"
 	               + jsonSrCfCode
 	               + "','"+haName+"');chooseStoreList('"
 	               + i
 	               + "','10','"
 	               + jsonSrCfCode + "','"+haName+"');\" );'>다음</li></div>";
 	      }
 	      page.innerHTML = pageInfo;
   }
   
   function chooseStoreList(pPageNumber, pAmount, pSrMaCfCode, pHaName) {
	      let jsonData = [];
	      jsonData.push({
	         pageNumber : pPageNumber,
	         amount : pAmount,
	         srCfCode : pSrMaCfCode,
	         haName : pHaName
	      });
	      const clientData = JSON.stringify(jsonData);
	      getAjaxJson("ChooseStoreList", clientData, "settingPoint");
	   }
   
   function settingPoint(list) {
	   if(list[0].srAddress!=null){
		   for (let x = 0; x < list.length; x++) {
		         geocoder.addressSearch(list[x].srAddress, function(result, status) {
		            // 정상적으로 검색이 완료됐으면 
		            if (status === kakao.maps.services.Status.OK) {
		               // 마커 하나를 지도위에 표시합니다 
		               getLeftStoreList(new kakao.maps.LatLng(result[0].y,
		                     result[0].x), list[x].srImage, list[x].srName,
		                     list[x].srAddress, list[x].haName,
		                     list[x].srNumber,
		                     list[x].srCfCode, list[x].srCode,
		                     new kakao.maps.LatLng(
		                           parseFloat(result[0].y) + 0.11,
		                           parseFloat(result[0].x) + 0.23));
		            }
		         });
		      }
	   }
	      
	   }
   
   function getLeftStoreList(mPos, srI, srN, srA, haN, srNb,
	         srCf, srCd, wishPos) {
	     
	      const div = document.getElementById("campingList");
	      
	  
	      let cpList = createDiv("cpList", "cpList");
	      for (let i = 0; i < 6; i++) {
	         column = createDiv(columnName[i], "cpList " + columnName[i]);
	         column.innerHTML = (i == 0) ? "<img id='image' src=resources/images/camping/"+srI+"/>"
	               : (i == 1) ? srN : (i == 2) ? srA : (i == 3) ? haN	: "☎" + srNb;
	         cpList.appendChild(column);
			
	         var overlay2 = new kakao.maps.CustomOverlay({
	            yAnchor : 1.2,
	            position : mPos
	         });
	         

	         makeOverlay(srN, srI, srNb, srA, overlay2);
	         cpList.onclick = function() {
	        	getStoreList('1000');
	        	findStoreDetail(srCf, srCd)
	            if (clickedoverlay) {
	               clickedoverlay.setMap(null);
	            }
	            overlay2.setMap(map);
	            clickedoverlay = overlay2;
	            map.setCenter(wishPos);

	            // 현재 지도의 레벨을 얻어옵니다
	            var level = map.getLevel();

	            // 지도를 1레벨 올립니다 (지도가 축소됩니다)
	            map.setLevel(9);
	         };
	      }
	      div.appendChild(cpList);
	   }
   
</script>

</body>

</html>