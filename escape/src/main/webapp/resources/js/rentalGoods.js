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

/************************************상품 전체 리스트 ************************************************/
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
					(i==0)? ((jsonData[x].cfCode == "1000")? "<img id='goImage' onclick =\"getThatStoreThatGoods('"+jsonData[x].goCode+"','"+jsonData[x].srCode+"','"+jsonData[x].cfCode+"','"+jsonData[x].caCode+"')\"; src='resources/images/cp/"+jsonData[x].image+"' />" : "<img id='goImage' src='resources/images/fi/"+jsonData[x].image+"' onclick =\"getThatStoreThatGoods('"+jsonData[x].goCode+"','"+jsonData[x].srCode+"','"+jsonData[x].cfCode+"','"+jsonData[x].caCode+"')\"/>") :
						
							(i==1)? "["+jsonData[x].srName+"]" :
								
								 (i==2)? jsonData[x].goName :
									
									 (i==3)? ((jsonData[x].rentPrice.indexOf("&")>0)? (jsonData[x].rentPrice = rentPrice[0].substring(0,rentPrice[0].indexOf(",")) + " "  + rentPrice[0].substring(rentPrice[0].indexOf(",")+1)) : "0"):
										
										    (i==4)? ((jsonData[x].discount==0)?  "&nbsp" : " ( "+jsonData[x].discount + "% 할인" + " )") :
										    	
										    	(i==5)? ((jsonData[x].stCode == "S001")? "<span id='mainBlue'>렌탈 가능</span>" : "<span id='mainRed'>렌탈 불가</span>")  :
										    		
										    		(i==6)? jsonData[x].srCode :
										    			
										    			(i==7)? jsonData[x].goCode :
										    			
										    				(i==8)? jsonData[x].cfCode : jsonData[x].caCode;
			
			
						    				
			bigDiv.appendChild(column);	
							 
			}
			bigDiv.innerHTML += "<button id='btnCart'class='twoBtn' onClick=\"notMember()\">장바구니</button>" + "<button  id='btnBuy'class='twoBtn' onClick=\"notMember()\">바로구매</button>";
			gdList.appendChild(bigDiv);	
			
		}
		div.appendChild(gdList);
		
			
		
	}
	
//회원 아니면 안열려요
function notMember(){
	const modal = document.getElementById("notMember");
	 var offset = $("#notMember").offset();
       $('html, body').animate({scrollTop : offset.top}, 400);
	modal.style.display = 'block';
	
	let data = "";
	    data += "<div>";
		data += "<div id='ring'>🔔 알림</div>";
		data += "<div id='question'>로그인이 필요한 서비스입니다.</div>";
		data += "<div id='goLogIn' onClick = \"getNewPage('memberLogIn')\">로그인</div>";
		data += "<div id='noLogIn' onClick = 'closeWindow()'>창닫기</div>";
		data += "</div>";
		
		modal.innerHTML = data;
	}	
//로그인 권유 창 닫기
function closeWindow(){
	const modal = document.getElementById("notMember");
	modal.style.display = 'none';
}





/******************************************** 상품 상세정보 안에서 method ************************************************/

//select 박스 초기화
function resetSelect(){	
$("#day option:eq(0)").prop("selected", true);
$("#price option:eq(0)").prop("selected", true);

	
}


//특정 업체의 특정 상품 불러오기, , CONTENTS, NOTICE, STCODE
let goInfoName = ["image","srName","goName","stCode","discount","month","day","rentPrice","contents","notice","srCode","goCode","cfCode","caCode"];
function getGoodsInfo(jsonData){
	delrecord();
	delNumber();
	const caName = document.getElementById("category");
	caName.innerHTML = (jsonData.cfCode=="1000")? "캠핑용품" : "낚시용품";
	const div = document.getElementById("goodsList");
	const goInfo = createDiv("goInfo","goInfo");
	//품절 나누기
	if(jsonData.stCode == "S002"){
		//월 나누기
	if(jsonData.month.indexOf(",")>0){
		let month =  jsonData.month.split(",");
			jsonData.month = "";
			jsonData.month = "<div id='cal1'>사용시작 월"
			jsonData.month += "<select id='month' class='sel' onchange='resetSelect()' disabled>" ;
			jsonData.month += "<option value = ''selected='selected'/>--  [필수] 사용월 선택 --</option>";
		for(let x=0; x<12; x++){
			jsonData.month += "<option value='"+month[x]+"'>"+month[x]+"월</option>";
		}
		jsonData.month += "</select></div>";
		console.log(jsonData.month);
	}
	//일수 나누기
	if(jsonData.day.indexOf(",")>0){
		let day =  jsonData.day.split(",");
			jsonData.day = "";
			jsonData.day = "<div id='cal2'>사용시작 일";
			jsonData.day += "<select id='day' class='sel' disabled>" ;
			jsonData.day += "<option value = '' selected='selected' />--  [필수] 사용일 선택  --</option>";
		for(let x=0; x<31; x++){
			jsonData.day += "<option value='"+day[x]+"'>"+day[x]+"일</option>";
		}
		jsonData.day += "</select></div>";
		console.log(jsonData.day);
	}
	//몇박몇일, 가격 분리
	if(jsonData.rentPrice.indexOf("&")>0){
		let rent = jsonData.rentPrice.split("&");
		jsonData.rentPrice = "";
		
		jsonData.rentPrice += "<div id='rentPrice'>대여기간&가격";
		jsonData.rentPrice += "<select id='price' class='sel' onchange='changeSel()' disabled>" ;
		jsonData.rentPrice += "<option value = '' selected='selected'/>--  [필수] 대여기간 선택  --</option>";
		for(let y=0; y<rent.length;  y++){
			
			jsonData.rentPrice += "<option id=''value='"+rent[y].substring(0,rent[y].indexOf(","))+" / "+rent[y].substring((rent[y].indexOf(","))+1)  +"'>"+rent[y].substring(0,rent[y].indexOf(","))+" / "+rent[y].substring((rent[y].indexOf(","))+1) +"</option>";
		}
		jsonData.rentPrice += "</select></div><div id='goCart' ></div><div id='total'><span>총 상품 금액(수량) : </span><span id='totPrice' class='pr'>0</span><span class='pr'>원</span><span class='qty'>(</span><span id='totQty' class='qty'>0</span><span class='qty'>개</span><span class='qty'>)</span></div>";
	    jsonData.rentPrice	+= "<button id='btn1'>바로구매</button><button id='btn2'>장바구니</button></div>";
		console.log(jsonData.rentPrice);
	}
	}else{
		//월 나누기
	if(jsonData.month.indexOf(",")>0){
		let month =  jsonData.month.split(",");
			jsonData.month = "";
			jsonData.month = "<div id='cal1'>사용시작 월"
			jsonData.month += "<select id='month' class='sel' onchange='resetSelect()'>" ;
			jsonData.month += "<option value = ''selected='selected'/>--  [필수] 사용월 선택 --</option>";
		for(let x=0; x<12; x++){
			jsonData.month += "<option value='"+month[x]+"'>"+month[x]+"월</option>";
		}
		jsonData.month += "</select></div>";
		console.log(jsonData.month);
	}
	//일수 나누기
	if(jsonData.day.indexOf(",")>0){
		let day =  jsonData.day.split(",");
			jsonData.day = "";
			jsonData.day = "<div id='cal2'>사용시작 일";
			jsonData.day += "<select id='day' class='sel' >" ;
			jsonData.day += "<option value = '' selected='selected' />--  [필수] 사용일 선택  --</option>";
		for(let x=0; x<31; x++){
			jsonData.day += "<option value='"+day[x]+"'>"+day[x]+"일</option>";
		}
		jsonData.day += "</select></div>";
		console.log(jsonData.day);
	}
	//몇박몇일, 가격 분리
	if(jsonData.rentPrice.indexOf("&")>0){
		let rent = jsonData.rentPrice.split("&");
		jsonData.rentPrice = "";
		
		jsonData.rentPrice += "<div id='rentPrice'>대여기간&가격";
		jsonData.rentPrice += "<select id='price' class='sel' onchange='changeSel()'>" ;
		jsonData.rentPrice += "<option value = '' selected='selected'/>--  [필수] 대여기간 선택  --</option>";
		for(let y=0; y<rent.length;  y++){
			
			jsonData.rentPrice += "<option id=''value='"+rent[y].substring(0,rent[y].indexOf(","))+" / "+rent[y].substring((rent[y].indexOf(","))+1)  +"'>"+rent[y].substring(0,rent[y].indexOf(","))+" / "+rent[y].substring((rent[y].indexOf(","))+1) +"</option>";
		}
		jsonData.rentPrice += "</select></div><div id='goCart' ></div><div id='total'><span>총 상품 금액(수량) : </span><span id='totPrice' class='pr'>0</span><span class='pr'>원</span><span class='qty'>(</span><span id='totQty' class='qty'>0</span><span class='qty'>개</span><span class='qty'>)</span></div>";
	    jsonData.rentPrice	+= "<button id='btn1' onClick='notMember()'>바로구매</button><button id='btn2' onClick='notMember()'>장바구니</button></div>";
		console.log(jsonData.rentPrice);
	}
	}
	
	
	if(jsonData.contents.indexOf("&")>0){
		let content = jsonData.contents.split("&");
		jsonData.contents = "";
		
		for(let v=0; v<content.length; v++){
			if(jsonData.cfCode == "1000"){
				jsonData.contents += "<img id='contents' src='resources/images/cp/"+content[v]+"' />"
			}else{
				jsonData.contents += "<img id='contents' src='resources/images/fi/"+content[v]+"' />"
			}
			
		}
		
		console.log(jsonData.contents);
	}else{
		if(jsonData.cfCode == "1000"){
			    
				jsonData.contents = "<img id='contents' src='resources/images/cp/"+jsonData.contents+"' />"
			}else{
				jsonData.contents = "<img id='contents' src='resources/images/fi/"+jsonData.contents+"' />"
			}
			
	}
	for(let l=0; l<1; l++){
		for(let i=0; i<14; i++){
		let column = createDiv(goInfoName[i],"goInfo "+goInfoName[i]);
		column.innerHTML = 
							(i==0)? ((jsonData.cfCode == "1000")? "<img id='thumbNail' src='resources/images/cp/"+jsonData.image+"' />" : "<img id='thumbNail' src='resources/images/fi/"+jsonData.image+"' />") :
								(i==1)? "[" + jsonData.srName + "]" :
									(i==2)? jsonData.goName :
										(i==3)? ((jsonData.stCode == "S001")? "<span id='blue'>렌탈 가능</span>" : "<span id='red'>렌탈 불가</span>") :
											(i==4)? ((jsonData.discount==0)?  "&nbsp" : " ( "+jsonData.discount + "% 할인" + " )")  :
												(i==5)? jsonData.month :
													(i==6)? jsonData.day  :
														(i==7)?  jsonData.rentPrice : 
															(i==8)? "<span class='warn'  onClick=\"changeImg('detail')\">상품 상세정보</span><span class='warn'   onClick=\"changeImg('notice')\">상품 구매안내</span>"+"<div id='imageDiv'>"+jsonData.contents+"</div>" :
																(i==9)? "<img id='notImage' src='resources/images/cp/"+jsonData.notice+"' />" :
																	(i==10)? jsonData.srCode : 
																		(i==11)? jsonData.goCode : 
																			(i==12)? jsonData.cfCode :
																			 jsonData.caCode;
		goInfo.appendChild(column);						
		}
	}
	div.appendChild(goInfo);
	
}


//수량 담을 배열
let qtyArray = new Array(100);
//사용 월, 사용 일 , 대여기간 선택 시 div:goCart 채우기
function changeSel(){
	const month = document.getElementById("month");
	const day = document.getElementById("day");
	const rentPrice = document.getElementById("price");
	var goName = document.getElementsByName("goName")[0].innerText;
	const goDiscount = document.getElementsByName("discount")[0].innerText;
	const tot = document.getElementById("totPrice").innerText;
	const totQty = document.getElementById("totQty").innerText;
	
	
	let	discountPrice = "";
	if(month.options[month.selectedIndex].value != ''){
		var selectMonth = month.options[month.selectedIndex].value;
		
		if(day.options[day.selectedIndex].value != ''){
			var selectDay = day.options[day.selectedIndex].value;
			
			if(rentPrice.options[rentPrice.selectedIndex].value != ''){
				var selectPrice = rentPrice.options[rentPrice.selectedIndex].value;
				var price = selectPrice.substring((selectPrice.indexOf("/"))+1);
				
				
				//할인가격 있을 때
				if(goDiscount.indexOf("%")>0){
				var goDi = goDiscount.substring((goDiscount.indexOf("("))+1,goDiscount.indexOf("%"));
				discountPrice = "("+(price * (goDi/100))+"할인)";
				
				}
				//할인가격 없을 때
				else{
				discountPrice = "";
				}
				
				
				const cart = document.getElementById("goCart");
				let i = cart.children.length;
			
				qtyArray[i] = "";
				qtyArray[i]=1;
				
				let data = "";
				data += "<div id='orderDiv"+i+"'>";
				//글씨
				data += "<div name='goOrder' class='goOrder'>";
				data +="<div name='goName' class='goName'>"+goName+"</div>";
				data += "<span>"+selectMonth+"월/"+"</span>";
				data += "<span>"+selectDay+"일/"+"</span>";
				data += "<span class='nodePrice'>"+selectPrice+"원"+discountPrice+"</span>";
				data += "</div>";
				//증감 버튼
				data += "<div name='goOrder2'class='goOrder2'>"
				data += "<span id='modQty"+i+"' class='modQty'>"+qtyArray[i]+"</span>";
				data += "</div>";
				data += "<div name='goOrder3' class='goOrder3'>";
				data += "<button name='inc' class='inc' onClick='modQty(\"plus\","+i+")'>△</button>";
				data += "<button name='dec' class='dec' onClick='modQty(\"minus\","+i+")'>▽</button>";
				data += "</div>";
				data += "<div name='goOrder4' class='goOrder4'>";
				data += "<button name='delOrder' class='delOrder' onClick='modQty(\"delete\","+i+")'>X</button>";
				data += "</div>";
				data += "</div>";
				
				
				
				
				//총 금액 출력
				if(tot == 0){
				(goDiscount.indexOf("%")>0)?
				 
					document.getElementById("totPrice").innerText = price - discountPrice.substring((discountPrice.indexOf("("))+1,discountPrice.indexOf("할"))
					:
					document.getElementById("totPrice").innerText = price; 
					
					
					
				}else{
					
					(goDiscount.indexOf("%")>0)?
						document.getElementById("totPrice").innerText = parseInt(tot) + parseInt(price - discountPrice.substring((discountPrice.indexOf("("))+1,discountPrice.indexOf("할")))
					:
						document.getElementById("totPrice").innerText = parseInt(tot) + parseInt(price);
					
					
				}
				
				//총 수량 출력
				if(totQty == 0){
					document.getElementById("totQty").innerText = 1;
				}else{
					
					document.getElementById("totQty").innerText = parseInt(totQty) + 1;
				}
				
				document.getElementById("goCart").innerHTML += data;
				document.getElementById("goCart").style.borderBottom = '2px solid #8C8C8C';
				
				
			}
				
				
				
		}else{
			alert("사용하실 날짜를 선택해주세요");
		}
	}else{
		alert("사용하실 월을 선택해주세요");
	}
}

//생성된 div클릭 시 상품 상세정보 이동
function getThatStoreThatGoods(pGoCode,pSrCode,pCfCode,pCaCode){

	let jsonData = [];
	jsonData.push({
				goCode : pGoCode,
				srCode : pSrCode,
				caCode : pCaCode,
				cfCode : pCfCode
			});
	
	const clientData = JSON.stringify(jsonData);
	
	getAjaxJson("GetThatStoreThatGoods", clientData, "getGoodsInfo");
}



//수량 증가 시키기
function modQty(name, i){
	const order = document.getElementById("orderDiv"+i);
	const priceDiv = order.querySelector('.nodePrice');
	const qty = document.getElementById("modQty"+i);
	const totPrice = document.getElementById("totPrice");
	const totQty = document.getElementById("totQty");
	const price = priceDiv.innerText.split("원");
	//기존 가격 
	const pr = price[0].substring((price[0].indexOf("/"))+1);
	
	let di;
	//기존 할인가격 
	if(price[1]!==""){
		di = price[1].substring((price[1].indexOf("("))+1,price[1].indexOf("할"));
	}else{
		di = "";
	}
	
	
	//수량 증가 *******************************
	if(name == 'plus'){
		let changePrice = "";
		changePrice = price[0].substring(0,price[0].indexOf("/"))+"/"+(parseInt(pr)+parseInt((pr/qtyArray[i])*1))+"원";
		
		let changeDiscount = "";
		if(di!==""){
			changeDiscount = "("+(parseInt(di)+parseInt((di/qtyArray[i])*1))+"할인)";
		}else{
			changeDiscount = "";
		}
		
	
		
		priceDiv.innerText = "";
		priceDiv.innerText = changePrice;
		priceDiv.innerText += changeDiscount;
		
		//할인 있을 때
		if(di!==""){
			totPrice.innerText = parseInt(totPrice.innerText) + ((parseInt(pr)/parseInt(qtyArray[i]))-(parseInt(di)/parseInt(qtyArray[i])));
		}
		//할인 없을 때
		else{
			totPrice.innerText = parseInt(totPrice.innerText) + ((parseInt(pr)/parseInt(qtyArray[i])));
		}
		
		
		totQty.innerText = parseInt(totQty.innerText) + 1;
		
		
		
		qtyArray[i] = parseInt(qtyArray[i])+1;
		qty.innerText = qtyArray[i];
		
		
	//수량 감소 *******************************	
	}else if(name == 'minus'){
		if(qtyArray[i]==1){
			alert("최소 주문 수량은 한 개입니다");
		}else{
		let changePrice = "";
		changePrice = price[0].substring(0,price[0].indexOf("/"))+"/"+(parseInt(pr)-parseInt((pr/parseInt(qtyArray[i]))*1))+"원";
		
		
		let changeDiscount = "";
		//할인 있을 때
		if(di!==""){
			changeDiscount = "("+(parseInt(di)-parseInt((di/qtyArray[i])*1))+"할인)";
		}
		//할인 없을 때
		else{
			changeDiscount = "";
		}
		
		
		priceDiv.innerText = "";
		priceDiv.innerText = changePrice;
		priceDiv.innerText += changeDiscount;
		
		
		if(di!==""){
			totPrice.innerText = parseInt(totPrice.innerText) - ((parseInt(pr)/parseInt(qtyArray[i]))-(parseInt(di)/parseInt(qtyArray[i])));
		}else{
			totPrice.innerText = parseInt(totPrice.innerText) - ((parseInt(pr)/parseInt(qtyArray[i])));
		}
		
		
		totQty.innerText = parseInt(totQty.innerText) - 1;
		
		
		qtyArray[i] = parseInt(qtyArray[i])-1;
		qty.innerText = qtyArray[i];
		
		
		}
		
	//주문 삭제 *******************************	
	}else if(name == 'delete'){
		const cart = document.getElementById("goCart");
		const child = document.getElementById("orderDiv"+i);
		cart.removeChild(child);
		
		//할인 없을 때
		if(di!==""){
			totPrice.innerText = parseInt(totPrice.innerText) + parseInt(price[1].substring((price[1].indexOf("("))+1,price[1].indexOf("할"))) - parseInt(price[0].substring((price[0].indexOf("/"))+1));
		}
		//할인 있을 때
		else{
			totPrice.innerText = parseInt(totPrice.innerText) - parseInt(price[0].substring((price[0].indexOf("/"))+1));
		}
		
		
		totQty.innerText = parseInt(totQty.innerText) - parseInt(qtyArray[i]);
		
	}
}
//상품상세정보, 상품 구매안내 버튼 클릭시 변환
function changeImg(param){
	
 	const detail =	document.getElementById("imageDiv");
	const notice =	document.getElementsByName("notice")[0];
	if(param == "detail"){
		detail.style.display = "block";
		notice.style.display = "none";
	}else if(param == "notice"){
		notice.style.display = "block";
		detail.style.display = "none";
	}
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
/*페이지 넘버 삭제하기*/ 	
function delNumber(){
	const div = document.getElementById("goodsPage");
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

