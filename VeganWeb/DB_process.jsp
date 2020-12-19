<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="board.boardDAO" %>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>
<%@ page import="java.io.*" %>
<%@ include file="DB_connect.jsp" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
  </head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("inputid");
		String passwd = request.getParameter("inputPassword");
		String save_user = request.getParameter("save_user"); // 로그인 시 로그인 정보 저장하기를 눌렀는지 확인하는 변수
		
		PrintWriter script = response.getWriter();
		
		boardDAO dao = new boardDAO();
		int result = dao.login(id, passwd); // 1이면 로그인 성공, 0이면 비밀번호 틀림, -1이면 아이디 존재하지 않음
		if(save_user != null && result == 1){ // 로그인 시 쿠키를 저장할 경우
			Cookie id_cookie = new Cookie("id",URLEncoder.encode(id, "UTF-8"));
			Cookie passwd_cookie = new Cookie("pw", URLEncoder.encode(passwd, "UTF-8"));
			response.addCookie(id_cookie);
			response.addCookie(passwd_cookie);
			id_cookie.setMaxAge(12 * 60 * 60); // 쿠키의 유효 기간을 12시간으로 설정
			passwd_cookie.setMaxAge(12 * 60 * 60);
			session.setAttribute("sessionId", id); // 아이디 세션 설정
			response.sendRedirect("main.jsp"); // 메인 페이지로 이동
		}else if(save_user == null && result == 1){ // 로그인 시 쿠키를 저장하지 않는 경우
			session.setAttribute("sessionId", id); // 아이디 세션 설정
			response.sendRedirect("main.jsp"); // 메인 페이지로 이동
		}else if(result == 0){
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("location.href='loginForm.jsp'");
			script.println("</script>");
		}else if(result == -1){
			script.println("<script>");
			script.println("alert('해당 유저에 대한 정보가 존재하지 않습니다. 회원으로 가입하세요!')");
			script.println("location.href='loginForm.jsp'");
			script.println("</script>");
		}
	%>
		
</body>
</html>