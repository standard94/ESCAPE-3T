<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<script src="resources/js/resource.js"></script>
<script src="resources/js/logIn.js"></script>

<style>
button{
background-color:transparent;

}
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
	
#box {
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
	
.top_menu {
	font-family:TmonMonsori;
	font-size:150%;
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
	
#list {
	border:1px solid #ff0000;
	width:5.9%;
	height:4.5%;
	position:absolute;
	left:93.5%;
	}

#mid1 {
	border:3px solid  #ffff00;
	width:99.6%;
	height:80%;
	}
	
#line1 {
	border:3px solid #1C1F88;
	margin: 0.3% 0% 0% 0%;
	background-color:#1C1F88;
	}
	
#login2 {
	border:1px solid #000000;
	width:25.9%;
	height:4.5%;
	margin:3% 0% 0% 10.7%;
	}
	
.login2 {
	font-family:TmonMonsori;
	font-size:350%;
	color:#1C1F88;
	}
	
#home {
	border:1px solid #000000;
	width:1.7%;
	height:2%;
	margin:0.000000000000000000000000000000009% 0% 0% 81.5%;
	float:left;
	}
	
.home {
	font-family:TmonMonsori;
	font-size:170%;
	color:#CBCBCB;
	}
	
#arrow {
	border:1px solid #000000;
	width:1%;
	height:2%;
	margin:0.000000000000000000000000000000009% 0% 0% 0%;
	float:left;
	}
	
#login2-1 {
	border:1px solid #000000;
	width:5%;
	height:2%;
	margin:0.000000000000000000000000000000009% 0% 0% 0%;
	float:left;
	}
	
.login2-1 {
	font-family:TmonMonsori;
	font-size:170%;
	color:#000000;
	}
	
#line2 {
	border:1px solid #1C1F88;
	margin: 2% 10.5% 1% 10.5%;
	background-color:#1C1F88;
	}



#memberlogin_btn {
	border:3px solid #1C1F88;
	width:20%;
	height:10%;
	padding:1%;
	float:left;
	text-align:center;
	margin:1% 0% 1% 25%;
	background-color:#1C1F88;
	}
	
.login_type1 {
	font-family:TmonMonsori;
	font-size:150%;
	color:#FFFFFF;
	}
	
#storelogin_btn {
	border:3px solid #1C1F88;
	width:20%;
	height:10%;
	padding:1%;
	float:left;
	text-align:center;
	margin:1% 25% 1% 0%;
	background-color:#FFFFFF;	
	}
	
.login_type2 {
	font-family:TmonMonsori;
	font-size:150%;
	color:#1C1F88;
	}
	
#input {
	border:1px solid #000000;
	width:44.1%;
	height:21%;
	position:absolute;
	margin:6% 25% 0% 25%;
	padding:1% 0% 1% 0.2%;
	}
	
#id {
	border:1px solid #FF0000;
	width:98%;
	height:45%;
	position:absolute;
	margin:0% 0% 1% 0%;
	}
	
.input_id {
	border:3px solid #1C1F88;
	width:98%;
	height:40%;
	margin:0% 0% 0% 0.5%;
	font-family:KHNPHandotumOTFBold;
	font-size:100%;
	text-align:left;
	position:absolute;
	color:#CBCBCB;
	}
	
#pw {
	border:1px solid #FF0000;
	width:98%;
	height:45%;
	position:absolute;
	margin:31% 0% 0% 0%;
	}
	
.input_pw {
	border:3px solid #1C1F88;
	width:98%;
	height:40%;
	margin:0% 0% 0% 0.5%;
	font-family:KHNPHandotumOTFBold;
	font-size:100%;
	text-align:left;
	position:absolute;
	color:#CBCBCB;
	}
	
#find {
	border:1px solid #000000;
	width:11.5%;
	height:1.3%;
	position:absolute;
	margin:35% 0% 0% 57.5%;
	}
	
#id_pw_find {
	font-family:TmonMonsori;
	font-size:120%;
	color:#000000;
	}
	
#click_btn {
	border:1px solid #000000;
	width:44.5%;
	height:15%;
	position:absolute;
	margin:37% 0% 0% 25%;
	}
	
#login3 {
	border:2px solid #1C1F88;
	width:98%;
	height:30%;
	padding:1%;
	position:absolute;
	text-align:center;
	background-color:#1C1F88;
	}
	
#btn_login {
	font-family:TmonMonsori;
	font-size:150%;
	color:#FFFFFF;
	}
	
#join {
	border:3px solid #1C1F88;
	width:98%;
	height:30%;
	padding:1%;
	position:absolute;
	margin:17% 0% 0% 0%;
	text-align:center;
	background-color:#FFFFFF;
	}
	
#btn_join {
	font-family:TmonMonsori;
	font-size:150%;
	color:#1C1F88;
	}
	
#bottom {
	border:3px solid #1C1F88;
	width:99.6%;
	height:15%;
	}
</style>
<body onLoad="initPage()">
	<form name="logInForm" action="LogInMember" method="post">
		<div id="basic">
			<div id="top">
				<div id="logo" onClick=""></div>
				<div id="search"><input type="text" name="" placeholder="검색어를 입력하세요. "/></div>
				<div id="box">
		 			<div id="login1"><span class="top_menu" onClick="">로그인/회원가입</span></div>
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu" onClick="">장바구니</span></div>
				</div>
				<div id="list">메뉴</div>
			</div>
			
			<div id="mid1">
				<div id="line1"></div>
				<div id="login2"><span class="login2">로그인 (LOGIN)</span></div>
				<div id="home"><span class="home" onClick="">홈</span></div>
				<div id="arrow"><span class="home">></span></div>
				<div id="login2-1"><span class="login2-1">로그인</span></div>
				<div id="line2"></div>
				<div id="mid2">
					<div id="login_type">
						<div id="memberlogin_btn"><div class="login_type1" onClick="getLogInPage('memberLogIn')">회원 로그인</div></div>
						<div id="storelogin_btn" ><div class="login_type2" onClick="getLogInPage('storeLogIn')">업체 로그인</div></div>
					</div>
					<div id="input">
						<div id="id"><input class="input_id" type="text" name="mmId" placeholder="ID" /></div>
						<div id="pw"><input class="input_pw" type="password" name="mmPassword" placeholder="PW" /></div>
					</div>
					<div id="find" onClick=""><span id="id_pw_find">아이디/비밀번호 찾기</span></div>
					<div id="click_btn">
						<div id="login3" onClick="logInMember()"><span id="btn_login">로그인</span></div>
						<div id="join" onClick=""><span id="btn_join">회원가입</span></div>
					</div>
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
	</form>
</body>
</html>