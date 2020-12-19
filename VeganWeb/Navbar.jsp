 <%@ page contentType="text/html; charset=utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import= "java.net.URLDecoder"%>
<%
	String sessionId = (String) session.getAttribute("sessionId"); // 현재 저장된 세션을 얻어옴
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>Vegan Life</title>
    <link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbar-static/">

    <!-- Bootstrap core CSS / dropdown 실행 시 필수 -->
<link rel="stylesheet" href="./css/bootstrap.min.css" >
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
    <link href="./css/navbar-top.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">VeganLife</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="main.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list.jsp">레시피 공유 게시판</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="findRestaurant.jsp">비건 식당 찾기</a>
      </li>
      <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="recipe_dropdown" data-target="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">추천 레시피 모아보기
        	<span class = "caret"></span></a>
        	 <div class="dropdown-menu" role = "menu" aria-labelledby="recipe_dropdown">
         	 <a class="dropdown-item" href="foods.jsp">식사</a>
         	 <a class="dropdown-item" href="salads.jsp">샐러드</a>
         	 <a class="dropdown-item" href="desserts.jsp">디저트</a>
        	</div>
     </li>
   </ul>
    <!-- 세션이 유효한지 아닌지에 따라서 다르게 띄워주기 -->
    <c:choose>
		<c:when test="${empty sessionId}">
		  <form class="form-inline my-2 my-lg-0" style = "align:right">
             <button class="btn btn-outline-success my-2 my-sm-0" type = "button" onclick = "location.href = 'loginForm.jsp'" >로그인</button>
             <button class="btn btn-outline-success my-2 my-sm-0" style = "margin-left: 10px" type = "button" onclick = "location.href = 'SignupForm.jsp'" >회원 가입</button>
          </form>
		</c:when> 
		<c:otherwise>
		<ul class="navbar-nav mr-auto">
		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="user_dropdown" data-target="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false"><%= sessionId %> 님
        		<span class = "caret"></span></a>
       	 	<div class="dropdown-menu" role = "menu" aria-labelledby="user_dropdown">
         	 <a class="dropdown-item" href="likeRestaurant.jsp">내 비건 식당 목록</a>
        	</div>
     	 </li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="updateUser.jsp"/>'>회원 수정</a></li>
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="deleteUser.jsp"/>'>회원 탈퇴</a></li>
		</ul>
		</c:otherwise>
	</c:choose>
  </div>
</nav>
</html>

