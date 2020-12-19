<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="DB_connect.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.BDto"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*, java.io.*" %>


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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


	
	<%
	
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("sessionId") != null) {
			userID = (String) session.getAttribute("sessionId");
		}

		PrintWriter writer = response.getWriter();
		
		// 파일을 업로드할 경로
		String realFolder = application.getRealPath("/boardimages");
		String encType = "utf-8"; //인코딩 타입
		int maxSize = 10 * 1024 * 1024; //최대 업로드될 파일의 크기: 10Mb
		
		  File isDir = new File(realFolder); // 폴더 경로로 파일 객체 생성

		   if(!isDir.isDirectory()){ // 만약 디렉토리가 존재하지 않을 경우
		    	isDir.mkdir(); // 디렉토리를 만듬
		    }
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
				encType, new DefaultFileRenamePolicy()); // 파일을 업로드하기 위한 설정
				
		// 입력한 제목, 내용을 얻어옴
		String bTitle = multi.getParameter("bTitle");
		String bContent = multi.getParameter("bContent");
	
		// 파일이 있다면 업로드된 파일 정보를 가져옴
		Enumeration files = multi.getFileNames(); 
		String fname = (String) files.nextElement(); 
		String fileName = multi.getFilesystemName(fname); 
		
		
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
		
		boardDAO dao = new boardDAO();
		String getNow = dao.getDate(); // 업데이트 시 저장 날짜를 새롭게 설정
		int updated = 1; // 업데이트됨을 나타냄
		%>
		
	<c:set var = "id_board" value = "<%= bId %>"/>
	<c:set var = "user_id" value = "<%= userID %>" />
	<sql:query dataSource = "${dataSource}" var = "result" scope = "session">
		SELECT * from board where bId = ?
		<sql:param value = '${id_board}' />
	</sql:query>
	
	<!-- 글 작성자와 아이디가 일치하지 않을 경우 -->
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
	
	<c:choose>
	<c:when test = "${existed_fileName ne null}">
	<sql:update dataSource = "${dataSource}" var = "resultSet">
			UPDATE board SET bTitle = ?, bContent = ?, bDate = ?, updated = ? WHERE bId = ?
			<sql:param value = "<%= bTitle %>" />
			<sql:param value = "<%= bContent %>" />
			<sql:param value = "<%= getNow %>" />
			<sql:param value = "<%= updated %>" />
			<sql:param value = "<%= bId %>" />
	</sql:update>
	</c:when>
	<c:otherwise>
		<sql:update dataSource = "${dataSource}" var = "resultSet">
			UPDATE board SET bTitle = ?, bContent = ?, bDate = ?, updated = ?, fileName = ? WHERE bId = ?
			<sql:param value = "<%= bTitle %>" />
			<sql:param value = "<%= bContent %>" />
			<sql:param value = "<%= getNow %>" />
			<sql:param value = "<%= updated %>" />
			<sql:param value = "<%= fileName %>" />
			<sql:param value = "<%= bId %>" />
	</sql:update>
	</c:otherwise>
	</c:choose>
	<%
	writer.println("<script>");
	writer.println("alert('수정이 완료되었습니다.')");
	writer.println("location.href='list.jsp'");
	writer.println("</script>");
	%>

</body>
</html>