<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "Navbar.jsp" %>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<!doctype html> 
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/jumbotron/">
<link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
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
 <link href="./resources/css/jumbotron.css" rel="stylesheet">
 <meta charset = "UTF-8">
 <title>자유게시판 - Vegan Life</title>
 <link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
<body>
<script>
	// 제목과 내용이 모두 입력되었는지 검사하는 함수
	function CheckBoard(){
		var form = document.write;
		
		if(write.bTitle_write.value == "" || form.bContent_write.value == ""){
			alert("입력이 안 된 항목이 있습니다.");
			return false;
		}
		return true;
	}	
</script>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("sessionId") != null){
			userID = (String)session.getAttribute("sessionId");
		}else{
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원만 게시글을 작성할 수 있습니다.')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}		
	%>
  <div class="jumbotron"  style = "background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size:cover;">
    <div class="container">
      <h1 class="display-3" style = "margin-right:50px; text-align:center">자유게시판</h1>
    </div>
  </div>
  <!-- 게시판 글쓰기 영역 시작 -->
  <div class = "container">
  	<div class = "row">
  		<form name = "write" method = "post" enctype ="multipart/form-data" action = "writeAction.jsp" style = "width:100%" onsubmit = "return CheckBoard();">
  		<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd; background-color: #ffffff;">
  			<thead>
  				<tr>
  					<th style = "background-color: #ffffff; text-align: center">글쓰기</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr>
  					<td><input type = "text" class="form-control" placeholder= "글 제목" name = "bTitle_write" maxlength = "50"></td>
  				</tr>
  				<tr>
  					<td><textarea class = "form-control" placeholder="내용을 입력하세요!" name = "bContent_write" maxlength = "2048" style = "height: 350px"></textarea></td>
  				</tr>
  				<tr>
 					<td><input type="file" name="Image" class="form-control"></td>
  				</tr>
  			</tbody>
  		</table>
  		<!--  글쓰기, 목록보기 버튼  -->
  		<div style = "width:auto; text-align:center">
  		<input type = "submit" class = "btn btn-primary" value = "글쓰기"/>&nbsp;
  		<a href = "list.jsp" class = "btn btn-primary">목록보기</a>
  		</div>
  		</form>
  	</div>
  </div>
</body>
</html>