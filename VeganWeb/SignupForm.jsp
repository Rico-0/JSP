<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file = "Navbar.jsp" %>
<%@ include file = "DB_connect.jsp" %>
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
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/form-validation.css" rel="stylesheet">
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
 </head>
 <body>
	<div class = "jumbotron" style = "background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size:cover;">
		<div class = "container">
			<h1 class = "display-3" style = "text-align:center">회원 가입</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<form name = "signup" class="needs-validation" action="DB_insert.jsp" method="post" style = "width: 100%" onsubmit = "return checkMyform_signUp();">
      	<h4 class="mb-3">Let's join our vegan life!</h4>
          <div class="mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디" maxlength = "15" required>
            <div class="invalid-feedback"> 아이디는 필수 항목입니다.</div>
          </div>
         <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="pw" name = "pw" placeholder="비밀번호" maxlength = "15" required>
            <div class="invalid-feedback">비밀번호는 필수 항목입니다.</div>
          </div> 
        <button class="btn btn-primary btn-lg btn-block" type="submit" style = "width: 30%;">회원 가입하기</button>
         </form>
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