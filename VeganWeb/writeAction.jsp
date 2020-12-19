<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*" %>
<%@page import="board.boardDAO"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@include file="DB_connect.jsp" %>
<jsp:useBean id="board" class="board.BDto" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
<title>자유게시판 - Vegan Life</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		// 현재 세션 상태를 체크한다
		String userID = null;
		
		if(session.getAttribute("sessionId") != null){
			userID = (String)session.getAttribute("sessionId");
		}else{
			writer.println("<script>");
			writer.println("alert('세션이 만료되었습니다. 다시 로그인하세요!')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}

		
		boardDAO dao = new boardDAO();
		int available_tmp = 1; // 글 이용 가능
		int updated_tmp = 0; // 글이 아직 업데이트되지 않았음을 나타냄

		String realFolder = application.getRealPath("/boardimages"); // 파일을 업로드할 경로
		String encType = "utf-8"; //인코딩 타입
		int maxSize = 10 * 1024 * 1024; //최대 업로드될 파일의 크기: 10Mb
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
				encType, new DefaultFileRenamePolicy()); // 파일을 업로드하기 위한 설정
				
		String bTitle = multi.getParameter("bTitle_write"); // 제목 얻어오기
		String bContent = multi.getParameter("bContent_write"); // 내용 얻어오기

		// 업로드된 파일을 가져옴
		Enumeration files = multi.getFileNames(); 
		String fname = (String) files.nextElement(); 
		String fileName = multi.getFilesystemName(fname); 
		
		
		if (userID != null){
	%>
	<!--  게시글 등록하는 쿼리 수행 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
			INSERT INTO board(bId, bName, bTitle, bContent, bDate, bAvailable, updated, fileName) VALUES (?,?,?,?,?,?,?,?)
			<sql:param value = "<%= dao.getNextBbsId() %>" />
			<sql:param value = "<%= userID %>" />
			<sql:param value = "<%= bTitle %>" />
			<sql:param value = "<%= bContent %>" />
			<sql:param value = "<%= dao.getDate() %>" />
			<sql:param value = "<%= available_tmp %>" />
			<sql:param value = "<%= updated_tmp %>" />
			<sql:param value = "<%= fileName %>"/>
		</sql:update>

	<%
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('정상적으로 등록되었습니다.')");
	script.println("location.href='list.jsp'");
	script.println("</script>");
	
	}
			
	%>
</body>
</html>