<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file = "DB_connect.jsp" %>
<%@page import="java.io.PrintWriter"%>
<%@taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
  </head>
<body>
	<%
		String userId = (String) session.getAttribute("sessionId"); // 원래 아이디

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
	
		// 입력한 아이디와 비밀번호를 가져옴
		String id = request.getParameter("id");
		String passwd = request.getParameter("pw");
		
		if(userId == null){
			writer.println("<script>");
			writer.println("alert('세션이 만료되었습니다. 다시 로그인하세요!')");
			writer.println("location.href='main.jsp'");
			writer.println("</script>");
		}
	%>
	<c:set var = "user_id" value = '<%= userId %>' />
		<sql:query dataSource="${dataSource}" var="result">
   		SELECT * FROM vegan_user WHERE id = ? 
    	<sql:param value="${user_id}"/>
	</sql:query>
	
	<!-- 현재 로그인한 사용자와 가져온 사용자의 아이디가 일치하지 않을 경우 -->
	<c:forEach var="row" items="${result.rows}">
		<c:if test="${row.id != user_id}">
		<%
		writer.println("<script>");
		writer.println("alert('권한이 없습니다.')");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
		%>
		</c:if>
	</c:forEach>
	
	<!-- 유저 정보를 수정하는 쿼리 수행 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
		UPDATE vegan_user SET passwd = ? WHERE id = ?
		<sql:param value = "<%= passwd %>" />
		<sql:param value = "<%= userId %>" />
	</sql:update>
	
	<% 
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정이 완료되었습니다.')");
	script.println("location.href='main.jsp'");
	script.println("</script>");
	%>

</body>
</html>