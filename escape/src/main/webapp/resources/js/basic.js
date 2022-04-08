	document.addEventListener('scroll', function() {
        var currentScrollValue = document.documentElement.scrollTop;
        console.log('currentScrollValue is ' + currentScrollValue);
        if(currentScrollValue>350){
           document.getElementById("remocon").style.top = '38%'
        }else if(currentScrollValue<350 && currentScrollValue>250){
           document.getElementById("remocon").style.top = '25%'
        }else{
           document.getElementById("remocon").style.top = '10%'
        }
   		});

   		
   		function storeList(pDiscount) {
   		   let jsonData = [];
   		   jsonData.push({
   			   discount : pDiscount
   		   });
   		   const clientData = JSON.stringify(jsonData);
   		   getAjaxJson("StoreList", clientData, "storeInfo");
   		}
   		
   		
   		/*basic storeList*/
   		const columnName = ["image", "srName", "goName", "discount", "caCode", "goCode", "srCode", "cfCode"];
   		function storeInfo(jsonData){
   		   const caName = document.getElementById("category");
   		   const div = document.getElementById("hotDill_list");
   		   const storeList = createDiv("storeList","storeList");
   		   for(let i=0; i<jsonData.length; i++){
   			   if(i<3){
   		      const ddiv = createDiv("ddiv", "ddiv");
   		      for(let j=0; j<8; j++){
   		         const column = createDiv(columnName[j], "storeList" + columnName[j]);
   		         column.innerHTML =
   		            (j==0)? "<img id='Image' src='resources/images/cpFi/"+jsonData[i].image+"' onClick=''/>":
   		               (j==1)? "["+jsonData[i].srName+"]" :
   		                  (j==2)? jsonData[i].goName :
   		                	  (j==3)?"<div id='storeListdiscount'>초특가!!&nbsp;<div id='aa'>"+jsonData[i].discount+"% 할인!!</div><div id='bb'>지금 예약하세요!!!</div></div>" :
   		                		  (j==4)? jsonData[i].caCode :
   		                			  (j==5)? jsonData[i].goCode : 
   		                				  (j==6)? jsonData[i].srCode : jsonData[i].cfCode ;
   		                								 
   		                	
   		               
   		                  
   		                  ddiv.onclick = function(){
   		         
   		                	getNewPage('campingRental');
   		            		
   		      }
   		                  
   		            
   		      ddiv.appendChild(column);         
   		      }
   		      
   		      storeList.appendChild(ddiv);
   		   }
   		}
   		   div.appendChild(storeList);
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
   		
   		
   		// 핫딜 글자색 바뀌기
   		var array=["red", "yellow", "blue", "white"];
   		var cnt=0;
   		
   		function ff(){
   			if(cnt==3) cnt=0;
   			hotDill.style.color=array[cnt++];
   			setTimeout("ff()", 500);
   		}
   		
   		