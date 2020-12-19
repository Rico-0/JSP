<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="DB_connect.jsp"%>
<%@ include file="Navbar.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="board" class="board.BDto" scope="session" />


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
			writer.println("alert('세션이 만료되었습니다. 다시 로그인하세요!')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}

		int bId = 0;
		if (request.getParameter("bId") != null)
			bId = Integer.parseInt(request.getParameter("bId"));

		if (bId == 0) {
			writer.println("<script>");
			writer.println("alert('유효하지 않은 글입니다.')");
			writer.println("location.href='list.jsp'");
			writer.println("</script>");
		}
		
		%>
	
	<c:set var = "id_board" value = "<%= bId %>"/>
	<c:set var = "user_id" value = "<%= userID %>" />
	<sql:query dataSource = "${dataSource}" var = "result">
		SELECT * from board where bId = ?
		<sql:param value = '${id_board}' />
	</sql:query>
	
	<!-- 글 작성자와 현재 로그인한 사용자의 아이디가 일치하지 않을 경우 -->
	<c:forEach var="row" items="${result.rows}">
		<c:if test="${row.bName != user_id}"> 
		<%
		writer.println("<script>");
		writer.println("alert('권한이 없습니다.')");
		writer.println("location.href='list.jsp'");
		writer.println("</script>");
		%>
		</c:if>
	</c:forEach>
	
	<!-- 현재 글 번호가 bId인 글을 삭제함 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
			DELETE FROM board WHERE bId = ?
			<sql:param value = "<%= bId %>" />
	</sql:update>
	<% 
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('삭제가 완료되었습니다.')");
	script.println("location.href='list.jsp'");
	script.println("</script>");
	%>
</body>
</html>