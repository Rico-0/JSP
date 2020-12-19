<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "Navbar.jsp" %>
<!doctype html> 
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/jumbotron/">
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
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
 <meta charset = "UTF-8">
 <title>Vegan Life</title>
 <link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
 </head>
 <body>
<main role="main">
  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron"  style = "background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size:cover;">
    <div class="container">
      <h1 class="display-3">Welcome to vegan life!</h1>
      <h3>Let's make our eco-friendly life. </h3>
    </div>
  </div>

  <div class="container">
    <!-- Example row of columns -->
    <div class="row">
	 <div class="row mb-2">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">Start</strong>
          <h3 class="mb-0">101 Reasons</h3><br>
          <p class="card-text mb-auto">채식을 해야 하는 이유가 무려 101가지나 있습니다. 무엇일까요?</p>
          <a href="https://veganup.tistory.com/1" class="stretched-link">읽으러 가기  &raquo;</a>
        </div>
        <div class="col-auto d-none d-lg-block">
           <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>why vegan?</title><image xlink:href="./images/start.png" width="100%" height="100%"/></svg>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">Book</strong>
          <h3 class="mb-0">Vegan Books</h3><br><br>
          <p class="mb-auto">각종 비건 도서들을 검색하고 싶으신가요?</p>
          <a href="https://www.google.co.kr/search?ei=cwKlX7nYKJvVmAXdvYg4&q=%EB%B9%84%EA%B1%B4+%EB%8F%84%EC%84%9C&oq=%EB%B9%84%EA%B1%B4+%EB%8F%84%EC%84%9C&gs_lcp=CgZwc3ktYWIQAzIECAAQHjoFCAAQsQM6AggAOggIABCxAxCDAToECAAQQzoHCAAQsQMQQ1D0CFihD2DxEmgCcAB4AYABdogBjgeSAQM4LjKYAQCgAQGqAQdnd3Mtd2l6wAEB&sclient=psy-ab&ved=0ahUKEwj53aXFue3sAhWbKqYKHd0eAgcQ4dUDCA0&uact=5" class="stretched-link">검색하기 &raquo;</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>vegan books</title><image xlink:href="./images/book.png" width="100%" height="100%"/></svg>
        </div>
      </div>
    </div>
  </div>
    </div>
    <hr><br>
        <div class="row">
	 <div class="row mb-2">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">Cosmetic</strong>
          <h3 class="mb-0">Vegan Brand</h3><br>
          <p class="card-text mb-auto">우리가 자주 쓰는 화장품도 비건 브랜드가 있습니다.</p>
          <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=28053672&memberNo=35546739" class="stretched-link">알아보기 &raquo; </a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>vegan cosmetics</title><image xlink:href="./images/cosmetic.png" width="100%" height="100%"/></svg>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">Fashion</strong>
          <h3 class="mb-0">Vegan Brand</h3><br>
          <p class="mb-auto">패션에도 비건 브랜드가 있다는 사실, 알고 계신가요?</p>
          <a href="https://1boon.kakao.com/sweets/ql" class="stretched-link">알아보기 &raquo;</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>vegan brand</title><image xlink:href="./images/fashion.png" width="100%" height="100%"/></svg>
        </div>
      </div>
    </div>
  </div>
    </div>
  </div> <!-- /container -->
</main>
	 <footer>
	 	<div class = "container">
	 	<hr>
	 		<span>&copy; Terry Hong</span>
	 	</div>
	</footer>
</body>
</html>