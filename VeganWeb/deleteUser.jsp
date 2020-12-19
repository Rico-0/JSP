<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="DB_connect.jsp"%>
<%@ page import="java.io.PrintWriter"%>



<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/jumbotron/">

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

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="./css/jumbotron.css" rel="stylesheet">
<meta charset="UTF-8">
<title>자유게시판 - Vegan Life</title>
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico"
	type="image/x-icon">
</head>
<body>
<script src="js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("sessionId") != null) {
			userID = (String) session.getAttribute("sessionId");
		}

		PrintWriter writer = response.getWriter();
		
		if (userID == null) {
			writer.println("<script>");
			writer.println("alert('로그인을 하세요.')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}
		
		%>
	<!-- 삭제 여부를 결정하는 자바스크립트 코드 -->
	<script type = "text/javascript">
		var con = confirm("정말 회원 탈퇴를 하시겠습니까? 탈퇴 시 작성한 게시글은 자동으로 삭제되지 않습니다.");
		var user_id = "<%= userID %>"
		if(con == true){
			location.href = "deleteUser_Action.jsp?id=" + user_id; // 회원 아이디를 삭제를 수행하는 페이지에 넘겨줌
		}else{
			history.back();
		}
	</script>
</body>
</html>