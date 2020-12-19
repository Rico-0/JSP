<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "java.net.URLEncoder, java.net.URLDecoder" %>
<%@ include file="DB_connect.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO" %>


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
		
		boardDAO dao = new boardDAO();
		
		// 글 번호, 댓글 번호, 내용을 얻어옴
		String bId = request.getParameter("bId");
		String bCommentName = request.getParameter("bCommentName");
		String bCommentContent = request.getParameter("bCommentContent");
		PrintWriter script = response.getWriter();
		
		// 글 번호를 int형으로 변환
		int bId_convert = Integer.parseInt(bId);
	%>
		<!-- 댓글 등록하는 쿼리 수행 -->
		<sql:update dataSource = "${dataSource}" var = "resultSet">
		insert into board_comment (bId, bCommentId, bCommentName, bCommentContent, bDate) values (?,?,?,?,?);
		<sql:param value = "<%= bId_convert %>" />
		<sql:param value = "<%= dao.getNextCommentId(bId_convert) %>" />
		<sql:param value = "<%= bCommentName %>" />
		<sql:param value = "<%= bCommentContent %>" />
		<sql:param value = "<%= dao.getDate() %>" />
		</sql:update>
	<%
		script.println("<script>");
		script.println("alert('정상적으로 등록되었습니다.')");
		script.println("location.href='content.jsp?bId=" + bId + "'");
		script.println("</script>");
	%>
</body>
</html>