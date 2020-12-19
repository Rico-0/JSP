<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*" %>
<%@page import="board.boardDAO"%>
<%@include file="DB_connect.jsp" %>

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
			writer.println("alert('댓글을 작성하려면 로그인해야 합니다.')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}

		boardDAO dao = new boardDAO();
		
		// 글 번호, 작성자 아이디, 내용을 얻어옴
		String bId = request.getParameter("bId");
		String bCommentName = request.getParameter("bCommentName");
		String bCommentContent = request.getParameter("comment");
		PrintWriter script = response.getWriter();
		
		if(bCommentContent == null || bCommentContent.equals("")){ // 내용이 입력되지 않았을 경우
			script.println("<script>");
			script.println("alert('댓글을 입력해 주세요.')");
			script.println("location.href='content.jsp?bId=" + bId + "'"); // 다시 해당 글로 돌아감
			script.println("</script>");
		}
	%>

	<script type = "text/javascript">
		var con = confirm('댓글을 등록하시겠습니까?');
		var bId = "<%= bId %>";
		var bCommentName = "<%= bCommentName %>";
		var bCommentContent = "<%= bCommentContent %>";
		if(con == true){
			location.href = "writeComment_Action.jsp?bId=" + bId + "&bCommentName=" + bCommentName +  "&bCommentContent=" + encodeURI(bCommentContent); // 일부 문자가 인코딩 에러를 발생시키므로 내용을 인코딩해서 넘겨줘야 함
		}else{
			location.href = "content.jsp?bId=" + bId;
		}
	</script>
	
</body>
</html>