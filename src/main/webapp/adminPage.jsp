<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--  -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">
    <!-- Bootstrap core CSS -->
    
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">
   
   <!-- Calendar -->
   <link
   href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css'
   rel='stylesheet' />
   <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>
    
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");
  body::-webkit-scrollbar{
       display: none; /* Chrome, Safari, Opera*/
     }   
        :root {
            --header-height: 3rem;
            --nav1-width: 68px;
            --first-color: #0080ff;
            --first-color-light: #AFA5D9;
            --white-color: #ffffff;
            --body-font: 'Nunito', sans-serif;
            --normal-font-size: 1rem;
            --z-fixed: 100
        }

        *,
        ::before,
        ::after {
            box-sizing: border-box
        }

        body {
            position: relative;
            margin: var(--header-height) 0 0 0;
            padding: 0 1rem;
            font-family: var(--body-font);
            font-size: var(--normal-font-size);
            transition: .5s
        }

        a {
            text-decoration: none
        }

        .header {
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

        .header_toggle {
            color: black;
            font-size: 1.5rem;
            cursor: pointer
        }

        .header_img {
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            border-radius: 50%;
            overflow: hidden
        }

        .header_img img {
            width: 40px
        }

        .l-navbar {
            position: fixed;
            top: 0;
            left: -30%;
            width: var(--nav1-width);
            height: 100vh;
            background-color: var(--first-color);
            padding: .5rem 1rem 0 0;
            transition: .5s;
            z-index: var(--z-fixed)
        }

        .nav1 {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden
        }

        .nav1_logo,
        .nav1_link {
            display: grid;
            grid-template-columns: max-content max-content;
            align-items: center;
            column-gap: 1rem;
            padding: .5rem 0 .5rem 1.5rem
        }

        .nav1_logo {
            margin-bottom: 2rem
        }

        .nav1_logo-icon {
            font-size: 1.25rem;
            color: var(--white-color)
        }

        .nav1_logo-name {
            color: var(--white-color);
            font-weight: 700
        }

        .nav1_link {
            position: relative;
            color: var(--first-color-light);
            margin-bottom: 1.5rem;
            transition: .3s
        }

        .nav1_link:hover {
            color: var(--white-color)
        }

        .nav1_icon {
            font-size: 1.25rem
        }

        .show1 {
            left: 0
        }

        .body-pd {
            padding-left: calc(var(--nav1-width) + 1rem)
        }

        .active {
            color: var(--white-color)
        }

        .active::before {
            content: '';
            position: absolute;
            left: 0;
            width: 2px;
            height: 32px;
            background-color: var(--white-color)
        }
      .login, .join{
           color:black;
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
        @media screen and (min-width: 768px) {
            body {
                margin: calc(var(--header-height) + 1rem) 0 0 0;
                padding-left: calc(var(--nav1-width) + 2rem)
            }

            .header {
                height: calc(var(--header-height) + 1rem);
                padding: 0 2rem 0 calc(var(--nav1-width) + 2rem)
            }

            .header_img {
                width: 40px;
                height: 40px
            }

            .header_img img {
                width: 45px
            }

            .l-navbar {
                left: 0;
                padding: 1rem 1rem 0 0
            }

            .show1 {
                width: calc(var(--nav1-width) + 156px)
            }

            .body-pd {
                padding-left: calc(var(--nav1-width) + 188px)
            }
        }

        /*  */
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .comuview{
       	color:rgb(0, 0, 0);
    	position: absolute;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	text-align:center;
    	font-weight: bold;
    	font-size:20px;
       }
.comuview:hover{
       color:#0080ff;
       }


        /*마이페이지 ------------------------------------------------------------------------------------------------*/
        .container {
            height: 100vh;
            /* border: 1px solid red */
        }
        /*탭*/
        #myTabContent>div{
            color: black;
        }


        /*--일정 관리---------------------------------------------------------------------------------------*/


        #wt{
            border: 1px solid black;
            height: 100%;
        }
        #ht{
            border: 1px solid black;
            height: 100%;
        }
        #bar{
        border: 1px solid black;
        height: 8%;
        padding-top: 5px;
        }
      
        #month{
            height: 100%;
            float: left;
            padding-bottom: 10px;
           
        }
        #today{
            height: 100%;
            float: left;
            padding-bottom: 10px;
          
        }
        #td{
            width: 95%;
            border-radius: 10px;
            height: 66%;
            border: 1px solid hsl(0, 1%, 65%);
            padding-left: 10px;
        }
        #api{
            width: 95%;
            height: 66%;
            border: 1px solid hsl(0, 1%, 65%);
            border-radius: 10px;
        }
        #calendar{
           width: 100%;
           height: 100%;
           min-height:520px;
        }
        #board_menu_text{
            font-size: 18px;
            font-weight:bold ;
            margin-bottom: 20px;
        }
        .board{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
        }
        .board_row{
            padding-top: 10px;
           height: 100%;
        }
        #board_menu{
            height: 50px;
        }
        #board_menu_text{
            font-size: 18px;
            font-weight:bold ;
            margin-bottom: 20px;
        }

		

        /* 제목이 길어서 잘렸을 경우 밑의 두개 처리해준다 */
       .ellipsis{
           position: relative;
           min-width: 50px;
           
       }
       .ellipsis>span{
        overflow: hidden;
           white-space: nowrap;
           text-overflow: ellipsis;
           position:absolute;
           left: 9px;
           right: 9px;
       }



        /*--쪽지-------------------------------------------------------------------------------------------*/
        /*쪽지 탭*/
        #message{
            padding-top: 50px;
        }
        /*탭 내용*/
        #v-pills-tabContent{
            padding-left: 25px;
            padding-right: 25px;
            width: 100%;
            /* border: 1px solid black; */

        }
        #v-pills-tabContent >div{
            color: black;
        }
		.title{
			font-weight:bold;
			text-decoration: none;
			color:black;
		}
		a{color:black;}
        /*쪽지함 메인-----------------------------------*/
        #board_menu_text{
            font-size: 18px;
            font-weight:bold ;
            margin-bottom: 20px;
        }
        #board_menu_text>div{
            padding: 0px;
        }
        .board{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
            padding: 0px;
        }
        .board_row{
            padding-top: 10px;
            height: 100%;
        }
        #board_menu{
            height: 50px;
        }

        /* 제목이 길어서 잘렸을 경우 밑의 두개 처리해준다 */
       .ellipsis{
           position: relative;
           min-width: 50px;
       }
       .ellipsis>span{
        overflow: hidden;
           white-space: nowrap;
           text-overflow: ellipsis;
           position:absolute;
           left: 0px;
           right: 0px;
           height: 100%;
       }
       /*받은 쪽지함, 보낸 쪽지함 버튼*/
       #v-pills-tab> button{
           width: 80px;
       }
       /* div{border: 1px solid blue;} */
        /*--게시글-----------------------------------------------------------------------------------------*/
        #list{
        border: 1px solid black;
        padding-top: 20px;
        height:100%;
         }

        #board_text{
            font-size: 18px;
            font-weight:bold ;
            margin-bottom: 20px;
        }
        #board_text>div{
            padding: 0px;
        }
        .board2{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
            padding: 0px;
        }
         .receive_msgboard2{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
            padding: 0px;
        }
        .send_msgboard2{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
            padding: 0px;
        }
        .board_row2{
            padding-top: 10px;
            height: 100%;
        }
        .member_boardbox2{
            /* text-align: center; */
            height: 50px;
            margin-bottom: 3px;
            padding: 0px;
        }

        /*--계정관리---------------------------------------------------------------------------------------*/
	.newcheck{
	text-align:center;
	display:none;
	}
         #header_header {
           height: 100%;
          padding-top: 80px;
          border: 1px #cfcfcf;
        }

        #modi{
            margin: auto;
            width: 60%; 
            max-width: 500px;
            border: 1px solid #cfcfcf;
            border-radius: 10px;
            padding-top: 50px;
            padding-bottom: 50px;
        }
        #modi div{
            font-size: 20px;   
           padding: 0px;
           margin-top: 5px;
          
        }
        #modi>div{
            padding-top: 5px;
            /* border-top: 1px solid #0080ff; */
        }
        .btn{
/*             margin-top: 20px; */
        }
		.member_board{
		    height: 50px;
            margin-bottom: 3px;
			width:600px;
/* 			align:center; */
		}
/*--top버튼----------------------------------------------------------------*/

#myBtn {
  display: none; 
  position: fixed; 
  bottom: 12px;
  width: 45px;
  height: 45px;
  right: 10px; 
  z-index: 99; 
  border: none; 
  outline: none; 
  background-color:  #0080ff;
  color: white; 
  cursor: pointer; 
  padding: 3px; 
  border-radius: 50%; 
  font-size: 32px; 
  font-weight: bold;
  padding-bottom:40px;
  padding-top: 0px;
}

#myBtn:hover {
  background-color: #555; 
}

 메세지보내기버튼 
 #sendMsgBtn{ 
 	min-width:90px; 
/* 	padding-right:25px;  */
 }



select{
    border-radius: 5px;
    margin-right: 8px;
    font-size: 18px;
    font-weight: bold;
}
.notice{
	color:red;
	font-weight:bold;
}


#sDate, #eDate{
	margin-right: 8px;
	width: 60%
}

    </style>


<script>
$(function(){
	
	//탭1 - 게시판 콤보박스 자동 set.
    let boardOption = "${boardOption}";
    if(boardOption == 'f'){//자유게시판
    	 $("#f").attr("selected","selected");
    }else if(boardOption == 'g'){//여행후기
    	 $("#g").attr("selected","selected");
    }else if(boardOption == 'j'){//구인구작
    	 $("#j").attr("selected","selected");
    }else if(boardOption == 'r'){//맛집
    	 $("#r").attr("selected","selected");
    }else if(boardOption == 'h'){//숙소리뷰
    	 $("#h").attr("selected","selected");
    }
    
    //게시글 콤보박스 선택 시 이벤트
    let previous = "";
    $("#boardSelect").on('focus', function () {
		previous  = this.value;
	}).change(function() {
		let boardOption = $("#boardSelect").val();
		location.href = "/adiminPageTap1.admin?boardOption="+boardOption+"&cpage=1"; 
	});

}) 

</script> 



</head>

<body id="body-pd">
    <header class="header" id="header" style="background-color:#f5f5f7">
        <div class="header_toggle"><i class='bx bx-menu' id="header-toggle"></i></div>
        <div><a href="/adiminPage.admin" class="comuview">관리자페이지</a></div>
        <div>
            <c:choose>
            <c:when test="${loginID !=null}">
                  <div class="d-md-inline d-none"> ${loginID }님 안녕하세요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
               <a href="/logout.member" class=""  >logout</a>               
            </c:when>
      
            <c:otherwise>
               <a href="#" class="login" id="login"  data-bs-toggle="modal" data-bs-target="#exampleModal">login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/goJoinPage.member" class="join">join</a>
            </c:otherwise>
         </c:choose>
        </div>
    </header>
    
    <div class="l-navbar" id="nav1-bar">
        <nav class="nav1">
            <div> <a href="/goIndex.board" class="nav1_logo"> <i class='bx bx-layer nav1_logo-icon'></i> <span class="nav1_logo-name">쉼표
                        <br>- 일상의 쉼표를 찍다</span> </a>
                <div class="nav1_list">
                    <a class="nav1_link" style="color:white;"> <i class='CurrIcon'></i> <span class="nav1_name"><span class="weather">
                    <span class="CurrTemp"></span>
                    <span class="City"></span>
                    </span></span> </a>
                    <a href="/communityMain.board" class="nav1_link"> <i class='bx bx-message nav1_icon'></i> <span
                            class="nav1_name">커뮤니티</span> </a>
                    <a href="/editorReMain.board?" class="nav1_link"> <i class='bx bx-book-bookmark nav1_icon'></i> <span class="nav1_name">에디터추천</span>
                    </a>
                    
                   
                    <a href="/boardMainView.board?cpage=1" class="nav1_link"> <i class='bx bx-home nav1_icon'></i> <span class="nav1_name">숙소리뷰</span>
                    </a>
                    <c:choose>
						<c:when test="${loginID !=null}">
							<a href="/goMyPage.mpg" class="nav1_link"> <i class='bx bx-user nav1_icon'></i> <span class="nav1_name">마이페이지</span> </a>
						</c:when>
		
						<c:otherwise>
							<a href="/goMyPage.mpg" class="nav1_link" data-bs-toggle="modal" data-bs-target="#exampleModal"> <i class='bx bx-user nav1_icon'></i> <span class="nav1_name">마이페이지</span> </a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${loginIsAdmin == 'Y'}">
               				<a href="/adiminPage.admin" class="nav1_link active"> <i class='bx bx-hard-hat nav1_icon'></i> <span class="nav1_name">관리자페이지</span> </a>
                		</c:when>
                	
                		<c:otherwise>
							
						</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <c:choose>
            <c:when test="${loginID !=null}">
               <a href="/logout.member" class="nav1_link"> <i class='bx bx-log-out nav1_icon'></i> <span class="nav1_name">로그아웃</span> </a>   
            </c:when>
         </c:choose>
            
        </nav>
    </div>
    
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
<script>
window.onload = function(){
	if(${loginID == null}){
		Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: 'Something went wrong!',
			  footer: '<a href="">Why do I have this issue?</a>'
			})
	}
}


</script>




<div class="container">
    <ul class="nav nav-tabs" id="myTab" role="tablist">

      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="board-tab" data-bs-toggle="tab" data-bs-target="#board-tab-pane" type="button" role="tab" aria-controls="board-tab-pane" aria-selected="true">게시글</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="member-tab" data-bs-toggle="tab" data-bs-target="#member-tab-pane" type="button" role="tab" aria-controls="member-tab-pane" aria-selected="false">계정</button>
      </li>

    </ul>

    <div class="tab-content" id="myTabContent">
      <!--탭1------------------------------------------------------->
      <div class="tab-pane fade show active" id="board-tab-pane" role="tabpanel" aria-labelledby="board-tab" tabindex="0">
	        <div class="row">
	        <!---------------------검색창---------------->
				<div class="col-12" id="searchbar" >
				    <nav class="navbar bg">
				        <div class="container-fluid">
				          <a class="navbar-brand"> </a>
				          <form action="/adiminPageTap1Search.admin" method="post" class="d-flex" role="search">
				          		<input type="hidden" value="1" name="cpage">
								
								<select name="boardOption" id="boardSelect">
				                        <option value="f" id="f">
				                            자유게시판
				                        </option>
				                        <option value="g" id="g">
				                            여행후기
				                        </option>
				                        <option value="j" id="j">
				                            구인구직
				                        </option>
				                        <option value="r" id="r">
				                            맛집
				                        </option>
				                        <option value="h" id="h">
				                            숙소리뷰
				                        </option>		                        		                        
								</select>
								
								
								<select name="serchOption" id="select">
				                        <option value="title">
				                            제목
				                        </option>
				                        <option value="id">
				                            작성자
				                        </option>
				                        <option value="contents">
				                            내용
				                        </option>
								</select>
				          	
				          	
				            <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search" name="contents">
				            <button class="btn btn-outline-secondary btn-sm" type="submit">Search</button>&nbsp;
				            <button class="btn btn-outline-secondary btn-sm" type="button" id ="cancel"><i class="fa-solid fa-eraser"></i></button>&nbsp;
				            		<c:choose>
										<c:when test="${loginID !=null}">
											<button type="button" class="btn btn-primary btn-sm" id="writeBtn" style="white-space:nowrap;"><i class="fa-solid fa-pen-to-square"></i>글 작성하기</button>
										</c:when>
						
										<c:otherwise>
											<button type="button" class="btn btn-primary btn-sm" style="white-space:nowrap;" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-pen-to-square"></i>글 작성하기</button>
										</c:otherwise>
									</c:choose>
									
				          </form>
				          
				        </div>
				      </nav>
				</div>
	        
	        
		        <div class="row m-0" id="board_menu" ></div>
		
		        <div class="row m-0">
		             <div class="col-12 board ">
		                <div class="row " id="board_menu_text">
		                    <div class="col-md-1 d-none d-md-block p-0 text-center">번호</div>
		                    <div class="col-7 col-md-5 " ><p class="mx-3">제목</p></div>
		                    <div class="col-3 col-md-2 p-0 text-center">글쓴이</div>
		                    <div class="col-md-2 d-none d-md-block p-0 text-center">날짜</div>
		                    <div class="col-md-1 d-none d-md-block p-0 text-center">조회</div>
		                    <div class="col-2 col-md-1 p-0 text-center">추천</div>
		                </div>
		             
		            </div>
		        </div>
	        
<!-- 			            여기는 공지글 -->
		        <c:forEach var="i" items="${noticeList }">
		        <div class="col-12  board">
		            <div class="row m-0 border border-2 rounded board_row ">
		            	
		                <div class="col-1 col-md-1 d-none d-md-block p-0 text-center">
		                <p class="notice">공지</p>
		                </div>
		               	<div class="col-7 col-md-5 m-0 title ididid " style="text-align:left">
		               		<a href="/detailView.board?cpage=${cpage}&seq=${i.all_board_seq}&click=ok" style="color:black">${i. title }</a>
		               	</div>
		                <div class="col-3 col-md-2 p-0 ellipsis text-center ididid">${i.id }</div>
		                <div class="col-md-2 d-none d-md-block p-0 text-center"><fmt:formatDate value="${i.write_date }" pattern="yy-MM-dd"/></div>
		                <div class="col-md-1 d-none d-md-block p-0 text-center">${i.view_count}</div>
		                <div class="col-2 col-md-1 p-0 text-center">${i.like_count}</div>
		                
		            </div>
		        </div>
		        </c:forEach>
		        
		        
<!-- 				        여기는 목록 -->
		        <c:forEach var="i" items="${list }">
		        <div class="col-12  board">
		            <div class="row m-0 border border-2 rounded board_row ">
		            	
		                <div class="col-1 col-md-1 d-none d-md-block p-0 text-center">${i.line}</div>
		               	<div class="col-7 col-md-5 m-0 title ididid "style="text-align:left">
		               		<a href="/detailView.board?cpage=${cpage}&seq=${i.all_board_seq}&click=ok" style="color:black">${i. title }</a>
		               	</div>
		                <div class="col-3 col-md-2 p-0 ididid text-center">${i.id }</div>
		                <div class="col-md-2 d-none d-md-block p-0 text-center"><fmt:formatDate value="${i.write_date }" pattern="yy-MM-dd"/></div>
		                <div class="col-md-1 d-none d-md-block p-0 text-center">${i.view_count}</div>
		                <div class="col-2 col-md-1 p-0 text-center">${i.like_count}</div>
		                
		            </div>
		        </div>
		        </c:forEach>

	        </div>
	        
			<div class="row">
	            <div class="col-12 text-center">
					<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
								<li class="page-item">
								  <a class="page-link" href="#" aria-label="Previous">
								    <span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
								${navi}
								<li class="page-item">
								  <a class="page-link" href="#" aria-label="Next">
								    <span aria-hidden="true">&raquo;</span>
								  </a>
								</li>
						  </ul>
					</nav>
	            </div>
			</div>
	        
      </div>

      <!--탭2-------------------------------------------------------->
      <div class="tab-pane fade" id="member-tab-pane" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
      
				<div class="col-12" id="searchbar" >
				    <nav class="navbar bg">
				        <div class="container-fluid">
				          <a class="navbar-brand"> </a>
				          <div class="d-flex">
				          		<input type="hidden" value="1" name="cpage">
								
								<input type="date" name="sDate" id="sDate">
								<input type="date" name="eDate" id="eDate">
									
								<select name="searchMember" id="searchMember">
				                        <option value="searchNick" id="searchNick">
				                            닉네임
				                        </option>
				                        <option value="searchEmail" id="searchEmail">
				                            이메일
				                        </option>	                        		                        
								</select>
				          	
				          	
				            <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search" id="Membercontents" name="contents">
				            <button class="btn btn-outline-secondary btn-sm" type="button" id="search-member">Search</button>&nbsp;
				            <button class="btn btn-outline-secondary btn-sm" type="button" id ="cancel-member">x</button>&nbsp;
				          </div>
				          
				        </div>
				      </nav>
				</div>
<!-- 				padding 구간 -->
				<div class="row m-0" id="board_menu" ></div>
<!-- 				멤버 목록 -->
		        <div class="row m-0 member_boardbox" id="member_boardbox">
		        	<div class="row" style="padding-left:30px; padding-right:0px;">
		                <div class="row " id="member_menu_text" style="text-align:center;">
		                    <div class="col-6 col-lg-3 col-sm-6 d-lg-block p-0 text-center">아이디</div>
		                    <div class="col-6 col-lg-5 col-sm-6" ><p class="mx-3">이메일</p></div>
		                    <div class="col-lg-4 d-none d-lg-block p-0 text-center">가입일</div>
		                </div>
		           </div>
		             	<div class="col-12 member_boardtext" id="member_boardtext">
                                
   							<!-- 멤버리스트 반복문위치 -->
                        </div>
		        </div>
		</div>	

    </div>

</div>




<div class="modal fade" id="exampleModalsend" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	 
      	받는 사람 | <input type="text" placeholder="받는 사람 ID" id="modal_receiver"><p></p>
      	<input type="text" placeholder="제목을 입력하세요" id="modal_title" name="title" style="width:100%">
      	<p>
      	
      	</p>
      	
        <textarea style="width:100%; min-height:150px" placeholder="내용을 입력하세요" id="modal_msgContents"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="modal_sendmsg">보내기</button>
      </div>
    </div>
  </div>
</div>
    
    
    
     <!--top 버튼-->
    <button onclick="topFunction()" id="myBtn" title="Go to top">↑</button>
    <!-------------------------------------------------------------------------------------------------------------------Container Main end-->




    <script>
    $("#writeBtn").on("click",function(){
    	let boardOption = $("#boardSelect").val();
    	location.href="/writeboard.board?boardOption="+boardOption;
    })
    
    
    //탭1 클릭 이벤트
    $("#board-tab").on("click",function(){
    	let boardOption = $("#boardSelect").val();
    	location.href = "/adiminPageTap1.admin?boardOption="+boardOption+"&cpage=1"; 
    	
    })
    
	//X버튼 클릭 시(검색 취소)
    $("#cancel").on("click",function(){
    	let boardOption = $("#boardSelect").val();
    	let cpage = ${cpage};
    	location.href = "/adiminPageTap1.admin?boardOption="+boardOption+"&cpage="+cpage+""; 
    })
    
    
    
    //탭2 클릭 이벤트
//     $("#member-tab").on("click",function(){
// 		alert("미완성된 기능입니다.")
//     })
    
    
    
    
    $("#password-input").on("keyup",function(e){
        if(e.keyCode==13){
            $("#modal_loginBtn").click();
        }
    })
    
    //컨텐츠 숨김 나타냄 회원정보 수정
    $("#modify").on("click",function(){
        $(".content").css("display","none"); //모든 컨텐츠
        $("#back").css("display","inline"); //취소버튼
        $("#modify").css("display","none");   //수정하기 버튼
        $(".check").css("display","inline"); //비밀번호 확인 입력창
       
        
        $("#checkpw").on("click",function(){
            $.ajax({
            url:"/modified.member",
            data:{pw:$("#pwtext").val()},
            dataType:"json",
            type:"post"
        }).done(function(resp){
        	console.log(resp);
            
        	if(resp){
        		$(".newcheck").css("display","block"); //정규식 확인 보이기
                $(".content").css("display","inline");
                $("#ok").css("display","inline");    //완료버튼
                $(".pw").css("display","block");    //비번 수정
                $(".check").css("display","none");  //비밀번호 확인 입력창
                $(".check2").css("display","inline-block");
//                 $("#pw").css("display","block");
                $("#back").css("display","inline-block"); //취소버튼
                $("#pw1").val("");
				$("#pw2").val(""); 
				$("#pw1").attr("placeholder","변경하실 비밀번호");
				$("#pw2").attr("placeholder","변경하실 비밀번호 확인");
				 
//                 $(".modify").attr("contenteditable","true");
                $("#editID").attr("disabled", false);
                $(".modify").css("color","#0089ff");
                $("#id").focus();
            }else{
                alert("비밀번호가 틀렸습니다.");
            }
        })
            
        })
        })
        
        
        //회원정보 수정 완료
         //회원정보 수정 완료시
        $("#ok").on("click",function(){
        	if('${loginID }'==$("#editID").val()){
        		
        		if($("#pw1").val()==$("#pw2").val()&& isPw($("#pw1").val())){
        			$.ajax({
                		url:"/modifiedOk.member",
                        data:{id:$("#editID").val(), pw:$("#pw1").val()},
                        dataType:"json",
                        type:"post"
                	}).done(function(resp){
          
                		if(resp){        	//회원정보 수정 성공시		                			
                			location.reload();
                		}else{
                			alert("error");
                		}        			                		
                	})
        		}else{
        			$("#pw1").focus();
        		}
        		
        	}else{
        		console.log("duplIDCheck.member 실행");
        		$.ajax({
            		url:"/duplIDCheck.member",
            		type:"get",
            		data:{nickname:$("#editID").val()},
            		dataType:"json"
            		}).done(function(resp){
            				console.log("닉네임 조회 resp : " + resp);
            					if(resp==false){						
            			        	if(isNickName($("#editID").val())) {
            			        		if($("#pw1").val()==$("#pw2").val()){
            			        			if(isPw($("#pw1").val())){
            			                	$.ajax({
            			                		url:"/modifiedOk.member",
            			                        data:{id:$("#editID").val(), pw:$("#pw1").val()},
            			                        dataType:"json",
            			                        type:"post"
            			                	}).done(function(resp){
            			          
            			                		if(resp){        	//회원정보 수정 성공시		                			
            			                			location.reload();
            			                		}else{
            			                			alert("error");
            			                		}        			                		
            			                	})	
            			        		}else{    			        			
            			        			$("#pw1").focus();
            			        		}
            			        		
            			        	}else{
            			        		$("#editID").focus();         			        
            			        	}
            					}
            					
            				}
            					else if(resp==true){
            						$("#editID").focus();
            						$("#testID").text("이미 사용중인 닉네임입니다.");
        		        			$("#testID").css({ color: "red" });
        					}
            			})       
        	}
        	 	
        	})
//정규식

//아이디 중복확인
		$("#editID").on("input",function(){
			
		$.ajax({
		url:"/duplIDCheck.member",
		type:"get",
		data:{nickname:$("#editID").val()},
		dataType:"json"
		}).done(function(resp){
				
					if(resp==false){						
						if(isNickName($("#editID").val())){
							$("#testID").text("사용 가능한 닉네임입니다!");
							$("#testID").css({ color: "blue" });
						}else{
							$("#testID").text("닉네임은 한글,영문, 숫자 2-10자");
							$("#testID").css({ color: "red" });
						}

					}else if('${loginID }'==$("#editID").val()){
    					$("#testID").text("본인의 닉네임입니다.");
	        			$("#testID").css({ color: "blue" });
    				}else if(resp==true){
						$("#testID").text("사용중인 닉네임입니다!");
						$("#testID").css({ color: "red" });
					}
				});
			})
	//비밀번호 확인 
	$(".pw_check").on("input", function () {
            let pw1 = $("#pw1").val();
            let pw2 = $("#pw2").val();
            let check = $("#testPWok");
            if(pw2!=="" &&pw1!==""){
            	if (pw1 == pw2) {
            		if(isPw(pw1)){
            			check.text("비밀번호가 일치합니다");
                        check.css({ color: "blue" });
            		}else{
            			check.text("비밀번호는 숫자,영문,특수문자 포함 8~16자");
                        check.css({ color: "red" });
                        
            		}                	
                }
                else if(pw1!==pw2){
                    check.text("비밀번호가 일치하지 않습니다");
                    check.css({ color: "red" });
                }
            }else if(pw2=="" || pw1==""){
    
            	check.text("비밀번호는 필수정보입니다");
                check.css({ color: "black" });
            }
            
        });

//닉네임(한글,영문, 숫자 2-10자)
		function isNickName(asValue) {
			var regExp = /^[a-z가-힣0-9]{2,10}$/g;		
			return regExp.test(asValue);
			};
		//비밀번호(숫자 영문 특문 조합 8~16자)
		function isPw(asValue) {
			var regExp = /^.{8,16}$/;
			return regExp.test(asValue);
		};
  
    
  //계정관리
   
  
  
        
        

    $("#back").on("click",function(){
        $(".content").css("display","inline"); 
        $("#modify").css("display","inline");
        $("#back").css("display","none");
        $("#ok").css("display","none");
        $(".pw").css("display","none");
        $(".check").css("display","none");
        $(".check2").css("display","none");
        $("#pwtext").val("");
        $("#pwtext").attr("placeholder","비밀번호를 입력하세요.");
        $(".newcheck").css("display","none");//정규식 확인 
        
        $(".modify").attr("contenteditable","false");
        $("#editID").attr("disabled", true);
        $(".modify").css("color","black");
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
    
    
    </script>
    
    <script>
    
        document.addEventListener("DOMContentLoaded", function (event) {

            const show1Navbar = (toggleId, navId, bodyId, headerId) => {
                const toggle = document.getElementById(toggleId),
                    nav = document.getElementById(navId),
                    bodypd = document.getElementById(bodyId),
                    headerpd = document.getElementById(headerId)

                // Validate that all variables exist
                if (toggle && nav && bodypd && headerpd) {
                    toggle.addEventListener('click', () => {
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

            show1Navbar('header-toggle', 'nav1-bar', 'body-pd', 'header')

            /*===== LINK ACTIVE =====*/
            const linkColor = document.querySelectorAll('.nav1_link')

            function colorLink() {
                if (linkColor) {
                    linkColor.forEach(l => l.classList.remove('active'))
                    this.classList.add('active')
                }
            }
            linkColor.forEach(l => l.addEventListener('click', colorLink))

            // Your code to run since DOM is loaded and ready
        });
        /*========== Calendar Script ==========*/
      document.addEventListener('DOMContentLoaded', function() {
         var calendarEl = document.getElementById('calendar');
         var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            googleCalendarApiKey: 'AIzaSyBJEiOXKXgzlPpGoHUB3C00sjH3_2I_Tyw',
            eventSources: [{
               googleCalendarId: '${email }',
               className: 'gcal-event'
               },{
               googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
               className : 'ko_event'
               }], 
            eventClick: function(info) {
               info.jsEvent.stopPropagation();
               info.jsEvent.preventDefault();
            },
            dayMaxEventRows: true, // for all non-TimeGrid views
              views: {
                timeGrid: {
                  dayMaxEventRows: 6// adjust to 6 only for timeGridWeek/timeGridDay
                }
              }
         });
         calendar.render();
         });
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
               let $Temp = Math.floor(data.main.temp) + 'º';
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
   
   
   //top 버튼

   mybutton = document.getElementById("myBtn");

   window.onscroll = function() {scrollFunction()};

   function scrollFunction() {
     if (document.body.scrollTop > 60 || document.documentElement.scrollTop > 60) {
       mybutton.style.display = "block";
     } else {
       mybutton.style.display = "none";
     }
   }


   function topFunction() {
     document.body.scrollTop = 0; 
     document.documentElement.scrollTop = 0; 
   }
	//멤버 스크립트
	
	let isMemberClick = true;
	
	$("#member-tab").on("click", function(){
		if(isMemberClick){
			$(".member_boardtext").remove();
			let memberText = $("<div class='col-12 member_boardtext'>");
			$(".member_boardbox").append(memberText);
		
			let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
	        getMemberList(page);
	        page++;
//				if(isAjaxing){
//					return;
//				}
//				isAjaxing = true;
//			alert(page)
		 	  $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		  	  	if($(window).scrollTop() >= $(document).height() - $(window).height()){
//			  	        alert(page)
		  	  		getMemberList(page);
		   	        page++;   
//		                console.log(page);
		    	 } 
		 	   });
		 	   
		 	   isMemberClick = false;
		}else{
			
		}

		
	});
	
	
	
	 function getMemberList(pape){
		let page = pape;
		$.ajax({
           url : '/searchMember.admin',
           type : 'POST',
           data : {page : page},
           dataType : 'json'
      }).done(function(resp){
//			$(".receive_msgboard2").remove();
//			if()
		console.log(resp);
		for(let i = 0; i < resp.length; i++){
			
			let memberDiv = $("<div class='col-12 member_boardbox2'>");
			let memberDiv1 = $("<div class='row m-0 border border-2 rounded board_row '>");
			
			let memberDiv2 = $("<div class='col-6 col-lg-3 col-sm-6 d-lg-block p-0 text-center'>");
			memberDiv2.text(resp[i].id);
			
			let memberDiv3 = $("<div class='col-6 col-lg-5 col-sm-6 m-0 title ellipsis p-0 text-center'>");
			memberDiv3.text(resp[i].email);
			
			
			let memberDiv4 = $("<div class='col-lg-4 d-none d-lg-block p-0 text-center'>");
			memberDiv4.text(resp[i].information);
			
			
			
			$(".member_boardtext").append(memberDiv);
			memberDiv.append(memberDiv1);
			memberDiv1.append(memberDiv2);
			memberDiv1.append(memberDiv3);
			memberDiv1.append(memberDiv4);
			
			memberDiv.hide();
			memberDiv.fadeIn(1500);
            
		}
//			setTimeout(function(){isAjaxing = false;}, 100000);
	})
};
// 	search 리셋버튼
	
	$("#cancel-member").on("click", function(){
			$(".member_boardtext").remove();
			let memberText = $("<div class='col-12 member_boardtext'>");
			$(".member_boardbox").append(memberText);
		
			let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
	        getMemberList(page);
	        page++;
//				if(isAjaxing){
//					return;
//				}
//				isAjaxing = true;
//			alert(page)
		 	  $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		  	  	if($(window).scrollTop() >= $(document).height() - $(window).height()){
//			  	        alert(page)
		  	  		getMemberList(page);
		   	        page++;   
//		                console.log(page);
		    	 } 
		 	   });
		 	   
		 	 setTimeout(function(){
		 		$("#cancel-member").removeAttr("disabled");
		 	},3000);

		
	});
	
	
	
	isSendClick= true;
	$("#v-pills-send-tab").on("click", function(){
		if(isSendClick){
			console.log(123);
			$(".send_msgtext").remove();
			let msgText = $("<div class='col-12 send_msgtext'>");
			$(".send_msgbox").append(msgText);
			
			let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
	        getSendList(page);
	        page++;
		
//		alert(page)
		 	  $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		  	  	if($(window).scrollTop() >= $(document).height() - $(window).height()){
//		  	        alert(page)
		  	  		getSendList(page);
		   	        page++;   
//		                console.log(page);
		    	 } 
		 	   });
		 	   isSendClick = false;
		}else{
			
		}
		
	});
	
	
	
	 function getSendList(pape){
		let page = pape;
		
		$.ajax({
          url : '/sendMsgBox.mpg',
          type : 'POST',
          data : {page : page},
          dataType : 'json'
     }).done(function(resp){
		
		
		for(let i = 0; i < resp.length; i++){
			
			let msgDiv = $("<div class='col-12 send_msgboard2'>");
			let msgDiv1 = $("<div class='row m-0 border border-2 rounded board_row '>");
			
			let msgDiv2 = $("<div class='col-md-2 col-lg-1 d-none d-lg-block p-0'>");
			msgDiv2.text(resp[i].line);
			
			let msgDiv3 = $("<div class='col-8 col-md-8 col-lg-5 m-0 title ellipsis p-0'>");
			let msgHref = $("<a href='detailMsg.mpg?message_seq="+resp[i].message_seq+"'>");
			let msgSpan = $("<span>")
			msgHref.text(resp[i].title);
			
			let msgDiv4 = $("<div class='col-4 col-md-4 col-lg-2 p-0 ellipsis text-center'>");
			let msgSpan2 = $("<span>")
			msgSpan2.text('${loginID}');
			
			let msgDiv5 = $("<div class='col-md-2 col-lg-4 d-none d-lg-block p-0 text-center'>");
			msgDiv5.text(resp[i].date);
			
			$(".send_msgtext").append(msgDiv);
			msgDiv.append(msgDiv1);
			msgDiv1.append(msgDiv2);
			msgDiv1.append(msgDiv3);
			msgDiv3.append(msgSpan);
			msgSpan.append(msgHref);
			msgDiv1.append(msgDiv4);
			msgDiv4.append(msgSpan2);
			msgDiv1.append(msgDiv5);
			
			msgDiv.hide();
            msgDiv.fadeIn(1500);
		}
	})
};

//쪽지보내기
$("#modal_sendmsg").on("click", function(){
	if($("#modal_receiver").val()==""){
		alert("받는 사람의 닉네임을 입력하세요.");
		$("#modal_receiver").focus();
		return false;
	}else if($("#modal_title").val()==""){
		alert("제목을 입력해주세요.");
		$("#modal_title").focus();
	}else if($("#modal_msgContents").val()==""){
		alert("내용을 입력해주세요.");
		$("#modal_msgContents").focus();
	}else{
    	$.ajax({
    		url:"sendMsg.mpg",
    		type:"post",
    		data:{
    			receiver:$("#modal_receiver").val(),
    			title:$("#modal_title").val(),
    			contents:$("#modal_msgContents").val()
    			},
    		dataType:"json"
    	}).done(function(resp){
    		console.log(resp);
    		if(resp==0){
    			alert("존재하지 않는 닉네임입니다.");
    		}else{
    			location.reload();
    		}
    	})
    }
})
//멤버 검색하기
$("#search-member").on("click",function(){
	let sDate = $("#sDate").val();//시작일
	let eDate = $("#eDate").val();//종료일
	if(sDate == "" && eDate == ""){
	}else if(sDate == ""){
		alert("시작 일자를 선택해주세요. 닉네임이나 이메일로만 검색하고 싶으시다면 일자를 삭제해 주세요.");
		return false;
	}else if(eDate ==""){
		alert("마지막 일자를 선택해주세요. 닉네임이나 이메일로만 검색하고 싶으시다면 일자를 삭제해 주세요.");
		return false;
	}
	
	
	$(".member_boardtext").remove();
	let memberText = $("<div class='col-12 member_boardtext'>");
	$(".member_boardbox").append(memberText);
	
	let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.
    getMemberSearchList(page);
    page++;
//		if(isAjaxing){
//			return;
//		}
//		isAjaxing = true;
//	alert(page)
 	  $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
  	  	if($(window).scrollTop() >= $(document).height() - $(window).height()){
//	  	        alert(page)
  	  		getMemberSearchList(page);
   	        page++;   
//                console.log(page);
    	 } 
 	   });

})
function getMemberSearchList(pape){
		let page = pape;
		
		$.ajax({
			url:"adiminPageTap2Search.admin",
			type:"get",
			data:{
				searchOption : $("#searchMember").val(),
				Membercontents : $("#Membercontents").val(),
				sDate : sDate,
				eDate : eDate,
				page : page
			},
			dataType:"json"
		}).done(function(resp){
			for(let i = 0; i < resp.length; i++){
				
				let memberDiv = $("<div class='col-12 member_boardbox2'>");
				let memberDiv1 = $("<div class='row m-0 border border-2 rounded board_row '>");
				
				let memberDiv2 = $("<div class='col-6 col-lg-3 col-sm-6 d-lg-block p-0 text-center'>");
				memberDiv2.text(resp[i].id);
				
				let memberDiv3 = $("<div class='col-6 col-lg-5 col-sm-6 m-0 title ellipsis p-0 text-center'>");
				memberDiv3.text(resp[i].email);
				
				
				let memberDiv4 = $("<div class='col-lg-4 d-none d-lg-block p-0 text-center'>");
				memberDiv4.text(resp[i].date);
				
				
				
				$(".member_boardtext").append(memberDiv);
				memberDiv.append(memberDiv1);
				memberDiv1.append(memberDiv2);
				memberDiv1.append(memberDiv3);
				memberDiv1.append(memberDiv4);
				
				memberDiv.hide();
				memberDiv.fadeIn(1500);
	            
			}
		})
};

</script>

</body>

</html>