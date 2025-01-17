<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>쉼표 | 게시글 수정하기</title>

   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <!--  -->
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
<!--         <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--             integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<!--         <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json"> -->
        <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <!-- SummerNote -->
<!--         <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<!--         <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<!--         <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!--         <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

        <script src="/summernote-0.8.18-dist/summernote-lite.js"></script>
        <script src="/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="/summernote-0.8.18-dist/summernote-lite.css">
        
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");

            :root {
                --header-height: 3rem;
                --nav-width: 68px;
                --first-color: #0080ff;
                --first-color-light: #AFA5D9;
                --white-color: #ffffff;
                --body-font: 'Nunito', sans-serif;
                --normal-font-size: 1rem;
                --z-fixed: 100
            }
			
			body::-webkit-scrollbar{
   				 display: none; /* Chrome, Safari, Opera*/
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

            .login, .join {
                color: black;
            }

            /* .header_img img {
                width: 40px
            } */

            .l-navbar {
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

            .nav {
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                overflow: hidden
            }

            .nav2 {
                flex-direction: row;
                justify-content: center;
            }

            .nav_logo,
            .nav_link {
                display: grid;
                grid-template-columns: max-content max-content;
                align-items: center;
                column-gap: 1rem;
                padding: .5rem 0 .5rem 1.5rem
            }

            .nav_logo {
                margin-bottom: 2rem
            }

            .nav_logo-icon {
                font-size: 1.25rem;
                color: var(--white-color)
            }

            .nav_logo-name {
                color: var(--white-color);
                font-weight: 700
            }

            .nav_link {
                position: relative;
                color: var(--first-color-light);
                margin-bottom: 1.5rem;
                transition: .3s
            }

            .nav-link2 {
                color: black;
            }

            .nav_link:hover {
                color: var(--white-color)
            }

            .nav_icon {
                font-size: 1.25rem
            }

            .show1 {
                left: 0
            }

            .body-pd {
                padding-left: calc(var(--nav-width) + 1rem)
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

            .height-100 {
                height: 100vh
            }

            @media screen and (min-width: 768px) {
                body {
                    margin: calc(var(--header-height) + 1rem) 0 0 0;
                    padding-left: calc(var(--nav-width) + 2rem)
                }

                .header {
                    height: calc(var(--header-height) + 1rem);
                    padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
                }

                .l-navbar {
                    left: 0;
                    padding: 1rem 1rem 0 0
                }

                .show1 {
                    width: calc(var(--nav-width) + 156px)
                }

                .body-pd {
                    padding-left: calc(var(--nav-width) + 188px)
                }
            }
            .note-editor{
            	background-color: white;
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
.comuview{

color:rgb(0, 0, 0);


position:absolute;

left: 50%;

transform: translate(-50%, -50%);

text-align:center;
font-weight: bold;
    	font-size:20px;

}
.comuview:hover{
       color:#0080ff;
       }
       
       @media (min-width: 576px) {
  .footer1 {
    text-align:right;
  }
}
@media (max-width: 960px) {
  .footer2 {
    text-align:center;
  }
}
@media (min-width: 960px) {
  .footer2 {
    text-align:left;
  }
}

            /*  */
            /* .bd-placeholder-img {
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
        } */


            /*Container Main start-----------------------------------------------------*/
            * {
                box-sizing: border-box;
            }

            .container {
                 border : 1px solid #aaa9a9; 
                border-radius: 10px;
            }

            [class ^="col"] {
/*                 border: 1px solid #aaa9a9; */
                
                padding: 0px;
            }

            .mainTitle{
                font-weight: bold;
            }
            select{
                border-radius: 5px;
                margin: 2px; margin-left: 2px;
                font-size: 18px;
                font-weight: bold;
            }
            .title{
                border: 0px; width: 85%; 
                margin: 2px; margin-left: 3px;
                font-size: 20px;
                font-weight: bold;
            }
            #firstFile{margin-left: 2px;}
            .addFile{margin: 2px;}
            #plusBtn, #minusBtn{
                border-radius: 4px;
                margin: 2px;
                font-weight: bold;
                width: 30px;
            }

			img{
				max-width:100% !important;
			}
			
			#page{
				font-weight:bold;
            color: #0080ff;
            text-decoration: underline;
            text-underline-position : under;
            font-size:17px;
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
	
.page{
	font-weight:bold;
            color: #0080ff;
            text-decoration: underline;
            text-underline-position : under;
            font-size:17px;
            }			
			
        </style>
        
        
<!--         화연 로드 시 -------------------------------->
        <script>
        
    	$(function(){
			
    		//게시판 콤보박스 자동 set.
            let seq = "${dto.all_board_seq}";
            let boardOption = seq.substring(0,1);
            
            if(boardOption == 'f'){//자유게시판
            	$("[value='f']").attr("selected","selected");
        		$("#f").addClass("page");
            }else if(boardOption == 'g'){//여행후기
            	$("[value='g']").attr("selected","selected");
        		$("#g").addClass("page");
            }else if(boardOption == 'j'){//구인구작
            	$("[value='j']").attr("selected","selected");
        		$("#j").addClass("page");
            }else if(boardOption == 'r'){//맛집
            	$("[value='r']").attr("selected","selected");
        		$("#r").addClass("page");
            }else if(boardOption == 'h'){//숙소리뷰
            	$("[value='h']").attr("selected","selected");
        		$("#h").addClass("page");
            }else if(boardOption == 'e'){//에디터추천
            	$("[value='e']").attr("selected","selected");
            }
            
            
            $("#delBtn0").click(function(){
            	if(boardOption == 'g' || boardOption == 'h' || boardOption == 'e' ){
            		let div = $("<div>");
            		let file = $("<input onchange='checkFile(this)'>");
            		let text = $("<i>");
            		
            		div.attr("id","profileDiv");
            		file.attr({type:"file",name:"file0",id:"profile",required:"required", accept:"image/*"});
            		text.text("프로필 사진")
            		
            		div.append(file);
            		div.append(text);
            		div.append("<br>");
            		$("#fileArea").prepend(div);
            	}
            })
   	}) 
        
        </script>
        
        
        
        
        
    </head>

<body id="body-pd">
    <header class="header" id="header" style="background-color:#f5f5f7">
        <div class="header_toggle"><i class='bx bx-menu' id="header-toggle"></i></div>
        <div><a href="/board/communityMain.jsp" class="comuview"> 게시판 글 수정하기</a></div>
        <div>
            <c:choose>
				<c:when test="${loginID !=null}">
						<div class="d-md-inline d-none">${loginID }님 안녕하세요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<a href="/logout.member" class="d-md-inline d-none">logout</a>					
				</c:when>
		
				<c:otherwise>
					<a href="#" class="login" id="login"  data-bs-toggle="modal" data-bs-target="#exampleModal">login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			 <a href="/goJoinPage.member" class="join">join</a>
				</c:otherwise>
			</c:choose>        </div>
    </header>
    <ul class="nav nav2">
        <li class="nav-item">
            <a class="nav-link nav-link2" href="/boardMainView.board?cpage=1" id="f">자유게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link nav-link2" href="/galleryMain.board?cpage=1" id="g">여행후기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link nav-link2" href="/jobMain.board?cpage=1" id="j">구인구직</a>
        </li>
        <li class="nav-item">
            <a class="nav-link nav-link2" href="/foodMain.board?cpage=1" id="r">맛집</a>
        </li>
        <li class="nav-item">
            <a class="nav-link nav-link2" href="/houseMain.board?cpage=1" id="h">숙소리뷰</a>
        </li>
    </ul>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="/goIndex.board" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">쉼표
                        <br>- 일상의 쉼표를 찍다</span> </a>
                <div class="nav_list">
                    <a class="nav_link" style="color:white;"> <i class='CurrIcon'></i> <span class="nav_name"><span class="weather">
                    <span class="CurrTemp"></span>
                    <span class="City"></span>
                    </span></span> </a>
                    <a href="/communityMain.board" class="nav_link active"> <i class='bx bx-message nav_icon'></i> <span class="nav_name">커뮤니티</span> </a> 
                   <a href="/editorReMain.board?" class="nav_link"> <i class='bx bx-book-bookmark nav_icon'></i> <span class="nav_name">에디터추천</span> </a> 
                   <a href="/houseMain.board?cpage=1" class="nav_link"> <i class='bx bx-home nav_icon'></i> <span class="nav_name">숙소리뷰</span> </a>
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


    <!-- 게시글 작성하기 메인 ----------------------------------------------------------------------->
    <!--Container Main start-->
    <form action="/modify.board" method="post" enctype="multipart/form-data" id="form">
        <div class="container my-4">
            <div class="row">
                <!-- <div class="col-12 text-center display-6 mainTitle p-1">
                    - 게시판 글 작성하기 -
                </div> -->
                
                
                
                <div class="col-12 ">
					<select name="boardOption" id="boardOption" disabled>
                        <option value="f">
                            자유게시판
                        </option>
                        <option value="g">
                            여행후기
                        </option>
                        <option value="j">
                            구인구직
                        </option>
                        <option value="r">
                            맛집
                        </option>
                        <option value="h">
                            숙소리뷰
                        </option>
                        <c:if test="${loginID eq 'admin'}">
	                        <option value="e">
	                            에디터추천
	                        </option>
                        </c:if>
                    </select>
                    <input type="text" placeholder="글 제목을 입력하세요" name="title" id="title" class="title" required value="${dto.title}">
                </div>
				<!-- 기존파일 보기 -->
				<div class="col-12 " id="upfiles" style="border-top:1px solid #aaa9a9">
					<div class="col-6 filebox"  style="padding-left:8px;">
						기존에 선택된 파일					
                 	</div>
                </div>
                
                <div class="col-12 " id="fileArea" style="border-top:1px solid #aaa9a9">
                    <!-- <input type="hidden" name="fileCount" id="fileCount" value=1>  -->
                    <input type="file" name="file1" id="firstFile" onchange='checkFile(this)'>
                    <button id="plusBtn" type="button">+</button>
                    <button id="minusBtn" type="button">-</button>
                </div>
                <div class="col-12 ">
                    <textarea class="summernote" name="contents" id="summernote">${dto.contents}</textarea>
                </div>
                <div class="col-12 " style="text-align: right;">
                    <a href="/detailView.board?cpage=${cpage}&seq=${dto.all_board_seq }&click=no"><input type="button" value="취소" class="my-1"></a><%--아작스로 /detailView.board 로 seq같이 보내줘야 함. --%>
                    <input type="hidden" value="${dto.all_board_seq }" name="seq">
                    <input type="submit" value="수정완료" class="mx-2" >
                </div>
            </div>
        </div>
        <footer class="mt-auto text-black-50" style="background-color:#f5f5f7">
        	<hr>
        	<div class="row">
        		<div class="d-none d-lg-block col-5 footer1">
        			<img src="/imgsrc/footerlogo2.png">
        		</div>
        		<div class="col-12 col-lg-7 footer2">
        			<div class="col-12">
        				프로젝트 쉼표
        			</div>
        			<div class="col-12">
        				강석원 | 강정윤 | 박한길 | 어 현 | 임혜경 | 조양기
        			</div>
        			<div class="col-12">
        				Designed by Catch the Java
        			</div>
        		</div>
        	</div>
        	<hr>
        </footer>
    </form>
    
    
 <!--top 버튼-->
    <button onclick="topFunction()" id="myBtn" title="Go to top">↑</button>
    
    <!--  ----------------------------------------------------------게시글 작성하기 메인------------->

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

            show1Navbar('header-toggle', 'nav-bar', 'body-pd', 'header')

            /*===== LINK ACTIVE =====*/
            const linkColor = document.querySelectorAll('.nav_link')

            function colorLink() {
                if (linkColor) {
                    linkColor.forEach(l => l.classList.remove('active'))
                    this.classList.add('active')
                }
            }
            linkColor.forEach(l => l.addEventListener('click', colorLink))

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
        
        //게시글 작성하기/////////////////////////////////////////////////////////////////////////////////////////
		let i = 2;
        //+버튼 클릭시 type=file 추가
		$("#plusBtn").on("click",function(){
			let fileInput = ("<input type='file' class='addFile' name = file"+i+++" onchange='checkFile(this)'>");
			$("#fileArea").append("<br>");
			$("#fileArea").append(fileInput);
			// $("#fileCount").val(i-1);
		});
	    //+버튼 클릭시 type=file 제거
		$("#minusBtn").on("click",function(){
            console.log($("#fileArea").children(".addFile").length)
            for(let i=0 ; i<$("#fileArea").children(".addFile").length; i++ ){
                if(i+1 == $("#fileArea").children(".addFile").length){
                    let brIndex = $($("#fileArea").children(".addFile")[i]).siblings().length-1
                    $($($("#fileArea").children(".addFile")[i]).siblings()[brIndex]).remove();
                    $($("#fileArea").children(".addFile")[i]).remove();
                }
            }
            
		});
	    
		
	    //UTF-8 인코딩 방식 바이트 길이 구하기 함수
		const getByteLengthOfString = function(s,b,i,c){
		    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		    return b;
		};
	    
	    
	    //form태그 submit이벤트
		let frm = document.getElementById("form");
		frm.onsubmit = function(){
			$.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : {delFileList : delFileList ,pseq:"${dto.all_board_seq }"},
	 	      	 traditional: true,
	 	        type : "GET",
	 	        url : "/modiFile.file",
	 	        dataType:"json"
	 	        
	 	    });
			
			let summernote = document.getElementById("summernote").value;
			if(summernote == "" || summernote =="<p><br></p>"){
				alert("본문을 작성해주세요.");//작성완료 버튼 클릭 시 서머노트 안 적었으면 경고창 & 로그인 안 했으면 경고창//
				return false;
			}
			
	        if(${loginID == null}){
	        	alert("로그인이 필요합니다.");
	        	return false;
	        }
	        
	        //서머노트 input type = file 부분 임시적으로 삭제.
	        $("[class *='note-image-input form-control-file note-form-control note-input']").remove();
	        
	        //submit 될 때는 콤보박스 사용할 수 있게 풀어야지 값이 넘어감.
	        $("#boardOption").removeAttr("disabled");
	        

	        //제목 UTF-8 인코딩 방식 바이트 길이 구하기
	        const titleLength = $("#title").val();
	        const contentsLength = $("#summernote").val();
	        
	        if(getByteLengthOfString(titleLength)>50){
	        	alert("제목을 줄여주세요.");
	        	return false;
	        }
	        if(getByteLengthOfString(contentsLength)>12000){
	        	alert("내용을 줄여주세요.");
	        	return false;
	        }
	        if(titleLength.replace(/\s|　/gi, "").length == 0){
	        	alert("제목을 입력해주세요.");
	        	$("#title").val("");
	        	$("#title").focus();
	        	return false;
	        }
 
		}
	    
		
		
		//서머노트////////////////////////////////////////////////////////////////////////////
		$('.summernote').summernote({
			placeholder:"자유롭게 글을 작성할 수 있습니다.<br/>명예훼손이나 상대방을 비방, 불쾌감을 주는 글, 욕설, 남을 모욕하는 글은 임의로 제제가 있을 수 있습니다.",
            toolbar: [
							['style', ['style']],
							['fontsize', ['fontsize']],
							['font', ['bold', 'italic', 'underline', 'clear']],
							['fontname', ['fontname']],
							['color', ['color']],
							['para', ['ul', 'ol', 'paragraph']],
							['height', ['height']],
							['table', ['table']],
							['insert',['picture','link','video','hr']],
							['view', ['codeview','fullscreen']],
							['help', ['help']]
						],

            minHeight: 500,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
//             spellCheck: false,
            callbacks: {//콜백
                //이미지 업로드 시 감지하는 이벤트
               onImageUpload : function(files, editor, welEditable) {
            	   
            	   var maxImageSize = 10 * 1024 * 1024;//용량 제한
            	   if(files[0].size > maxImageSize){
            		   alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(files[0].size / 1024 / 1024 * 100) / 100) + 'MB');
            		   return false;
            	   }
            	   
            	   
            	   sendFile(files[0],this);//파일 업로드
                },
                
                //이미지 마우스 오른쪽 클릭하여 쓰레기통 이모티콘 클릭 시 감지하는 이벤트
                onMediaDelete : function(target) {
// alert(target[0].src);
 	                deleteFile(target[0].src);
 	            }
            }
        });
		
        //이지미 업로드 시 서블릿으로 보내서 업로드 하고, 서버에 저장된 이미지파일 주소 받아오기
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
// 	            enctype: 'multipart/form-data',
	 	        url : "/imageUpload.file",
// 	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        dataType:"json",
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력 - 서버에서 받아온 이미지파일 주소를 이미지 태그형식으로 만들기
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        
	 	        }
	 	    });
	 	}

        //이미지 삭제 시 서버로 해당 이미지 소스 보내기(서블릿에서 소스-이미지 파일 주소 받아서 삭제)
// 	 	function deleteFile(src) {
// 	 	    $.ajax({
// 	 	        data: {src : src},
// 	 	        type: "POST",
// 	 	        url: "/dummmyImageDel.file", // replace with your url
// // 	 	        cache: false,
// // 	 	        dataType:"json",
// 	 	        success: function(resp) {
// 	 	            console.log(resp);
// 	 	        }
// 	 	    });
// 	 	}
         //////////////////////////////////////////////////////////////////////서머노트////////
         
                   //파일목록
    $.ajax({
            url:"/f_list.file",
            data:{parent_seq:"${dto.all_board_seq}"},
            dataType:"json"
         }).done(function(resp){
        	 console.log("파일있음");
               for(let i=0; i<resp.length; i++){
                  let fileDiv = $("<div>");
                  
                  let anker = $("<a>");
                  anker.attr("href","/f_download.file?ori_name="+resp[i].ori_name+"&sys_name="+resp[i].sys_name);
                  anker.text(resp[i].ori_name);
               	  let delBtn = $("<button type="+"button"+	">");
               	  delBtn.attr("id","delBtn"+i);
                  delBtn.text("ㅡ");
               	  
                  fileDiv.append(anker);
                  fileDiv.append(delBtn);
                  $("#upfiles").append(fileDiv);
                  
                  
                  $("#delBtn"+i).on("click",function(){               	  
               	   console.log($(this).siblings().text()+"삭제");
               		delFileName($(this).siblings().text());
               	   $(this).parent().remove();
               	   
               	   
                  })
               }
           })
   		let delFileList=[];
         
        function delFileName(fileName){
        	
        	 delFileList.push(fileName);
        	console.log(fileName+"콜백파일이름");
        	console.log(delFileList);
        }
        
        
        
        
        
        //파일 업로드 용량 제한////////////////////////////////
        function checkFile(el){

			// files 로 해당 파일 정보 얻기.
			var file = el.files;
		
			// file[0].size 는 파일 용량 정보입니다.
			if(file[0].size > 1024 * 1024 * 10){
				// 용량 초과시 경고후 해당 파일의 용량도 보여줌
				alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
			}
		
			// 체크를 통과했다면 종료.
			else return;
		
			el.outerHTML = el.outerHTML;
		}
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

	
	
</script>
</body>

</html>