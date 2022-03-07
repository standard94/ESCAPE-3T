<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면틀</title>
</head>
<script src="resources/js/resource.js"></script>
<script>



</script>
<style>
#basic {
	border:	10px solid #000000;
	position:absolute; 
	height:260%;
	width:100%;
	}
	
#top {
	border:3px solid #ff0000;
	height:4.5%;
	width:99.6%;
	}
	
#mid {
	border:3px solid  #ffff00;
	width:99.6%;
	height:80%;
	}
	
#bottom {
	border:3px solid #ff2922;
	width:99.6%;
	height:15%;
	}
	
#logo {
	border:1px solid #000;
	width:15.5%;
	height:4.5%;
	position:absolute;
	}
	
#search {
	border:1px solid #ff0000;
	width:38%;
	height:4.5%;
	position:absolute;
	left:16%;
	}
	
#box1 {
	border:1px solid  #000;
	width:38.5%;
	height:4.5%;
	position:absolute;
	left:54.5%;
	}
	
#login1 {
	border:1px solid #1C1F88;
	width:28.3%;
	height:35%;
	left:54.6%;
	float: left;
	}
	
#notice {
	border:1px solid #1C1F88;
	width:15%;
	height:35%;
	left:100%;
	float: left;
	}
	
#shop {
	border:1px solid #1C1F88;
	width:15%;
	height:35%;
	left:58%;
	float: left;	
	}
	
.top_menu {
	font-family:TmonMonsori;
	font-size:150%;
	}
	
#list {
	border:1px solid #ff0000;
	width:5.9%;
	height:4.5%;
	position:absolute;
	left:93.5%;
	}
	
#line1 {
	border:5px solid #1C1F88;
	margin: 0.3% 0% 0% 0%;
	background-color:#1C1F88;
	}

#box2 {
	border:1px solid #000000;
	width:100%;
	height:23%;
	margin:0.5% 0% 0% 0%;
	position:absolute;
	}
	
#fishing {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:3% 0% 0% 10%;
	position:absolute;
	text-align:center;
	}
	
#fishingtip {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:3% 0% 0% 30%;
	position:absolute;
	text-align:center;
	}
	
#camping {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:3% 0% 0% 50%;
	position:absolute;
	text-align:center;
	}
	
#camping_rental {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:3% 0% 0% 70%;
	position:absolute;
	text-align:center;
	}
	
#fishing_rental {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:15% 0% 0% 10%;
	position:absolute;
	text-align:center;
	}
	
#fishing_community {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:15% 0% 0% 30%;
	position:absolute;
	text-align:center;
	}
	
#rental {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:15% 0% 0% 50%;
	position:absolute;
	text-align:center;
	}
	
#camping_community {
	border:2px solid #1C1F88;
	width: 13%;
	height:30%;
	margin:15% 0% 0% 70%;
	position:absolute;
	text-align:center;
	}
	
#line2 {
	border:5px solid #1C1F88;
	margin: 30% 0% 0% 0%;
	background-color:#1C1F88;
	}
	
#pop {
	border:1px solid #000000;
	width:100%;
	height:17%;
	position:absolute;
	margin:0.5% 0% 0% 0%;
	padding:0.5%;
	}
	
#pop_notice {
	border:1px solid #1C1F88;
	width:48%;
	height:94%;
	position:absolute;
	margin:0.2% 0% 0% 0.1%;
	}
	
#pop_community {
	border:1px solid #1C1F88;
	width:48%;
	height:94%;
	position:absolute;
	margin:0.2% 0% 0% 49.5%;
	}
	
#rank {
	border:1px solid #1C1F88;
	width:98%;
	height:5%;
	position:absolute;
	margin:24.5% 0% 0% 0%;
	padding:1%;
	text-align:center;
	background-color:#1C1F88;
	}
</style>

<body>
	
		<div id="basic">
			<div id="top">
				<div id="logo"></div>
				<div id="search"><input type="text" name="" placeholder="검색어를 입력하세요. "/></div>
				<div id="box1">
		 			<div id="login1"><input type='button' class="top_menu" onClick="getLogInPage('memberLogIn')" value="로그인/회원가입"/></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
				<div id="list">메뉴</div>
			</div>
		
			<div id="mid">
				<div id="line1"></div>
				<div id="box2">
					<div id="fishing"><span onClick="">낚시장소</span></div>
					<div id="fishingtip"><span onClick="">노하우TIP</span></div>
					<div id="camping"><span onClick="">캠핑장소</span></div>
					<div id="camping_rental"><span onClick="">캠핑대여</span></div>
					<div id="fishing_rental"><span onClick="">낚시대여</span></div>
					<div id="fishing_community"><span onClick="">대어자랑</span></div>
					<div id="rental"><span onClick="">대여업체</span></div>
					<div id="camping_community"><span onClick="">캠핑커뮤</span></div>
				</div>
				<div id="line2"></div>
				<div id="pop">
					<div id="pop_notice">공지사항</div>
					<div id="pop_community">커뮤니티</div>
				</div>
				<div id="rank"><span>주간랭킹TOP5</span></div>
				<div id="rank_list">
					<div ></div>
					<div></div>
					<div></div>
				</div>
			</div>
			
			<div id="bottom">
				<div id="store_name"><span class="end">여기가 좋을 지도¿</span></div>
				<div id="cs_number">
					<div id="cs"><span class="end">CS NUMBER</span></div>
					<div id="number"><span class="end">1644 - 3681</span></div>
				</div>
				<div id="nate1"><span class="nate">21968 인천광역시 연수구 원인재로 81(동춘동, 삼성럭키아파트) ㈜CHILDNATE｜대표이사 : NATE</span></div>
				<div id="nate2"><span class="nate">사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</span></div>
				<div id="nate3"><span class="nate">문의 : handaeng1220@gmail.com</span></div>
				<div id="nate4"><span class="nate">㈜CHILDNATE의 사전 서면동의 없이 여기 좋을 지도 사이트(PC, 모바일, 앱)의 일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</span></div>
			</div>
		</div>
	
</body>
</html>