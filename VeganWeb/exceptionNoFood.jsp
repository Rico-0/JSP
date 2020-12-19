<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isErrorPage = "true" %>
<%@ include file = "Navbar.jsp" %>
<!doctype html> 
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/jumbotron/">
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
 <link href="./css/jumbotron.css" rel="stylesheet">
 <meta charset = "UTF-8">
 <title>Error</title>
<body>
	 <div class="jumbotron">
	 	<div class="container">
	 		<h2 class = "alert alert-danger">해당 음식이 존재하지 않습니다.</h2>
	 	</div>
	 </div>
	 <div class="container">
	 	 <p class="lead">음식 이름을 다시 한 번 확인해 주세요.</p>
   		 <p><a href = "main.jsp" class="btn btn-secondary">메인 화면으로 돌아가기 &raquo;</a>
	 </div>
</body>
</html>