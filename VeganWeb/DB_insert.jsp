<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.boardDAO"%>
<%@include file="DB_connect.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="dto" class="user.UserDto"/>
<jsp:setProperty name="dto" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Vegan Life</title>
<link rel="shortcut icon" href = "./resources/veganlife_favicon.ico" type = "image/x-icon">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = null;
		PrintWriter writer = response.getWriter();
		
		if (session.getAttribute("sessionId") != null)
			id = (String) session.getAttribute("sessionId");
		
		// 만약 세션이 유효하다면 main 페이지로 이동
		if (id != null) {
			writer.println("<script>");
			writer.println("location.href='main.jsp'");
			writer.println("</script>");
		}

		// 만약 아이디나 비밀번호가 입력되지 않았을 경우
		if (dto.getId() == null || dto.getPw() == null) {
			writer.println("<script>");
			writer.println("alert('입력이 안 된 항목이 있습니다.')");
			writer.println("history.back()");
			writer.println("</script>");
		} else {
			boardDAO dao = new boardDAO();
			int existId = dao.existId(dto.getId()); // 이미 존재하는 아이디인지 확인한다.
			
			if (existId == -1) {
				writer.println("<script>");
				writer.println("alert('오류가 발생했습니다.')");
				writer.println("history.back()");
				writer.println("</script>");
			}
			else if (existId == 1){
				writer.println("<script>");
				writer.println("alert('이미 존재하는 아이디입니다.')");
				writer.println("history.back()");
				writer.println("</script>");
			} 
				
	 %>
	
	<!-- 유저 테이블에 가입 시 입력한 아이디와 비밀번호 정보를 넣음 -->
	<sql:update dataSource = "${dataSource}" var = "resultSet">
		INSERT INTO vegan_user(id, passwd) VALUES (?,?)
		<sql:param value = "<%= dto.getId() %>" />
		<sql:param value = "<%= dto.getPw() %>" />
	</sql:update>
		
	<% 	
		// 가입한 아이디로 세션을 설정 후 메인 페이지로 이동
		session.setAttribute("sessionId", dto.getId());
		writer.println("<script>");
		writer.println("alert('회원가입에 성공하였습니다. 가입된 아이디로 로그인합니다.')");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
		}
	%>

</body>
</html>