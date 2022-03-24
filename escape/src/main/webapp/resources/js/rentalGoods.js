function openCloseMenu(c){
   console.log(document.getElementById("campingItem").style.display=="block")
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

/*상품 가져오는 리스트*/ 
function getGoodsList(cfCode){
	
}