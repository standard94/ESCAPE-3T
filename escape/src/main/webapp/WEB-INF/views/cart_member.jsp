<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<title>장바구니</title>

</head>

<link rel="stylesheet" type="text/css" href="resources/css/cart_member.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="resources/js/resource.js"></script>
<script src="resources/js/cart.js"></script>

<body onLoad="getCartList('${sessionInfo.mmCode}')" />
	
	<div id="basic">
		<div id="top">
			<div id="logo" onClick="getNewPageMember('${sessionInfo.mmId}','memberMain','${sessionInfo.publicIp}','${sessionInfo.mmCode}')">여기가 좋을 지도¿</div>
				<div id="search"><input id="searchFont" type="text"  name="" placeholder="" /><input id="searchZoom" class="divButton" type="button" value="SEARCH" onMouseOver="changeColor1(this)" onMouseOut="changeColor2(this)"/></div>
				<div id="box1">
		 			<div id="login1"><span class="top_menu" id='mmId' >${sessionInfo.mmId}님</span>
		 			<input id="logOutButton" type = "button" value= "로그아웃" onClick="logOutMember('${sessionInfo.mmId}','${sessionInfo.publicIp}','${sessionInfo.mmCode}')"/></div>
		 			
		 			<div id="notice"><span class="top_menu" onClick="">공지사항</span></div>
		 			<div id="shop"><span class="top_menu"onClick="getNewPageMember('${sessionInfo.mmId}','cart_member','${sessionInfo.publicIp}','${sessionInfo.mmCode}')">장바구니</span></div>
				</div>
			
		</div>
		
		<div id="mid">
			<div id="sideBar">
     			<div id="sideContents">
     				<div id="sideTitle">
     					<div id = "inTitle">CART</div>
     				</div>
     				
     				
     			</div>
     		</div>
     		
     		<div id="regForm">
     			<div id="topForm">
						<div id="leftTitle">
							<div id="subTitle">
							<div id="rentalGoods">장바구니</div>
							</div>
						</div>
						<div id="rightTitle">
							<div id="rightTop">
							
							</div>
						</div>
				</div>
     			<div id="middleForm">
     				<div id="listDiv">
     					<div id="goodsList">
     						<div id='wholeCartList'>
     								<div >
     										<div id='checkBox'><label><input type="checkbox" name="checkBox" value="all" onClick="selectAll(this)" checked /></label></div>
     										<div id='image'> 이미지</div>
     										<div id= 'goodsInfo'>상품정보</div>
     										<div id='rentPrice'>판매가</div>
     										<div id='qty'>수량</div>
     										<div id='discount'>할인</div>
     										<div id='sum'>합계</div>
     										<div id='choose'>선택</div>	
     								</div>
     								
     								<div id='cartList'>
     								
     								</div>
     								
     								
     								
     								
     						</div>
     						
     						
     					</div>
     					<div id='price'>
     								
     									<div id='tot1'>총 상품금액</div>
     									
     									<div id='tot2'>총 할인금액</div>
     									<div id='tot3'>결제예정금액</div>
     									
     									<div id='totPrice'>0원</div>
     									 <div id='totDiscount'>-0원</div>
     									 <div id='payPrice'>=0원</div>
     								</div>
     					<div id='orderBtn'>
     									<button id='orderWhole'>전체상품주문</button>
     									<button id='orderSelect'>선택상품주문</button>
     									<button id='goOnShopping'>쇼핑계속하기</button>
     									
     								
     								</div>
     				</div>
     			</div>
     			
     		</div>
     		
     	
		</div>
				
		<div id="bottom">
         <div id="bottom_store">여기가 좋을 지도¿</div>
         <div id="bottom_store2">CS NUMBER : 1644 - 3681｜사업자 등록번호: 123-81-21968｜통신판매업신고: 연수 1655호｜개인정보 보호책임자 : NATE</div>
         <div id="bottom_store3">문의 : handaeng1220@gmail.com</div>
      </div>
		
	</div>

</body>

</html>