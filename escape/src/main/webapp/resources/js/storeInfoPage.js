
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



/*낚시 렌탈업체 리스트 불러오기*/
const columnName = ["srImage", "srName", "srAddress", "srDetails", "srNumber", "srCfCode", "srCode", "srPost"];
function aaa(jsonData){
   const caName = document.getElementById("category");
   caName.innerHTML = (jsonData[0].srCfCode=="2000")? "낚시용품" : "캠핑용품";
   const div = document.getElementById("list2");
   const storeList = createDiv("storeList","StoreList");
   
   for(let i=0; i<jsonData.length; i++){
      const ddiv = createDiv("ddiv", "ddiv");
      for(let j=0; j<8; j++){
         const column = createDiv(columnName[j], "storeList" + columnName[j]);
         column.innerHTML =
            (j==0)? "<img id='srImage' src='resources/images/store/"+jsonData[i].srImage+"' />" : 
               (j==1)? jsonData[i].srName :
                  (j==2)? jsonData[i].srAddress :
                     (j==3)? jsonData[i].srDetails :
                        (j==4)? jsonData[i].srNumber : 
                           (j==5)? jsonData[i].srCfCode : 
                              (j==6)? jsonData[i].srCode : jsonData[i].srPost;
      ddiv.onclick = function(){
         
         chooseStoreInfo(jsonData[i].srCode, jsonData[i].srCfCode);
         
      }
      ddiv.appendChild(column);         
      }
      storeList.appendChild(ddiv);
   }
   div.appendChild(storeList);
}

// 특정업체 클릭






function alertPage(jsonData){
      
   let page = document.getElementById("list2");
   let pageInfo = "";
   let startPage = jsonData.startPage-1;
   let endPage = jsonData.endPage + 1;
   
   pageInfo = '<div id="button">';
   if(jsonData.prev != false){
      
    pageInfo += "<div class='pageInfo_btn_prev'><li onClick =\"delrecord();getFishingStorePage('"+startPage+"','10','"+jsonData.srCfCode+"');chooseFishingStoreList('"+startPage+"','10','"+jsonData.srCfCode+"');\" >이전</li></div>";
      
   }else{
   pageInfo += "<div id='pageInfo_btn_prev_hold'><li>이전</li></div>"
   }
      
   for(i=jsonData.startPage; i<jsonData.endPage+1; i++){
      if(i==jsonData.pageNumber){
      pageInfo += "<div class='pageInfo_btn_selected' style='width:4%;' ><li onClick =\"delrecord();getFishingStorePage('"+i+"','10','"+jsonData.srCfCode+"');chooseFishingStoreList('"+i+"','10','"+jsonData.srCfCode+"');\">"+i+"</li></div>";   
      }else if(i!==jsonData.pageNumber){
      pageInfo += "<div class='pageInfo_btn' style='width:4%;'><li onClick =\"delrecord();getFishingStorePage('"+i+"','10','"+jsonData.srCfCode+"');chooseFishingStoreList('"+i+"','10','"+jsonData.srCfCode+"');\">"+i+"</li></div>";
      }
   }
   if(jsonData.next != false){
      pageInfo += "<div class='pageInfo_btn_next'><li onClick =\"delrecord();getFishingStorePage('"+i+"','10','"+jsonData.srCfCode+"');chooseFishingStoreList('"+i+"','10','"+jsonData.srCfCode+"');\" );'>다음</li></div>";
   }
   pageInfo += "</div>";
   page.innerHTML = pageInfo;
}
   

   
//낚시 렌탈업체 페이지 번호 불러오기
function getFishingStorePage(pPageNumber, pAmount, pSrCfCode) {
   let jsonData = [];
   jsonData.push({
      pageNumber : pPageNumber,
      amount : pAmount,
      srCfCode : pSrCfCode
   });
   const clientData = JSON.stringify(jsonData);
   getAjaxJson("GetFishingStorePage", clientData, "alertPage");
}
   
/* 모든 record 삭제하기*/
function delrecord(){
   const div = document.getElementById("list2");
   while(div.hasChildNodes()){
      div.removeChild(div.firstChild);
       }   
}

   
//낚시 렌탈업체 : 클릭한 페이지에 해당하는 리스트 불러오기
function chooseFishingStoreList(pPageNumber, pAmount, pSrCfCode) {
   let jsonData = [];
   jsonData.push({
      pageNumber : pPageNumber,
      amount : pAmount,
      srCfCode : pSrCfCode
      
   });
   const clientData = JSON.stringify(jsonData);
   getAjaxJson("GetFishingStoreList", clientData, "aaa");
}

/* 특정업체 정보 불러오기 */
function chooseStoreInfo(pSrCode, pSrCfCode, pSrPost){
   let jsonData = [];
   jsonData.push({
      srCfCode : pSrCfCode,
      srCode : pSrCode,
      srPost : pSrPost
      
   });
   const clientData = JSON.stringify(jsonData);
   getAjaxJson("ChooseStoreInfo", clientData, "storeInfo");
}

function storeInfo(jsonData){
   delrecord();
   let data = '<div id="storeInfo">';
      data += '<div id="line1">';
      data += '<div id="storeImage"><img id="srInfoImage" src="resources/images/store/'+jsonData.srImage+'" /></div>';
      data += '<div id="storeMap"></div>';
      data += '<div id="storeAddress">찾아오는길 : '+jsonData.srAddress+'</div>';
      data += '</div>';
      data += '<div id="line2">';
      data += '<div id="storeName">'+jsonData.srName+'</div>';
      data += '<div id="storeNumber">'+jsonData.srNumber+'</div>';
      data += '<div id="storeContent">'+jsonData.srDetails+'</div>';
      data += '<div id="clickGoods" onClick="">click!_이 업체의 상품 보러가기</div>';
      data += '</div>';
      data += '</div>';
      
      document.getElementById("list2").innerHTML += data;
      
      var mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div 
      mapOption = {
         center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
         level: 4 // 지도의 확대 레벨
      };  

      //지도를 생성합니다    
       var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      
      var geocoder = new kakao.maps.services.Geocoder();
      
      geocoder.addressSearch(jsonData.srAddress, function(result, status) {
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
            
               // 마커 하나를 지도위에 표시합니다 
               addSrMarker(new kakao.maps.LatLng(result[0].y, result[0].x),map);
            }
         });


      
      
}
function addSrMarker(position,pMap){
         console.log(position,pMap);
       // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
          map : pMap,
          position : position

         });

         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(pMap);

      pMap.setCenter(position);
      }




function createDiv(name, className) {
      const div = document.createElement("div"); // <div></div>
      div.setAttribute("name", name); // <div name=""></div>
      div.setAttribute("class", className);
      return div;
   }
   