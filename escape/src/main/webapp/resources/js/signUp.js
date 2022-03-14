/*회원가입 관련 method*/

/*사용자 아이디 중복 확인*/
function checkMemberId(){
	const pMmId = document.getElementsByName("id")[0].value;
	
	let jsonData = [];
	jsonData.push({mmId:pMmId});
	const clientData = JSON.stringify(jsonData);
	
	
	fromJsonToJson("CheckMemberId", clientData, "message", false);
}

/*업체 아이디 중복 확인*/
function checkStoreId(){
	const pSrId = document.getElementsByName("srId")[0].value;
	
	let jsonData = [];
	jsonData.push({srId:pSrId});
	const clientData = JSON.stringify(jsonData);
	
	
	fromJsonToJson("CheckStoreId", clientData, "message", false);
}


/*아이디 중복 메세지 */
function message(jsonData){
	
	document.getElementById("checkIdMessage").innerHTML = jsonData;
}
/*비밀번호 일치 체크*/
let compareResult = false;
function comparePassword(){
	const pwd = document.getElementsByName("pwd")[0].value;
	const pwd1 = document.getElementById("pwd");
	const pwd2 = document.getElementById("pwdCheck");
	const result = document.getElementById("checkResult");
	
	
	var wrongColor = "red";
	
	 if(pwd.length < 10 || pwd.length > 16){
		pwd1.value = pwd2.value ='';
		result.innerHTML="비밀번호는 10자에서 16자까지만 입력가능합니다";
		result.style.color = wrongColor;
		}
	
	 if(pwd1.value != '' && pwd2.value != ''){
				if(pwd1.value == pwd2.value){
					
					result.innerHTML = "비밀번호가 일치합니다";
					result.style.color = "blue";
					return;
		   }
	 				result.innerHTML = "비밀번호가 일치하지 않습니다";
					result.style.color = wrongColor;
				}
			
}
/******************************************************************************************************/
/*사용자 회원가입*/
function memberSignUp() {
        const pMmId = document.getElementsByName("id")[0].value;
		const pMmPassword = document.getElementsByName("pwd")[0].value;
		const pMmPasswordCheck = document.getElementsByName("pwdCheck")[0].value;
		const pMmName = document.getElementsByName("name")[0].value;
		const pMmNumber = document.getElementsByName("phoneNumber")[0].value;
		const pMmEmail = document.getElementsByName("mailId")[0].value;
		
		//아이디 입력했는지 확인
		if(pMmId != ''){
			//비밀번호 입력했는지 확인
			if(pMmPassword != '' && pMmPasswordCheck != ''){
				//비밀번호 일치하는지 확인
				if(pMmPassword == pMmPasswordCheck){
					//이름 입력했는지 확인
					if(pMmName !=''){
						//전화번호 입력했는지 확인
						if(pMmNumber !=''){
							if(pMmNumber.length == 11){
								//이메일 입력했는지 확인
								if(pMmEmail != ''){
								
								let jsonData = [];
								jsonData.push({mmId:pMmId, mmPassword:pMmPassword, mmName:pMmName, mmNumber:pMmNumber, mmEmail:pMmEmail});
								const clientData = JSON.stringify(jsonData);
								fromJsonToJson("MemberSignUp", clientData, "memberCheck", false);
								
								}else{
									alert("이메일을 입력해주세요");
								}
							}else{
								alert("번호는 11자리 입력해주세요");
							}
						}else{
							alert("번호를 입력해주세요");
						}
					}else{
						alert("이름을 입력해주세요.");
					}
				}else{
					alert("비밀번호가 일치하지 않습니다.");
				}
			}else{
				alert("비밀번호를 다시 확인해주세요");
			}
		}else{
			alert("아이디를 입력해주세요");
		}
		

}
	
//사용자 회원가입 완료
function memberCheck(jsonData){
	getNewPage('completeSignUpMember');
	
}
/******************************************************************************************************/
//업체 회원가입
function storeSignUp(){
	const pSrId = document.getElementsByName("srId")[0].value;
	const pSrPassword = document.getElementsByName("pwd")[0].value;
	const pSrPasswordCheck = document.getElementsByName("pwdCheck")[0].value;
	const pSrName = document.getElementsByName("srName")[0].value;
	const pSrCfCode = document.getElementsByName("srCfCode")[0].value;
	const pSrPost = document.getElementsByName("srPost")[0].value;
	const pSrAddress = document.getElementsByName("srAddress")[0].value;
	const pSrDetails = document.getElementsByName("srDetails")[0].value;
	const pSrNumber = document.getElementsByName("srNumber")[0].value;
	const pSrEmail = document.getElementsByName("srEmail")[0].value;
	
	//아이디 입력했는지 확인
		if(pSrId != ''){
			//비밀번호 입력했는지 확인
			if(pSrPassword != '' && pSrPasswordCheck != ''){
				//비밀번호 일치하는지 확인
				if(pSrPassword == pSrPasswordCheck){
					//이름 입력했는지 확인
					if(pSrName !=''){
						if(pSrCfCode != ''){
							//전화번호 입력했는지 확인
							if(pSrNumber !=''){
								//번호 11자리 입력 확인
								if(pSrNumber.length == 11){
								  	//우편번호 입력 확인
									if(pSrPost != ''){
										//주소 입력 확인
										if(pSrAddress != ''){
											//업체 상세정보 확인
											if(pSrDetails != ''){
												//업체 번호 확인
												if(pSrNumber != ''){
													if(pSrEmail != ''){
														let jsonData = [];
														jsonData.push({srId:pSrId, srPassword:pSrPassword, srName:pSrName, srCfCode : pSrCfCode, srPost : pSrPost, srAddress : pSrAddress, 
																		srDetails:pSrDetails, srNumber:pSrNumber, srEmail:pSrEmail});
														const clientData = JSON.stringify(jsonData);
	
													
														fromJsonToJson("StoreSignUp", clientData, "storeCheck", false);
															
													}else{
														alert("이메일을 입력해주세요");
													}
												}else{
													alert("업체 번호를 입력해주세요");
												}
											}else{
												alert("업체 상세정보를 입력해주세요");
											}
										}else{
											alert("주소를 입력해주세요");
										}
									}else{
										alert("주소를 입력해주세요");
									}
							}else{
								alert("번호는 11자리 입력해주세요");
							}
						}else{
							alert("번호를 입력해주세요");
						}
					
						}else{
							
						}
						
					}else{
						alert("이름을 입력해주세요.");
					}
				}else{
					alert("비밀번호가 일치하지 않습니다.");
				}
			}else{
				alert("비밀번호를 다시 확인해주세요");
			}
		}else{
			alert("아이디를 입력해주세요");
		}
	
	
}		

//업체 회원가입 완료
function storeCheck(jsonData){
	getNewPage('completeSignUpStore');
	
}

/******************************************************************************************************/

/*사용자 아이디 찾기*/
function findMemberId(pMmName,pMmEmail){
	const mmName = document.getElementsByName(pMmName)[0]; 
	const mmEmail = document.getElementsByName(pMmEmail)[0]; 
	const form = makeForm("", "FindMemberId", "post");
	
 	
	form.appendChild(mmName);
	form.appendChild(mmEmail);
	document.body.appendChild(form);
	form.submit();
 	
} 

/*업체 아이디 찾기*/ 
function findStoreId(pSrName,pSrEmail){
	const srName = document.getElementsByName(pSrName)[0];
	const srEmail = document.getElementsByName(pSrEmail)[0];
	const form = makeForm("", "FindStoreId", "post");
	
	
	form.appendChild(srName);
	form.appendChild(srEmail);
	document.body.appendChild(form);
	form.submit();

}


/******************************************************************************************************/
/*사용자,업체 비밀번호 찾기 : 모달 오픈*/ 
function checkEmail(pEmail){
	 document.getElementById("modal").style.display="block";
	const email = document.getElementById(pEmail).value;
	document.getElementById("typeModEmail").value = email;
}

/*사용자 비밀번호 찾기 : 이메일 전송*/
function sendMemberEmail(pMmId,pMmEmail){
	const mmId1 = document.getElementById(pMmId).value;
	const mmEmail1 = document.getElementById(pMmEmail).value;
	const mmId = makeInputElement("hidden","mmId",mmId1,"");
	const mmEmail = makeInputElement("hidden","mmEmail",mmEmail1,"");
	
	const form = makeForm("","SendMemberEmail","post");
	
	form.appendChild(mmId);
	form.appendChild(mmEmail);
	document.body.appendChild(form);
	form.submit();
		
} 


/*업체 비밀번호 찾기 : 이메일 전송*/
function sendStoreEmail(pSrId,pSrEmail){
	const srId = document.getElementById(pSrId).value;
	const srEmail = document.getElementById(pSrEmail).value;
	const form = makeForm("","SendStoreEmail","post");
	
	form.appendChild(srId);
	form.appendChild(srEmail);
	document.body.appendChild(form);
	form.submit();
		
} 


/******************************************************************************************************/
function fromJsonToJson(action, clientData, fn, content) {

   let ajax = new XMLHttpRequest();
   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](ajax.responseText);
         
      }

   };
	  ajax.open("post", action, true);
      ajax.setRequestHeader("Content-Type", content? "application/x-www-form-urlencoded; charset=utf-8" : "application/json; charset=utf-8");
      ajax.send(clientData);
   

   /*send 하기 전엔 state값 2, status 값은 없음*/
   /*send 누르면 state가 3으로 변함*/
   
}
function getAjaxData(action, data) {
		let ajax = new XMLHttpRequest();

		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
				const serverData = ajax.responseText;
				alert(serverData);
				if (serverData.substr(0, 1) != "<") {
					document.getElementById(serverData).click();
				} else {
					document.getElementById("ajaxData").innerHTML = serverData;
				}

			}
		};
		/*true는 비동기화*/
		ajax.open("post", action, true);
		ajax.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded")

		/*send 하기 전엔 state값 2, status 값은 없음*/
		ajax.send(data);/*send 누르면 state가 3으로 변함*/

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