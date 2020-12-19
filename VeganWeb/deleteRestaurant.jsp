<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.net.URLEncoder, java.net.URLDecoder" %>
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
<title>Vegan Life</title>
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico"
	type="image/x-icon">
</head>
<body>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

	<%
		request.setCharacterEncoding("UTF-8");

		String userID = null;
		if (session.getAttribute("sessionId") != null) {
			userID = (String) session.getAttribute("sessionId");
		}else{
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('로그인을 하세요.')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}
		
		String url_enc = URLEncoder.encode(request.getParameter("url"), "UTF-8");
		String url_dec = URLDecoder.decode(request.getParameter("url"), "UTF-8");
	%>
	<!-- 삭제 여부를 묻는 자바스크립트 코드 -->
	<script type = "text/javascript">
		var con = confirm("삭제하시겠습니까?");
		// 디코딩된 url 주소를 저장
		var url = "<%= url_dec %>" 
		if(con == true){
			location.href = "deleteRestaurant_Action.jsp?url=" + url; // url 정보를 삭제를 수행하는 페이지에 전송
		}else{
			location.href = "likeRestaurant.jsp";
		}
	</script>
</body>
</html>