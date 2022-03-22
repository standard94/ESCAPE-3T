//카테고리 버튼 클릭 시 div 변화
function changeFilter(i){
		
	if(i==1){
		document.getElementById("filterGenre2").style.display = "none";
		document.getElementById("filterFish2").style.display = "none";
		document.getElementById("filterGenre3").style.display = "none";
		document.getElementById("filterFish3").style.display = "none";
		const genre = document.getElementById("filterGenre"+i);
		const fish = document.getElementById("filterFish"+i);
		
		genre.style.display = "";
		fish.style.display="";
	
	}else if(i==2){
		document.getElementById("filterGenre1").style.display = "none";
		document.getElementById("filterFish1").style.display = "none";
		document.getElementById("filterGenre3").style.display = "none";
		document.getElementById("filterFish3").style.display = "none";
		const genre = document.getElementById("filterGenre"+i);
		const fish = document.getElementById("filterFish"+i);
		
		genre.style.display = "";
		fish.style.display="";
	}else{
		document.getElementById("filterGenre1").style.display = "none";
		document.getElementById("filterFish1").style.display = "none";
		document.getElementById("filterGenre2").style.display = "none";
		document.getElementById("filterFish2").style.display = "none";
		const genre = document.getElementById("filterGenre"+i);
		const fish = document.getElementById("filterFish"+i);
		
		genre.style.display = "";
		fish.style.display="";
	}
	
}

const theme = document.getElementsByClassName("select_btn_themespan");
const genre = document.getElementsByClassName("select_btn_genrespan");
const fish = document.getElementsByClassName("select_btn_fishspan");
function addEvent() {
	
        for (var i = 0; i < theme.length; i++) {
          theme[i].addEventListener("click", handleClick1);
        }
  
		for (var i = 0; i < genre.length; i++) {
          genre[i].addEventListener("click", handleClick2);
        }

		for (var i = 0; i < fish.length; i++) {
          fish[i].addEventListener("click", handleClick3);
        }
      }

      addEvent();

//카테고리 클릭 시 className 변경
  function handleClick1(event) {
      console.log(event.target);
      

      console.log(event.target.className);

      if (event.target.classList[1] === "_value") {
        event.target.classList.remove("_value");
      } else {
        for (var i = 0; i < theme.length; i++) {
          theme[i].classList.remove("_value");
        }

        event.target.classList.add("_value");
      }
  }
//장르 클릭 시 className 변경
  function handleClick2(event) {
      console.log(event.target);
      // console.log(this);
      // 콘솔창을 보면 둘다 동일한 값이 나온다

      console.log(event.target.className);

      if (event.target.classList[1] === "_value") {
        event.target.classList.remove("_value");
      } else {
        for (var i = 0; i < theme.length; i++) {
          genre[i].classList.remove("_value");
        }

        event.target.classList.add("_value");
      }
  }

//어종 클릭 시 className 변경
  function handleClick3(event) {
      console.log(event.target);
      // console.log(this);
      // 콘솔창을 보면 둘다 동일한 값이 나온다

      console.log(event.target.classList);

      if (event.target.classList[1] === "_value") {
        event.target.classList.remove("_value");
      } else {
        for (var i = 0; i < theme.length; i++) {
          fish[i].classList.remove("_value");
        }
		
        event.target.classList.add("_value");
      }
  }
/* 낚시터 등록*/
function insFishing(){
   const pFpTitle = document.getElementsByName("title")[0].value;
    const pFpMaCfCode = document.getElementsByName("bigType")[0].value;
    const pFpCaCode = document.getElementsByName("smallType")[0].value;
   const pFpThCode = document.getElementsByClassName('select_btn_themespan_value')[0].value;
   const pFpGeCode = document.getElementsByClassName('select_btn_genrespan_value')[0].value;
   const pFpFiCode = document.getElementsByClassName('select_btn_fishspan_value')[0].value;
   const pMaPost = document.getElementById('maPost');
    const pMaAddress = document.getElementById('maAddress');
   
   alert("djgsj");
   
   //게시물 제목을 입력했는지 확인
   if(pFpTitle != ''){
      //분류를 선택했는지 확인
      if(pFpMaCfCode != ''){
         //카테고리를 선택했는지 확인
         if(pFpCaCode != ''){
            //테마를 선택했는지 확인
            if(pFpThCode != ''){
               //장르를 선택했는지 확인
               if(pFpGeCode != ''){
                  //어종을 선택했는지 확인
                  if(pFpFiCode != ''){
                     //지도를 선택했는지 확인 (우편번호)
                     if(pMaPost != ''){
                        //지도를 선택했는지 확인 (주소)
                        if(pMaAddress != ''){
                           let jsonData = [];
                           jsonData.push({fpTitle:pFpTitle, fpMaCfCode:pFpMaCfCode, fpCaCode:pFpCaCode, fpThCode:pFpThCode, fpGeCode:pFpGeCode, fpFiCode:pFpFiCode, maPost:pMaPost, maAddress:pMaAddress});
                           const clientData = JSON.stringify(jsonData);
                           fromJsonToJson("InsFishing", clientData, "", false);
                        }
                     }else{
                        alert("지도에 위치를 찍어주세요");
                     }
                  }else{
                     alert("FISHTYPE을 선택하여 주세요");
                  }
               }else{
                  alert("GENRE를 선택하여 주세요");
               }
            }else{
               alert("CATEGORY를 선택하여 주세요");
            }
         }else{
            alert("포인트를 선택하여 주세요");
         }
      }else{
         alert("낚시를 선택하여 주세요");
      }
   }else{
      alert("게시물 제목을 입력하여 주세요");
   }

}