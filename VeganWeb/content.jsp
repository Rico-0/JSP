<%@page import="board.boardDAO"%>
<%@page import="board.BDto"%>
<%@page import="board.CommentDto" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.*" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="Navbar.jsp" %>  
<%@include file="DB_connect.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="./css/bootstrap.min.css">

<!-- 다음 스크립트를 넣어주지 않으면 'dropdown'이 작동하지 않는다. -->
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
<title>Vegan Life</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script type="text/javascript">
		// 빈칸이 입력되는 것을 방지하기 위한 자바스크립트 함수
		var comment = document.comment_form.comment.value;
	  function isinputComment(){
		if(comment == "" || comment == null){
			alert('댓글을 입력해 주세요.');
			return false;
		}
		return true;
	  }
	</script>
	<%
		String id = null;
		// 만약 세션이 유효할 경우 아이디를 얻어옴
		if (session.getAttribute("sessionId") != null)
			id = (String) session.getAttribute("sessionId"); 
		
		int bId = 0;
		// 글 번호가 유효할 경우 글 번호를 int형으로 변환해서 저장
		if (request.getParameter("bId") != null)
			bId = Integer.parseInt(request.getParameter("bId"));
		
		// 글 번호가 유효하지 않을 경우
		if (bId == 0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('유효하지 않은 글입니다.')");
			writer.println("location.href='list.jsp'");
			writer.println("</script>");
		}
		
		// 엔터 키 처리해 주는 코드
		pageContext.setAttribute("newLineChar", "\n");
		
	%>
	<!-- 특정 글 번호의 게시글을 가져옴 -->
	<c:set var = "id_board" value = "<%= bId %>"/>
	<sql:query dataSource = "${dataSource}" var = "result">
		SELECT * from board where bId = ?
		<sql:param value = '${id_board}' />
	</sql:query>
	
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- 위 query에서 반환된 결과를 출력 -->
					<c:forEach var="row" items="${result.rows}">
					<tr>
						<td style="width: 20%">글 제목</td>
						<td colspan="2" style="min-height: 200px; text-align: left"><c:out value = "${row.bTitle}"/></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2" style="min-height: 200px; text-align: left"><c:out value = "${row.bName}" /></td>
					</tr>
					<tr>
						<td>작성일</td>
						<fmt:formatNumber value = "1" type = "number" var = "numberType"></fmt:formatNumber>
						<td colspan="2" style="min-height: 200px; text-align: left"><c:out value = "${row.bDate}"/><c:if test = "${row.updated eq numberType}"><c:out value = " [수정됨]" /></c:if></td>
					</tr>
					<tr>
						<td>내용</td>
						<c:if test="${row.fileName ne null}">
						<td><img src ="./boardimages/${row.fileName}" align="top" style ="align: left; width: auto; height:auto"><BR CLEAR= ALL>
						<pre style = "font-family:맑은 고딕; font-size:16px;"><c:out value="${row.bContent}" /></pre><td>
						</c:if>
						<c:if test="${row.fileName eq null}">
						<td colspan = "2" style="min-height: 200px; text-align: left"><pre style = "font-family:맑은 고딕; font-size:16px;"><c:out value="${row.bContent}" /></pre></td> <!-- xss 방지 -->
						</c:if>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "button_board" style = "margin-bottom:15px">
			<a href="list.jsp" class="btn btn-primary">목록</a>&nbsp;
			<c:set var = "id" value = "<%= id %>"/>
			<c:set var = "bId" value = "<%= bId %>"/>
			<!-- 글 작성자와 현재 로그인한 사용자가 같은지 확인하기 위함 -->
			<sql:query dataSource = "${dataSource}" var = "name">
				SELECT * from board where bId = ?
				<sql:param value = '${bId}' />
			</sql:query>
			
			<!-- 글 작성자와 현재 로그인한 사용자가 같을 경우 수정, 삭제 버튼 나타나도록 함 -->
			<c:forEach var="row" items="${name.rows}">
				<c:if test="${row.bName eq id}">
				<a href="update.jsp?bId=<%= bId %>" class="btn btn-primary">수정</a>&nbsp;
				<a href="deleteAction.jsp?bId=<%= bId %>" class="btn btn-primary" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
				</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
		<!-- 댓글 View -->
		<div class="container">
		<div class="row">
			<!-- 로그인된 사용자에게만 댓글 작성 View가 나타나도록 함 -->
			<c:if test = "${id ne null}">
			<form name = "comment_form" action = "writeComment.jsp?bId=<%= bId %>&bCommentName=<%= id %>" method = "post" style = "border:1px solid #dddddd; width:100%">
				<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd; background-color:white">
				<thead>
					<tr>
					<th colspan = "3">댓글 입력하기</th>
					</tr>
				</thead>
				<tbody>
				<tr>
  					<td style = "width: 20%"><%= id %></td>
  					<td style = "width: 70%"><textarea class="form-control mr-sm-2" style = "text-align:center; height:auto; width: 500px; margin-left:100px" name = "comment" placeholder = "댓글을 입력해주세요!"></textarea>&nbsp;</td>
  					<td style = "width: 10%"><button class="btn btn-secondary my-2 my-sm-0" style = "text-align:center" type="submit" name = "write_comment">등록</button></td>
  				</tr>
				</tbody>
				</table>
			</form>
			</c:if>
			<table class = "table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">등록된 댓글</th>
					</tr>
				</thead>
				<tbody>
					<%
						boardDAO dao = new boardDAO();
						// 현재 게시글에 등록된 모든 댓글을 가져옴
						ArrayList<CommentDto> list = dao.getCommentList(bId); 
						if(list.size() == 0){ // 만약 등록된 댓글이 없다면
					%>
					<tr style = "text-align:center">
						<td style = "position:relative; background-color:white; border:1px solid #eeeeee">이 게시글에 등록된 댓글이 없습니다.</td>
					</tr>
					<%
						}else{
							for(int i = 0; i < list.size(); i++){ // 등록되어 있는 댓글 모두 출력
					%>
					<tr style = "width: auto">
						<td style="width: 20%; text-align: center"><%= list.get(i).getbCommentName() %></td>
						<td style="width: 60%; min-height: 200px; text-align: center"><%= list.get(i).getbCommentContent() %></td>
						<td style="width: 20%; text-align: center"><%= list.get(i).getbDate() %></td>
						<c:set var = "comment_id" value = "<%= list.get(i).getbCommentName() %>"></c:set>
						<% if(list.get(i).getbCommentName().equals(id)){ // 댓글 작성자와 현재 로그인한 사용자가 동일할 경우 삭제 버튼 활성화 %>
						<td style = "text-align: left" class="btn btn-primary" onClick="location.href='deleteComment.jsp?bId=<%= list.get(i).getbId() %>&bCommentId=<%= list.get(i).getbCommentId() %>'">삭제</td>
						<% } %>
					</tr>
					<%
							}
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>