function getCartList(pMmCode){
	let jsonData = [];
	jsonData.push({mmCode:pMmCode});
	const clientData = JSON.stringify(jsonData);
	getAjaxJson("GetCartInfo",clientData,"cartList");
}

let cartInfo = ["checkBox","hidden","image","goInfo","price","qty","discount","total","btn"];
function cartList(jsonData){
	delrecord();
	let totPrice = "";
	let btn = "";
	/*****************전체 div*********************/
	const div = document.getElementById("cartList");
	
	/*jsonData만큼 for무 실행 */
	for(let i=0; i<jsonData.length; i++){
	
		/*선택 버튼 두개*/ 
		btn = "<button id='orderOne' onClick=''>주문하기</button>"+"<button id='delOne' onClick=\"delCart('"+jsonData[i].cfCode+"','"+jsonData[i].caCode+"','"+jsonData[i].srCode+"','"+jsonData[i].goCode+"','"+jsonData[i].mmCode+"','"+jsonData[i].ctCode+"')\">삭제</button>";
		
		/**장바구니 몇번짼지 알려고 div 생성*/
		const cartDiv = createDiv("cartDiv"+i,"cartDiv");
		 	
			/*********************************몇월 몇일*******************/
			if(jsonData[i].rentDay.indexOf("/")>0){
				const rentDay = jsonData[0].rentDay.split("/");
				jsonData[i].rentDay =  rentDay[0]+ "/" + rentDay[1];
			}
			
		
			let rentPrice = "";
			/************************몇박 몇일 원가 분리***************************/
			if(jsonData[i].rentPrice.indexOf("/")>0){
			rentPrice = jsonData[i].rentPrice.split("/");
				if(jsonData[i].discount !== 0 ){
					
					totPrice =  ((rentPrice[1].substring(0,rentPrice[1].indexOf("원"))) - ((rentPrice[1].substring(0,rentPrice[1].indexOf("원"))) * (jsonData[i].discount/100))) * jsonData[i].qty ;
				
				}else{
				totPrice =  (rentPrice[1].substring(0,rentPrice[1].indexOf("원"))) * jsonData[i].qty ;
				}
		
			}
			/*********총 판매가 *********/
			let tot = document.getElementById("totPrice");
			
			if(tot.innerText == "0원"){
				tot.innerText = parseInt(totPrice) + "원";
			}else{
				tot.innerText = parseInt(tot.innerText.substring(0,tot.innerText.indexOf("원"))) + parseInt(totPrice) + "원";
			}
			/********총 할인금액 *************/
			let totDiscount = document.getElementById("totDiscount");

			if(totDiscount.innerText == "-0원"){
				totDiscount.innerText = "-" + ((rentPrice[1].substring(0,rentPrice[1].indexOf("원"))) * (jsonData[i].discount/100)) + "원";
			}else{
				totDiscount.innerText = "-"+ (parseInt(totDiscount.innerText.substring((totDiscount.innerText.indexOf("-"))+1,totDiscount.innerText.indexOf("원"))) + parseInt((rentPrice[1].substring(0,rentPrice[1].indexOf("원"))) * (jsonData[i].discount/100))) + "원"
			}
			/*************총 결제 금액*/
			let payPrice = document.getElementById("payPrice");
			
			
				payPrice.innerText =  "="+  parseInt(tot.innerText.substring(0,tot.innerText.indexOf("원")) - parseInt(totDiscount.innerText.substring((totDiscount.innerText.indexOf("-"))+1,totDiscount.innerText.indexOf("원")))) + "원";
			
			/*******************할인**************************/ 
			if(jsonData[i].discount == 0){
			jsonData[i].discount = "-";
			}else{
			jsonData[i].discount = jsonData[i].discount+"% 할인";
	}
	
	
	/******************************수량 ************************/
	if(jsonData[i].qty !== 0){
		jsonData[i].qty = "<span id='modQty"+i+"' class='modQty'>"+jsonData[i].qty+"</span>";
		jsonData[i].qty += "<button name='inc' class='inc' onClick=\"modQty('plus','"+i+"')\">△</button>";
		jsonData[i].qty += "<button name='dec' class='dec' onClick=\"modQty('minus','"+i+"')\">▽</button>";
		jsonData[i].qty += "<button name='upd' class='upd' onClick=\"updCartQty('"+jsonData[i].cfCode+"','"+jsonData[i].caCode+"','"+jsonData[i].srCode+"','"+jsonData[i].goCode+"','"+jsonData[i].mmCode+"','"+jsonData[i].ctCode+"','"+i+"')\">변경</button>"
	}
	console.log(jsonData[0].qty)
								
		/********담기***********/
		for(let x=0; x<9; x++){
			const column = createDiv(cartInfo[x], "cart "+cartInfo[x]);
			column.innerHTML = (x==0)? "<label for='cartInfo"+i+"'></label><input type='checkBox' id='cartInfo"+i+"' name='cartInfo' value='"+i+"' onClick=\"checkSelectAll()\" checked/>" :
								
								(x==1)? "<div id='mmCode'>"+jsonData[i].mmCode+"</div>"+
										"<div id='cfCode'>"+jsonData[i].cfCode+"</div>"+
										"<div id='srCode'>"+jsonData[i].srCode+"</div>"+
										"<div id='caCode'>"+jsonData[i].caCode+"</div>"+
										"<div id='goCode'>"+jsonData[i].goCode+"</div>"+
										"<div id='ctCode'>"+jsonData[i].ctCode+"</div>" :
									
									(x==2)? ((jsonData[i].cfCode == "1000")? "<img id='ctImage' src='resources/images/cp/"+jsonData[i].image+"' />" : "<img id='ctImage' src='resources/images/fi/"+jsonData[i].image+"' />"):
										
										(x==3)? "<div id='srName'>"+"["+jsonData[i].srName+ "]"+"</div>"+
												"<div id='goName'>"+jsonData[i].goName+"</div>"+
												"<div id='rentDay'>"+jsonData[i].rentDay+"</div>"+
												"<div id='rentPrice1'>"+jsonData[i].rentPrice+"</div>":
												
												(x==4)? rentPrice[1]:
												
													(x==5)?jsonData[i].qty : 
													
													 	(x==6)?  jsonData[i].discount  :
													
															(x==7)? totPrice+"원" : btn;
														
		cartDiv.appendChild(column);								
		}
		div.appendChild(cartDiv);
	}
	
}

/*체크 하나씩 하기 -> 다 체크하면 맨위에도 자동 체크*/ 
function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes 
    = document.querySelectorAll('input[name="cartInfo"]');
  // 선택된 체크박스
  const checked 
    = document.querySelectorAll('input[name="cartInfo"]:checked');
  // select all 체크박스
  const selectAll 
    = document.querySelector('input[name="checkBox"]');
  
  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}
/*전체 체크 풀기*/ 
function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('cartInfo');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}
/**********************DB의 장바구니 수량 증가시키기************************* */
function updCartQty(pCfCode,pCaCode,pSrCode,pGoCode,pMmCode,pCtCode,i){
	const pModQty = document.getElementById("modQty"+i);
	
	const form = makeForm("", "UpdCartInfo", "post");
	const mmCode = makeInputElement("hidden", "mmCode", pMmCode, "");
	const cfCode = makeInputElement("hidden", "cfCode", pCfCode, "");
	const caCode = makeInputElement("hidden", "caCode", pCaCode, "");
	const srCode = makeInputElement("hidden", "srCode", pSrCode, "");
	const goCode = makeInputElement("hidden", "goCode", pGoCode, "");
	const ctCode = makeInputElement("hidden", "ctCode", pCtCode, "");
	const modQty = makeInputElement("hidden", "modQty", pModQty.innerHTML, "");
	
	form.appendChild(mmCode);
	form.appendChild(cfCode);
	form.appendChild(caCode);
	form.appendChild(srCode);
	form.appendChild(goCode);
	form.appendChild(ctCode);
	form.appendChild(modQty);
	document.body.appendChild(form);
	form.submit();
}
/********************특정 장바구니 삭제 ***************/
function delCart(pCfCode,pCaCode,pSrCode,pGoCode,pMmCode,pCtCode){
	
	const form = makeForm("", "DelCart", "post");
	const mmCode = makeInputElement("hidden", "mmCode", pMmCode, "");
	const cfCode = makeInputElement("hidden", "cfCode", pCfCode, "");
	const caCode = makeInputElement("hidden", "caCode", pCaCode, "");
	const srCode = makeInputElement("hidden", "srCode", pSrCode, "");
	const goCode = makeInputElement("hidden", "goCode", pGoCode, "");
	const ctCode = makeInputElement("hidden", "ctCode", pCtCode, "");
	
	form.appendChild(mmCode);
	form.appendChild(cfCode);
	form.appendChild(caCode);
	form.appendChild(srCode);
	form.appendChild(goCode);
	form.appendChild(ctCode);
	document.body.appendChild(form);
	form.submit();
}
/***************************************************수량 변경 ******************** */
//수량 증가 시키기
function modQty(name, i){
	const qty = document.getElementById("modQty"+i);
	
	//수량 증가 *******************************
	if(name == 'plus'){
		
		qty.innerText =  parseInt(qty.innerText)+1;
		
		
	//수량 감소 *******************************	
	}else if(name == 'minus'){
		if(qty.innerText==1){
			alert("최소 주문 수량은 한 개입니다");
		}else{
		
	
		qty.innerText =  parseInt(qty.innerText)-1;
		
		
		}
		
	}
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
		
function createDiv(name, className) {
		const div = document.createElement("div"); // <div></div>
		div.setAttribute("name", name); // <div name=""></div>
		div.setAttribute("class", className);
		return div;
	}
/* 모든 record 삭제하기*/
function delrecord(){
		const div = document.getElementById("cartList");
		while(div.hasChildNodes()){
			div.removeChild(div.firstChild);
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