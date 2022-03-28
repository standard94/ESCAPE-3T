/*특정업체 정보 불러오기*/
function clickStoresInfo(){
	let jsonData = [];
		jsonData.push({
			cpCaCode : pCpCaCode,
			cpMaCfCode : pCpMaCfCode
		});
		const clientData = JSON.stringify(jsonData);
		getAjaxJson("ClickStoreInfo", clientData, "aaa");
}

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

function aaa(jsonData){
	for(let i = 0; i < jsonData.length; i++){
		let data = '<div id="storeList" onClick = "getNewPage(\'chooseStoreInfoPage\')" >';
		data += '<div id="srImage" name="srImage"><img id="image" src="resources/images/store/'+jsonData[i].srImage+'" /></div>';
		data += '<div id="srName" name="srName">'+jsonData[i].srName+'</div>';
		data += '<div id="srAddress" name="srAddress">'+jsonData[i].srAddress+'</div>';
		data += '<div id="srDetails" name="srDetails">'+jsonData[i].srDetails+'</div>';
		data += '<div id="srNumber" name="srNumber">'+jsonData[i].srNumber+'</div>';
		data += '</div>';
		
		document.getElementById("list2").innerHTML += data;
	}
}


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