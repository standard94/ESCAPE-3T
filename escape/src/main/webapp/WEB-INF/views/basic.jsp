<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기가좋을지도::메인페이지</title>
</head>
<style type="text/css">
font {
	font-size: 30px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/css/topBottom1.css" />
<link rel="stylesheet" type="text/css" href="resources/css/medium.css" />
<script src="resources/js/resource.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/*위치에 따른 리모컨 조절*/
	document.addEventListener('scroll', function() {
		var currentScrollValue = document.documentElement.scrollTop;
		console.log('currentScrollValue is ' + currentScrollValue);
		if (currentScrollValue > 100) {
			document.getElementById("remocon").style.top = '45%'
		} else if (currentScrollValue<100 && currentScrollValue>50) {
			document.getElementById("remocon").style.top = '25%'
		} else {
			document.getElementById("remocon").style.top = '10%'
		}
	});
	
	
	/*20% 할인 상품 가져오기*/
	function storeList(pDiscount) {

		let jsonData = [];
		jsonData.push({
			discount : pDiscount
		});
		const clientData = JSON.stringify(jsonData);
		getAjaxJson("StoreList", clientData, "storeInfo");
	}

	/*basic storeList*/
	const columnName = [ "image", "srName", "goName", "discount", "caCode", "goCode", "srCode", "cfCode" ];
	
	/*가져온 20% 할인 상품 핫딜에 출력*/
	function storeInfo(jsonData) {
		const caName = document.getElementById("category");
		const div = document.getElementById("hotDill_list");
		const storeList = createDiv("storeList", "storeList");
		for (let i = 0; i < jsonData.length; i++) {
			if (i < 3) {
				const ddiv = createDiv("ddiv", "ddiv");
				for (let j = 0; j < 8; j++) {
					const column = createDiv(columnName[j], "storeList"
							+ columnName[j]);
					column.innerHTML = (j == 0) ? "<img id='Image' src='resources/images/cpFi/"+jsonData[i].image+"' onClick=''/>"
							: (j == 1) ? "[" + jsonData[i].srName + "]"
									: (j == 2) ? jsonData[i].goName
											: (j == 3) ? "<div id='storeListdiscount'>초특가!!&nbsp;<div id='aa'>"
													+ jsonData[i].discount
													+ "% 할인!!</div><div id='bb'>지금 예약하세요!!!</div></div>"
													: (j == 4) ? jsonData[i].caCode
															: (j == 5) ? jsonData[i].goCode
																	: (j == 6) ? jsonData[i].srCode
																			: jsonData[i].cfCode;

					ddiv.onclick = function() {

						getNewPage('campingRental');

					}

					ddiv.appendChild(column);
				}

				storeList.appendChild(ddiv);
			}
		}
		div.appendChild(storeList);
	}

	/*Json 데이터 송수신*/
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

	/*div 생성*/
	function createDiv(name, className) {
		const div = document.createElement("div"); // <div></div>
		div.setAttribute("name", name); // <div name=""></div>
		div.setAttribute("class", className);
		return div;
	}

	// 핫딜 글자색 바뀌기
	var array = [ "red", "yellow", "blue", "white" ];
	var cnt = 0;

	function ff() {
		if (cnt == 3)
			cnt = 0;
		hotDill.style.color = array[cnt++];
		setTimeout("ff()", 500);
	}
</script>
<body onLoad="getPublic(),init('${objName}'),initPage('${msg}'),storeList('20'),ff();">
	<div id="basic">
		<div id="top">
			<div id="logo" onClick="getNewPage('basic')">여기가 좋을 지도</div>
			<div id="search">
				<input id="searchFont" type="text" name="" placeholder="" />
				<input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)" />
			</div>
			<div id="box1">
				<div id="login1">
					<span class="top_menu" onClick="getNewPage('memberLogIn')">로그인/</span>
					<span class="top_menu" onClick="getNewPage('signUp')">회원가입</span>
				</div>
				<div id="shop">
					<span class="top_menu" onClick="notMember()">장바구니</span>
				</div>
			</div>
		</div>

		<div id="mid">
			<div id="remocon" style="z-index: 3; padding: 1% 1%; height: 50%; width: 9%; border: 1px solid #999966; background-color: white; position: absolute; right: 1%; top: 10%; box-shadow: 3px 3px 10px #566270; border-radius: 10px;">
				<button id="rmcHome" onClick="getNewPage('basic')">HOME</button>
				<button id="rmcMap" onClick="getNewPage('campingMap')">캠핑 지도</button>
				<button id="rmcRental" onClick="getNewPage('campingRental')">렌탈 장비</button>
				<button id="rmcMyPage" onClick="notMember()">장바구니</button>
				<button id="rmcRtStore" onClick="getNewPage('storeInfoPage')">렌탈 업체</button>
			</div>

			<div id="box2">
				<div id="campingMap">
					<span onClick="getNewPage('campingMap')">
						<img id="campingMap1" src='resources/images/tent.png' onMouseOver="this.src='resources/images/campingPoint.jpg'" onmouseout="this.src='resources/images/tent.png'" />
					</span>
				</div>
				<div id="fishingMap">
					<span onClick="getNewPage('fishingMap')">
						<img id="fishingMap1" src='resources/images/fishing.png' onMouseOver="this.src='resources/images/fishingPoint.jpg'" onmouseout="this.src='resources/images/fishing.png'" />
					</span>
				</div>
				<div id="rentalEquipment">
					<span onClick="getNewPage('campingRental')">
						<img id="rentalEquipment1" src='resources/images/sleeping-bag.png' onMouseOver="this.src='resources/images/rentalEquipment.jpg'" onmouseout="this.src='resources/images/sleeping-bag.png'" />
					</span>
				</div>
				<div id="rentalStore">
					<span onClick="getNewPage('storeInfoPage')">
						<img id="rentalStore1" src='resources/images/location.png' onMouseOver="this.src='resources/images/rentalStore.jpg'" onmouseout="this.src='resources/images/location.png'" />
					</span>
				</div>
				<div id="buy">
					<span onClick="notMember()">
						<img id="buy1" src='resources/images/changeBuy.png' onMouseOver="this.src='resources/images/buy.jpg'" onmouseout="this.src='resources/images/changeBuy.png'" />
					</span>
				</div>
			</div>

			<div id="notMember" tabindex="-1" style="display: none;"></div>
			<div id="hotDill">
				<span>핫 딜!</span>
			</div>
			<div id="hotDill_list"></div>
		</div>

		<div id="bottom1">
			<div id="store_name">
				<span class="end">여기가 좋을 지도</span>
			</div>
			<div id="cs_number">
				<div id="cs">
					<span class="end">CS NUMBER</span>
				</div>
				<div id="number">
					<span class="end">1644 - 3681</span>
				</div>
			</div>
			<div id="nate1">
				<span class="nate">21968 인천광역시 연수구 원인재로 81(동춘동, 삼성럭키아파트) ㈜CHILDNATE｜대표이사 : NATE</span>
			</div>
			<div id="nate2">
				<span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span>
			</div>
			<div id="nate3">
				<span class="nate">문의 : handaeng1220@gmail.com</span>
			</div>
			<div id="nate4">
				<span class="nate">㈜CHILDNATE의 사전 서면동의 없이 여기 좋을 지도 사이트(PC, 모바일, 앱)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</span>
			</div>
		</div>

		<div class="container" id="container">
			<div id="fishingBox"></div>

			<div id="campingBox"></div>

			<div id="myPageBox"></div>

			<div id="csCenterBox"></div>
		</div>
	</div>
</body>
</html>