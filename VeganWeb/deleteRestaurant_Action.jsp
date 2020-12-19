<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
			writer.println("alert('세션이 만료되었습니다. 다시 로그인하세요!')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}
		
		// 저장된 식당 이름이 한글로 표시되려면 인코딩 후 디코딩해야 함
		String url_enc = URLEncoder.encode(request.getParameter("url"), "UTF-8");
		String url_dec = URLDecoder.decode(request.getParameter("url"), "UTF-8");
		
		PrintWriter script = response.getWriter();
	%>
	
	<!-- 유저 아이디와 저장된 주소값을 얻어옴 -->
	<c:set var = "user_id" value = "<%= userID %>" />
	<c:set var = "url" value = "<%= url_dec %>" />

	<!-- 식당 삭제 쿼리 수행 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
		DELETE FROM like_restaurant WHERE url = ? AND id = ?
		<sql:param value = "${url}" />
		<sql:param value = "${user_id}" />
	</sql:update>
	
	<%
	script.println("<script>");
	script.println("alert('삭제가 완료되었습니다.')");
	script.println("location.href='likeRestaurant.jsp'");
	script.println("</script>");
	%>
</body>
</html>