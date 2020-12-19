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
		
		String bId = request.getParameter("bId");
		String bCommentId = request.getParameter("bCommentId");
		
	%>
	<!-- 삭제 여부를 묻는 자바스크립트 코드 -->
	<script type = "text/javascript">
		var con = confirm("삭제하시겠습니까?");
		// 자바스크립트에서는 jsp 변수를 가져와 저장하는 것이 가능하므로 위 자바 코드에서 작성한 변수들을 저장함
		var bId = "<%= bId %>";
		var bCommentId = "<%= bCommentId %>";
		var bCommentName = "<%= userID %>";
		if(con == true){
			// 만약 삭제하기에서 '예' 를 눌렀다면 글 번호, 댓글 번호, 작성자 이름을 전송
			location.href = "deleteComment_Action.jsp?bId=" + bId + "&bCommentId=" + bCommentId + "&bCommentName=" + bCommentName; 
		}else{ // 취소했다면 해당 글로 이동
			location.href = "content.jsp?bId=" + bId;
		}
	</script>
</body>
</html>