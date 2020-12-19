<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="DB_connect.jsp" %>
<%@ include file="Navbar.jsp"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.boardDAO" %>
<%@ page import="board.BDto" %>
<%@ page import="java.util.ArrayList" %>
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
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico" type="image/x-icon">
<body>
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String userID = null;
	
	if (session.getAttribute("sessionId") != null) {
		userID = (String) session.getAttribute("sessionId");
	} 
	%>
	<div class="jumbotron"
		style="background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<h1 class="display-3" style="text-align:center">레시피 공유 게시판</h1>
			<h3 style = "text-align:center">자신만의 비건 레시피를 자유롭게 공유해 보세요!</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead> 
				<tbody>
					<%
						boardDAO dao = new boardDAO();
						ArrayList<BDto> v = dao.list(); // 게시판에 등록된 모든 게시글을 가져옴

						if(v.size() == 0){ // 만약 게시글이 없다면
					%>
						<tr style = "text-align:center">
						<td colspan = "4" style = "position:relative; background-color:white; border:1px solid #eeeeee">등록된 게시글이 없습니다.</td>
						</tr>
					<% 
						} else {
							for (int i = 0; i < v.size(); i++) { // 등록된 게시판의 글 정보를 출력
					%>
					<tr>
						<td><a href="content.jsp?bId=<%= v.get(i).getbId()%>"><%=v.get(i).getbTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= v.get(i).getbName() %> </td>
						<td><%= v.get(i).getbDate().substring(0, 11) + v.get(i).getbDate().substring(11, 13) + "시 " + v.get(i).getbDate().substring(14, 16) + "분 " %></td>
					</tr>
					<%
					}
					%>
					<%
					}
					%>
				</tbody>
			</table>
				<% 
					if (session.getAttribute("sessionId") != null){ // 로그인한 사람만 글쓰기가 허용됨
				%>
					<a href="write.jsp" class="btn btn-primary" id = "write_post">글쓰기</a>
				<%
					}
				%>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="./js/bootstrap.js"></script>
</body>
</html>