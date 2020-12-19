<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="DB_connect.jsp"%>
<%@ include file="Navbar.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>


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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
<script>
	// 제목과 내용을 모두 입력했는지 체크하는 함수
	function CheckBoard(){
		var form = document.update;
		
		if(form.bTitle.value == "" || form.bContent.value == ""){
			alert("입력이 안 된 항목이 있습니다.");
			return false;
		}	
		return true;
	}	
</script>
	
	<%
		String userID = null;
		if (session.getAttribute("sessionId") != null) {
			userID = (String) session.getAttribute("sessionId");
		}

		PrintWriter writer = response.getWriter();
		if (userID == null) {
			writer.println("<script>");
			writer.println("alert('회원만 게시글을 수정할 수 있습니다.')");
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
	
	<!-- 글 번호가 bId인 게시글을 얻어옴 -->
	<c:set var = "id_board" value = "<%= bId %>"/>
	<c:set var = "user_id" value = "<%= userID %>" />
	<sql:query dataSource = "${dataSource}" var = "result" scope = "session">
		SELECT * from board where bId = ?
		<sql:param value = '${id_board}' />
	</sql:query>
	
	<!-- 만약 게시글 작성자와 현재 로그인한 사용자가 일치하지 않을 경우 -->
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
	
	<div class="jumbotron" style="background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<h1 class="display-3" style="margin-right: 50px; text-align:center">자유게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<c:forEach var="row" items="${result.rows}">
			<form name = "update" action = "updateAction.jsp?bId=<%= bId %>" style = "width:100%;" method = "post" enctype ="multipart/form-data" onsubmit = "return CheckBoard();">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${result.rows}">
					<tr>
						<td colspan="3"><input type = "text" class="form-control" placeholder= "글 제목" name = "bTitle" maxlength = "50" value = "${row.bTitle}"></td>
					</tr>
					<tr>
						<!-- 엔터 키 처리하는 함수 : fn:replace -->
						<td colspan="3"><textarea class="form-control" placeholder="글 내용" name = "bContent" maxlength="2048" style="height:350px;">${fn:replace(row.bContent, newLineChar, "<br/>")}</textarea></td>
					</tr>
					<tr>
					</tr>
					<tr>
					 <td colspan="3"><input type="file" name="Image" class="form-control"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input type="submit" class="btn btn-primary" style = "padding-right:3px:" value="수정">
				<a href="list.jsp" class="btn btn-primary">목록</a>
			</div>
			</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>