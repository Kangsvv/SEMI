<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>쉼표 | 지친 일상에 쉼표를 찍다</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>   
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">

<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap');
@import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");
:root{
    --header-height: 3rem;
    --nav-width: 68px;
    --first-color: #0080ff;
    --first-color-light: #AFA5D9;
    --white-color: #ffffff;
    --body-font: 'Nunito', sans-serif;
    --normal-font-size: 1rem;--z-fixed: 100
   }
   
   body::-webkit-scrollbar{
       display: none; /* Chrome, Safari, Opera*/
     }   
    *,::before,::after{
        box-sizing: border-box;
   
    }
    
      body, header, .mainback {
        background-image: url('/imgsrc/mainthem.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
  		background-position: center;
  		background-size: cover;
   }
   #body-pd {
    margin: 0;
    padding: 0;
   }
   main{
      font-family: 'Nanum Brush Script', cursive;
   }
   firsttext{
      font-size: 200px;
   }
   .secondtext{
      font-size: 61px;
   }
   .login, .join{
      color:black;
   }
    body{
        position: relative;
        margin: var(--header-height) 0 0 0;
        padding: 0 1rem;
        font-family: var(--body-font);
        font-size: var(--normal-font-size);
        transition: .5s
    }
    a{
        text-decoration: none
    }
    .header{
        width: 100%;
        height: var(--header-height);
        position: fixed;
        top: 0;
        left: 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 1rem;
        background-color: var(--white-color);
        z-index: var(--z-fixed);
        transition: .5s
    }
    .header_toggle{
        color: black;
        font-size: 1.5rem;
        cursor: pointer
    }
    .header_img{
        width: 35px;
        height: 35px;
        display: flex;
        justify-content: center;
        border-radius: 50%;
        overflow: hidden
    }
    .header_img img{
        width: 40px
    }
    .l-navbar{
        position: fixed;
        top: 0;
        left: -30%;
        width: var(--nav-width);
        height: 100vh;
        background-color: var(--first-color);
        padding: .5rem 1rem 0 0;
        transition: .5s;
        z-index: var(--z-fixed)
    }
    .nav{
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        overflow: hidden
    }
    .nav_logo, .nav_link{
        display: grid;
        grid-template-columns: max-content max-content;
        align-items: center;
        column-gap: 1rem;
        padding: .5rem 0 .5rem 1.5rem
    }
    .nav_logo{
        margin-bottom: 2rem
    }
    .nav_logo-icon{
        font-size: 1.25rem;color: var(--white-color)
    }
    .nav_logo-name{
        color: var(--white-color);
        font-weight: 700
    }
    .nav_link{
        position: relative;
        color: var(--first-color-light);
        margin-bottom: 1.5rem;
        transition: .3s
    }
    .nav_link:hover{
        color: var(--white-color)
    }
    .nav_icon{
        font-size: 1.25rem
    }
    .show1{
        left: 0
    }
    .body-pd{
        padding-left: calc(var(--nav-width) + 1rem)
    }
    .active{
        color: var(--white-color)
    }
    .active::before{
        content: '';
        position: absolute;
        left: 0;
        width: 2px;
        height: 32px;
        background-color: var(--white-color)
    }
    .height-100{
        height:100vh
    }
    @media screen and (min-width: 768px){
        body{
            margin: calc(var(--header-height) + 1rem) 0 0 0;
            padding-left: calc(var(--nav-width) + 2rem)
        }.header{
            height: calc(var(--header-height) + 1rem);
            padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
        }
        .header_img{
            width: 40px;height: 40px
        }
        .header_img img{
            width: 45px
        }
        .l-navbar{
            left: 0;
            padding: 1rem 1rem 0 0
        }
        .show1{
            width: calc(var(--nav-width) + 156px)
        }
        .body-pd{
            padding-left: calc(var(--nav-width) + 188px)
        }
    }
    
    .card-details{
    position:relative;
    display:flex;
    
    padding-bottom:20px;
}
.card-details input{
    height:50px;
    width:100%;
    font-size:18px;
    background-color:#f5f5f7;
    color:black;
    padding:0px 20px;
    padding-left:50px;
    box-sizing:border-box;
    border-radius:10px;
/*     outline:none; */
    border:none;
}
.card-details i{
    position:absolute;
    left:10px;
    top:16px;
    color:black;
    font-size:18px;
}
.card-details span{
    position:absolute;
    width:20px;
    height:20px;
    background-color:#fff;
    border-radius:50%;
    color:#ffe4be;
    font-size:10px;
    
    right:10px;
    top:15px;
    opacity:0.4;
    display:flex;
    justify-content:center;
    align-items:center;
    cursor:pointer; 
}

.fa{
   color:black;
}

.card-details span:hover{
    opacity:1;
}

    /*  */
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      .loginBtn{
         text-aling:center;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
</style>
</head>
<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle"><i class='bx bx-menu' id="header-toggle"></i></div>
        <div>
	        <c:choose>
				<c:when test="${loginID !=null}">
						${loginID }님 안녕하세요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					<a href="/logout.member" class=""  >logout</a>
							
				</c:when>
		
				<c:otherwise>
					<a href="#" class="login" id="login"  data-bs-toggle="modal" data-bs-target="#exampleModal" onkeyup="enterkey()">login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			 <a href="/goJoinPage.member" class="join">join</a>
          			 
				</c:otherwise>
			</c:choose>
           
        </div>
		
    </header>
   
<!-- 로그인 모달  -->
   
<!--로그인 모달-->
    <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-right" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title text-center" id="exampleModalLabel">로그인</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="card-details">
                  <input type="text" id="id-input" placeholder="email" name="email" required>
                  <i class="fa fa-envelope"></i>
              </div>
              <div class="card-details">
                  <input type="password" id="password-input" placeholder="password" name="pw" required>
                  <i class="fa fa-lock"></i>
                  <span><small class="fa fa-eye-slash passcode"></small></span>
              </div>
              <div>
              <span id="idpw_check"></span>
                  </div>            
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-success" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">비밀번호를 잊으셨나요 ?</button>
            <button type="button" class="btn btn-primary" id="modal_loginBtn">로그인</button>
              <a href="/signup.jsp"><button type="button" class="btn btn-outline-primary">회원가입</button></a>
            </div>
          </div>
        </div>
      </div>
      <!--pw 찾기 모달-->
      <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel2">비밀번호 찾기</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              가입한 <strong>이메일</strong>과 사용한 <strong>닉네임</strong>이 같으면 
              <br>임시 비밀번호가 발급됩니다

              <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="findpw_email">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="findpw_nickname">
              </div>
              <input class="form-control" type="text" placeholder="임시비밀번호" aria-label="default input example" id="temp_pw" disabled>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-bs-target="#exampleModal" id="new_pw_btn">임시 비밀번호 발급</button>
              <button class="btn btn-primary" data-bs-target="#exampleModal" data-bs-toggle="modal">로그인으로</button>
            </div>
          </div>
        </div>
      </div>
      
<script>
$("#login").on("click",function(){
	$("#idpw_check").text("");
	$("#idpw_check").css({ color: "black" })
})
$("#modal_loginBtn").on("click",function(){
			$.ajax({
				url:"/login.member",
				type:"post",
				data:{email:$("#id-input").val(),pw:$("#password-input").val()},
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				if(resp==false){					
					$("#idpw_check").text("Email 또는 비밀번호가 올바르지 않습니다!");
					$("#idpw_check").css({ color: "red" })
					$("#id-input").val("");
					$("#id-input").focus();					
					$("#password-input").val("");
				}else if(resp==true){
					location.reload();
				}
				
			});
		})

$("#new_pw_btn").on("click",function(){
			let email = $("#findpw_email").val();
			let nickname= $("#findpw_nickname").val();
			
			
			let pw = (Math.floor(Math.random() * 10)*10000000)+(Math.floor(Math.random() * 10)*1000000)+(Math.floor(Math.random() * 10)*100000)+(Math.floor(Math.random() * 10)*10000)+(Math.floor(Math.random() * 10)*1000)+(Math.floor(Math.random() * 10)*100)+(Math.floor(Math.random() * 10)*10)+Math.floor(Math.random() * 10);
			
			for(i=1; i<9; i++){
				
			}
			
			console.log(pw);
			
			
			let temppw =$("#temp_pw");
			if(email==""||nickname==""){
				alert("공백은 입력할 수 없습니다");
			}else{
				$.ajax({
					url:"/resetpw.member",
					type:"post",
					data:{email:email,nickname:nickname,pw:pw},
					dataType:"json"
				}).done(function(resp){
					console.log(resp);
					if(resp>0){
						temppw.val("임시 비밀번호 : " + pw);
					}else{
						temppw.val("email 또는 닉네임이 틀렸습니다");
					}
				});
			}
			
		})

</script>		
<!-- 로그인 모달  -->

    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="/goIndex.board" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">쉼표 <br>- 일상의 쉼표를 찍다</span> </a>
                <div class="nav_list"> 
                   <a class="nav_link" style="color:white;"> <i class='CurrIcon'></i> <span class="nav_name"><span class="weather">
                    <span class="CurrTemp"></span>
                    <span class="City"></span>
                    </span></span> </a> 
                   <a href="/communityMain.board" class="nav_link"> <i class='bx bx-message nav_icon'></i> <span class="nav_name">커뮤니티</span> </a> 
                   <a href="/editorReMain.board?" class="nav_link"> <i class='bx bx-book-bookmark nav_icon'></i> <span class="nav_name">에디터추천</span> </a> 
                   <a href="/boardMainView.board?cpage=1" class="nav_link"> <i class='bx bx-home nav_icon'></i> <span class="nav_name">숙소리뷰</span> </a>
               		
               		<c:choose>
						<c:when test="${loginID !=null}">
							<a href="/goMyPage.mpg" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">마이페이지</span> </a>
							
						</c:when>
		
						<c:otherwise>
							<a href="/goMyPage.mpg" class="nav_link" data-bs-toggle="modal" data-bs-target="#exampleModal"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">마이페이지</span> </a>
							
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${loginIsAdmin == 'Y'}">
               				<a href="/adiminPage.admin" class="nav_link"> <i class='bx bx-hard-hat nav_icon'></i> <span class="nav_name">관리자페이지</span> </a>
                		</c:when>
                	
                		<c:otherwise>
							
						</c:otherwise>
                	</c:choose>
                
                </div>
            </div> 
            <c:choose>
				<c:when test="${loginID !=null}">
					<a href="/logout.member" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">로그아웃</span> </a>	
				</c:when>
			</c:choose>
            
        </nav>
    </div>
 <!-- 로그인모달  -->   
 
 <!--login toast-->
 <div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast1" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <img src="/imgsrc/smlogo.png" class="rounded me-2" alt="...">
      <strong class="me-auto">쉼표 | 지친 일상에 쉼표를 찍다 </strong>
      <small>방금 전</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      로그인되었습니다
    </div>
  </div>

  <div id="liveToast2" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <img src="/imgsrc/smlogo.png" class="rounded me-2" alt="...">
      <strong class="me-auto">쉼표 | 지친 일상에 쉼표를 찍다 </strong>
      <small>방금 전</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      로그아웃되었습니다
    </div>
  </div>
 </div>
 <!--login toast-->
 
    <!--Container Main start-->
    <div class="height-100 width-100 d-flex text-center text-black bg-white mainback">
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto">
    
  </header>

  <main class="px-3">
    <span class="firsttext"><img src="/imgsrc/logo.png"></span>
    <p class="lead secondtext">지친 일상에 쉼표를 찍다,</p>
    
  </main>

  <footer class="mt-auto text-white">
    <p>Designed for <a href="https://getbootstrap.com/" class="text-white">Catch the Java</a></p>
  </footer>
</div>
    </div>
    <!--Container Main end-->
    

    
    
    <script>
    
    document.addEventListener("DOMContentLoaded", function(event) {
          
       const show1Navbar = (toggleId, navId, bodyId, headerId) =>{
       const toggle = document.getElementById(toggleId),
       nav = document.getElementById(navId),
       bodypd = document.getElementById(bodyId),
       headerpd = document.getElementById(headerId)

       // Validate that all variables exist
       if(toggle && nav && bodypd && headerpd){
       toggle.addEventListener('click', ()=>{
       // show1 navbar
       nav.classList.toggle('show1')
       // change icon
       toggle.classList.toggle('bx-x')
       // add padding to body
       bodypd.classList.toggle('body-pd')
       // add padding to header
       headerpd.classList.toggle('body-pd')
       })
       }
       }

       show1Navbar('header-toggle','nav-bar','body-pd','header')

       /*===== LINK ACTIVE =====*/
       const linkColor = document.querySelectorAll('.nav_link')

       function colorLink(){
       if(linkColor){
       linkColor.forEach(l=> l.classList.remove('active'))
       this.classList.add('active')
       }
       }
       linkColor.forEach(l=> l.addEventListener('click', colorLink))

        // Your code to run since DOM is loaded and ready
       });
    
    // input id, input pw, password eyes
    let outer_eye=document.querySelector(".card-details span");
    let eye=document.querySelector(".passcode");
    let input=document.querySelector("#password-input");
    outer_eye.addEventListener('click',function(){

       if(input.type=='password'){
           input.type="text"; 
           eye.classList.remove('fa-eye-slash');
           eye.classList.add('fa-eye');
         input.classList.add('warning');
        }else{
          input.type="password"; 
          eye.classList.remove('fa-eye');
          eye.classList.add('fa-eye-slash');
          input.classList.remove('warning');
      }
    });
    
    $("#password-input").on("keyup",function(e){
        if(e.keyCode==13){
            $("#modal_loginBtn").click();
        }
    })
    </script>
    <script type="text/javascript">
 	let city = ['Jeju City'];
	
	city.forEach(function(city){
		$(document).ready(function() {
			let weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
			};
			$.ajax({
				url:'http://api.openweathermap.org/data/2.5/weather?q='+city+'&APPID=71199a5512c711405120f9710683654c&units=metric',
				dataType:'json',
				type:'GET',
				success:function(data){
					let $Icon = (data.weather[0].icon).substr(0,2);
					let $Temp = Math.round(data.main.temp) + 'º';
					let $city = "제주도";
					
					$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
					$('.CurrTemp').prepend($Temp);
					$('.City').append($city);
					console.log(data);
	                console.log("현재온도 : "+ (data.main.temp- 273.15) ); //섭씨온도를 만들기 위함
	                console.log("현재습도 : "+ data.main.humidity);
	                console.log("날씨 : "+ data.weather[0].main );
	                console.log("상세날씨설명 : "+ data.weather[0].description );
	                console.log("날씨 이미지 : "+ data.weather[0].icon );
	                console.log("바람   : "+ data.wind.speed );
	                console.log("나라   : "+ data.sys.country );
	                console.log("도시이름  : "+ data.name );
	                console.log("구름  : "+ (data.clouds.all) +"%" );  
				}
			})
		});
	});
	
</script>
</body>
</html>