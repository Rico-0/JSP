<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file = "Navbar.jsp" %>
<%@ include file = "DB_connect.jsp" %>
<%@ page import="java.io.PrintWriter"%>
<!doctype html>
<html lang="ko">
<head>
<title>Vegan Life</title>
<meta name="viewport" content="width=device-width initial-scale=1">
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
<link href="./css/form-validation.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
 </head>
 <body>
	<%
	 	String userId = (String) session.getAttribute("sessionId"); 
		PrintWriter writer = response.getWriter();
		if (userId == null) {
		writer.println("<script>");
		writer.println("alert('회원만 이용할 수 있는 페이지입니다.')");
		writer.println("location.href='loginForm.jsp'");
		writer.println("</script>");
	}
	%>

	<!-- 현재 로그인한 회원의 정보를 가져옴 -->
	<c:set var = "user_id" value = '<%= userId %>' />
		<sql:query dataSource="${dataSource}" var="result">
   		SELECT * FROM vegan_user WHERE id = ? 
    	<sql:param value="${user_id}"/>
	</sql:query>
	
	<div class = "jumbotron" style = "background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size:cover;">
		<div class = "container">
			<h1 class = "display-3" style = "text-align:center">회원 수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
				<c:forEach var="row" items="${result.rows}">
				<form class = "needs-validation" action="updateUserAction.jsp" method="post" style = "width: 100%" onsubmit = "return checkMyform_userUpdate();">
					<h4 class="mb-3">:)</h4>
					<div class="mb-3">
					  	<label for="id">아이디</label>
						<input type="text" class="form-control" id = "id" name="id"  maxlength="15" value = "${row.id}" disabled>
					</div>
					<div class="mb-3">
						 <label for="passwd">비밀번호</label>
						<input type="password" class="form-control" placeholder="비밀번호" id = "pw" name="pw"  maxlength="15" required>
						<div class="invalid-feedback">비밀번호는 필수 항목입니다.</div>
					</div>
					<button type="submit" class="btn btn-primary btn-lg btn-block" style = "width: 30%;">수정하기</button>
				</form>
				</c:forEach>
			</div>
	</div>
	 <footer>
	 	<div class = "container">
	 	<hr>
	 		<span>&copy; Terry Hong</span>
	 	</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="./js/jquery.slim.min.js"><\/script>')</script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/form-validation.js"></script>
</body>
</html>