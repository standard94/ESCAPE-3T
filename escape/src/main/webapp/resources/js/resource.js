
 

/* 로그인/회원가입 페이지 이동 */
function getNewPage(pageName){

 const form = makeForm("","GetNewPage","Post");
 const page = makeInputElement("hidden", "pageName", pageName, "");
 form.appendChild(page);
 document.body.appendChild(form);
 form.submit();

}

/*사용자로그인 기록, 페이지 이동*/
function getNewPageMember(pMmId,pPageName,pPublicIp, pMmCode){
const form = makeForm("","GetNewPageMember","Post");
const mmId = makeInputElement("hidden","mmId",pMmId,"");
const pageName = makeInputElement("hidden","pageName",pPageName,"");
const publicIp = makeInputElement("hidden","publicIp",pPublicIp,"");
const mmCode = makeInputElement("hidden","mmCode",pMmCode,"");
form.appendChild(mmId);
form.appendChild(pageName);
form.appendChild(publicIp);
form.appendChild(mmCode);
document.body.appendChild(form);
form.submit();

}

/*업체 로그인 기록, 페이지 이동*/
function getNewPageStore(pSrId,pPageName,pPublicIp, pSrCode){
const form = makeForm("","GetNewPageStore","Post");
const srId = makeInputElement("hidden","srId",pSrId,"");
const pageName= makeInputElement("hidden","pageName",pPageName,"");
const publicIp = makeInputElement("hidden","publicIp",pPublicIp,"");
const srCode = makeInputElement("hidden","srCode",pSrCode,"");
form.appendChild(srId);
form.appendChild(pageName);
form.appendChild(publicIp);
form.appendChild(srCode);
document.body.appendChild(form);
form.submit();
}
let publicIp;

function getPublic() {
	/* publicIp 조회 후 저장 */
	getAjaxJson1("https://api.ipify.org","format=json","getPublicIp", "GET");
}
/*JsonData 가져오기*/
function getAjaxJson1(action, clientData, fn, method) {
   let ajax = new XMLHttpRequest();
   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](JSON.parse(ajax.responseText));
			
         
      }

   };
    
   if(method == "GET"){
	  action = (clientData != "")? (action + "?" + clientData) : action; 
  
	  ajax.open("get", action, true);
      ajax.send();
   }else{
	  ajax.open("post", action, true);
      ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
      ajax.send(clientData);
   }

   /*send 하기 전엔 state값 2, status 값은 없음*/
   /*send 누르면 state가 3으로 변함*/
   
}
function getPublicIp(pIp) {
	publicIp = pIp.ip;
}

/*사용자 로그인 form 생성*/
function logInMember() {
	const form = document.getElementsByName("logInForm")[0];
	
	const hidden = makeInputElement("hidden", "publicIp", publicIp, "");
	form.appendChild(hidden);
	
	const userData = [ document.getElementsByName("mmId")[0],
			document.getElementsByName("mmPassword")[0],
			document.getElementsByName("publicIp")[0]];
	const message = [ "아이디 입력",  "패스워드 입력" , "Public Ip 조회 불가" ];


	for (let index = 0; index < userData.length; index++) {
		if (!isEmpty(userData[index])) {
			alert(message[index]);
			return;
		}

	}
	form.submit();
}

/*업체 로그인 form 생성*/ 
function logInStore() {
	const form = document.getElementsByName("logInForm")[0];
	
	const hidden = makeInputElement("hidden", "publicIp", publicIp, "");
	form.appendChild(hidden);
	
	const userData = [ document.getElementsByName("srId")[0],
			document.getElementsByName("srPassword")[0],
			document.getElementsByName("publicIp")[0]];
	const message = [ "아이디 입력",  "패스워드 입력" , "Public Ip 조회 불가" ];


	for (let index = 0; index < userData.length; index++) {
		if (!isEmpty(userData[index])) {
			alert(message[index]);
			return;
		}

	}
	form.submit();
}

/*사용자 로그아웃*/
function logOutMember(pMmId,pPublicIp,pMmCode){
	const form = makeForm("", "LogOutMember", "post");
	const publicIp = makeInputElement("hidden", "publicIp", pPublicIp, "");
	const mmId = makeInputElement("hidden", "mmId", pMmId, "");
	const mmCode = makeInputElement("hidden", "mmCode", pMmCode, "");
	form.appendChild(publicIp);
	form.appendChild(mmId);
	form.appendChild(mmCode);
	document.body.appendChild(form);
	form.submit();
	
	
}
/* 업체 로그아웃*/
function logOutStore(pSrId,pPublicIp,pSrCode){
	const form = makeForm("", "LogOutStore", "post");
	const publicIp = makeInputElement("hidden", "publicIp", pPublicIp, "");
	const srId = makeInputElement("hidden", "srId", pSrId, "");
	const srCode = makeInputElement("hidden", "srCode", pSrCode, "");
	form.appendChild(publicIp);
	form.appendChild(srId);
	form.appendChild(srCode);
	document.body.appendChild(form);
	form.submit();
}  



function initPage(msg) {
	if(msg != ""){alert(msg);}
	
}


function isEmpty(obj) {
	let check = true;
	if (obj.value == "") {
		check = false;
	}
	return check;
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

function init(objName) {
	if (objName != "") {
		document.getElementById(objName).click();
		}
	}
	

/* Modal Dialog*/
function openModal(obj){
	let container = document.getElementById("container");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
} 

function closeModal(){
	let container = document.getElementById("container");
	container.style.display = "none";
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
   		