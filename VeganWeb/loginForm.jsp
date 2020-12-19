<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "board.boardDAO" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>Login - VeganWeb</title>

  
    <link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">

    <!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
      <link rel="stylesheet" href="./css/signin.css" />
  </head>
  <%
  	// 저장된 쿠키가 있는지 확인
  	Cookie[] cookies = request.getCookies();
    String id_cookie = "";
    String pw_cookie = "";
   	if(cookies != null){ // 만약 쿠키가 존재한다면
   		for(int i = 0; i < cookies.length; i++){
   			if(cookies[i].getName().equals("id")){ // 아이디 쿠키가 존재할 경우
   				id_cookie = URLDecoder.decode(cookies[i].getValue(), "UTF-8"); // 아이디 쿠키를 설정
   			}
   			if(cookies[i].getName().equals("pw")){ // 비밀번호 쿠키가 존재할 경우
   				pw_cookie = URLDecoder.decode(cookies[i].getValue(),"UTF-8"); // 비밀번호 쿠키를 설정
   			}
   		}
   	}
   	
   	// 쿠키가 유효한 경우, 자동 로그인 기능 추가
   	boardDAO dao = new boardDAO();
   	if(dao.login(id_cookie, pw_cookie) == 1){
   		session.setAttribute("sessionId", id_cookie);
   		response.sendRedirect("main.jsp");
   	}
  %>
  <body class="text-center" style = "background-image: url('./images/loginForm_image.JPG'); background-repeat: no-repeat; background-size:cover;">
    <form class="form-signin" action = "DB_process.jsp" style = "background-color:#FFFFFF;" method = "post">
 		 <img class="mb-4" src="./images/loginForm_icon.PNG" alt="" width="72" height="72">
  		<h1 class="h3 mb-2 font-weight-normal">로그인하기</h1><br>
 		 <label for="inputId" class="sr-only">아이디</label>
 		 <input type="text" name="inputid" class="form-control" placeholder="아이디" required autofocus>
  		<label for="inputPassword" class="sr-only">비밀번호</label>
  		<input type="password" name="inputPassword" class="form-control" placeholder="비밀번호" required>
 		<div class="checkbox mb-3">
   		 <label>
     		 <input type="checkbox" value="remember-me" name = "save_user"> 로그인 정보 저장하기
   		 </label><br>
   		 <a href = "main.jsp">비회원으로 이용하기</a>
  		</div>
  		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button><br>
  		<button class="btn btn-lg btn-primary btn-block" type="submit" onclick="location.href='SignupForm.jsp'">회원 가입</button>
  		<p class="mt-5 mb-3 text-muted">&copy; Hong Terry</p>
	</form>
</body>
</html>


