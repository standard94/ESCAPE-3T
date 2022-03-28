function openCloseMenu(c){
   
   if(c=="a"){
      if(document.getElementById("campingItem").style.display=="block"){
         document.getElementById("campingItem").style.display="none"   
      }else{
         document.getElementById("campingItem").style.display="block"
      }
   }else{
      if(document.getElementById("fishingItem").style.display=="none"){
         document.getElementById("fishingItem").style.display="block"   
      }else{
         document.getElementById("fishingItem").style.display="none"
      }
   }
}


	/*모든 업체 상품 불러오기*/
function getGoodsList(pPageNumber, pAmount, pCfCode, pCaCode) {
		let jsonData = [];
		jsonData.push({
			pageNumber : pPageNumber,
			amount : pAmount,
			caCode : pCaCode,
			cfCode : pCfCode
		});
		const clientData = JSON.stringify(jsonData);
		getAjaxJson("GetAllStoresGoods", clientData, "getList");
}

//모든업체의 상품 출력	
const columnName = ["image","srName","goName","rentPrice","discount","stCode","srCode","goCode","cfCode","caCode"];

function getList(jsonData){
	const caName = document.getElementById("category");
	caName.innerHTML = (jsonData[0].cfCode=="1000")? "캠핑용품" : "낚시용품";
	const div = document.getElementById("goodsList");
	const gdList = createDiv("gdList","gdList");
	
	
		for(let x=0; x<jsonData.length; x++){
			let rentPrice =  jsonData[x].rentPrice.split("&");
			const bigDiv = createDiv("bigDiv"+x,"bigDiv"+x);
			for(let i=0; i<10; i++){
				
				const column = createDiv(columnName[i],"gdList" + columnName[i]);
				column.innerHTML = 
					(i==0)? ((jsonData[x].cfCode == "1000")? "<img id='goImage' src='resources/images/cp/"+jsonData[x].image+"' />" : "<img id='goImage' src='resources/images/fi/"+jsonData[x].image+"' />") :
						
							(i==1)? "["+jsonData[x].srName+"]" :
								
								 (i==2)? jsonData[x].goName :
									
									 (i==3)? ((jsonData[x].rentPrice.indexOf("&")>0)? (jsonData[x].rentPrice = rentPrice[0].substring(0,rentPrice[0].indexOf(",")) + " "  + rentPrice[0].substring(rentPrice[0].indexOf(",")+1)) : "0"):
										
										    (i==4)? ((jsonData[x].discount==0)?  "&nbsp" : " ( "+jsonData[x].discount + "% 할인" + " )") :
										    	
										    	(i==5)? (jsonData[x].stCode == "S001")? "판매 중" :"품절"  :
										    		
										    		(i==6)? jsonData[x].srCode :
										    			
										    			(i==7)? jsonData[x].goCode :
										    			
										    				(i==8)? jsonData[x].cfCode : jsonData[x].caCode;
			bigDiv.onclick = function(){
				 getThatStoreThatGoods(jsonData[x].goCode,jsonData[x].srCode,jsonData[x].cfCode,jsonData[x].caCode);
			}						    				
			bigDiv.appendChild(column);	
						 
			}
			
			bigDiv.innerHTML += "<button id='btnCart'class='twoBtn'>장바구니</button>" + "<button  id='btnBuy'class='twoBtn'>바로구매</button>";
			gdList.appendChild(bigDiv);	
		}
		div.appendChild(gdList);
	}	
//생성된 div클릭 시 상품 상세정보 이동
function getThatStoreThatGoods(pGoCode,pSrCode,pCfCode,pCaCode){
	 const form = makeForm("", "", fmethod)
}
	
//업체 페이지 번호 불러오기
function getGoodsPage(pPageNumber, pAmount,  pCfCode, pCaCode) {
			let jsonData = [];
			jsonData.push({
				pageNumber : pPageNumber,
				amount : pAmount,
				caCode : pCaCode,
				cfCode : pCfCode
			});
			const clientData = JSON.stringify(jsonData);
			getAjaxJson("GetAllStoresPage", clientData, "getPageList");
		}
		
//페이지 번호 저장하기
function getPageList(jsonData){
		let page = document.getElementById("goodsPage");
		let pageInfo = "";
		let startPage = jsonData.startPage-1;
		let endPage = jsonData.endPage + 1;
		if(jsonData.prev != false){
		
		 pageInfo = "<div class='pageInfo_btn_prev'><li onClick =\"delrecord();getGoodsPage('"+startPage+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');getGoodsList('"+startPage+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');\" >이전</li></div>";
		
		}else{
		pageInfo = "<div id='pageInfo_btn_prev_hold'><li>이전</li></div>"
		}
		
		for(i=jsonData.startPage; i<jsonData.endPage+1; i++){
			if(i==jsonData.pageNumber){
			pageInfo += "<div class='pageInfo_btn_selected' style='width:4%;' ><li  onClick =\"delrecord();getGoodsPage('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');getGoodsList('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');\">"+i+"</li></div>";	
			}else if(i!==jsonData.pageNumber){
			pageInfo += "<div class='pageInfo_btn' style='width:4%;'><li  onClick =\"delrecord();getGoodsPage('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');getGoodsList('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');\">"+i+"</li></div>";
			}
			
		}
		if(jsonData.next != false){
			pageInfo += "<div class='pageInfo_btn_next'><li  onClick =\"delrecord();getGoodsPage('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');getGoodsList('"+i+"','9','"+jsonData.cfCode+"','"+jsonData.caCode+"');\">다음</li></div>";
		}
		page.innerHTML = pageInfo;
	}
	
function createDiv(name, className) {
		const div = document.createElement("div"); // <div></div>
		div.setAttribute("name", name); // <div name=""></div>
		div.setAttribute("class", className);
		return div;
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
	
/* 모든 record 삭제하기*/
function delrecord(){
		const div = document.getElementById("goodsList");
		while(div.hasChildNodes()){
			div.removeChild(div.firstChild);
	     }
	} 
	
const btn = document.getElementsByClassName("textLocation");

function addColor() {
   console.log("들어옴")
        for (var i = 0; i < btn.length; i++) {
          btn[i].addEventListener("click", changeColor);
        }
}  

//카테고리 클릭 시 className 변경
  function changeColor(event) {
      console.log(event.target);
      

      console.log(event.target.className);

      if (event.target.classList[1] === "_value") {
        event.target.classList.remove("_value");
      } else {
        for (var i = 0; i < btn.length; i++) {
          btn[i].classList.remove("_value");
        }

        event.target.classList.add("_value");
      }
  }

function makeForm(fname, faction, fmethod) {
	const form = document.createElement("form");
	if (fname != "") { form.setAttribute("name", fname); }
	form.setAttribute("action", faction);
	form.setAttribute("method", fmethod);
	return form;
}

function makeInputElement(type, name, value, placeholder) {
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if (value != "") { input.setAttribute("value", value); }
	if (placeholder != "") { input.setAttribute("placeholder", placeholder); }

	return input;
}

