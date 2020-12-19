<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="DB_connect.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="restaurant.restaurantDAO" %>


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
		PrintWriter writer = response.getWriter();
		
		String userID = null;
		
		if (session.getAttribute("sessionId") != null) {
			userID = (String) session.getAttribute("sessionId");
		}else{
			writer.println("<script>");
			writer.println("alert('세션이 만료되었습니다. 다시 로그인하세요!')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}
		
		// '내 식당 목록에 저장하기' 버튼을 누를 때 보내준 url 값을 받아옴
		String url = request.getParameter("url");
		restaurantDAO dao = new restaurantDAO();
		
		// 식당을 추가한 결과를 반환
		int result = dao.addRestaurant(userID, url);
		if(result != -1){
			writer.println("<script>");
			writer.println("alert('정상적으로 등록되었습니다.')");
			writer.println("location.href='findRestaurant.jsp'");
			writer.println("</script>");
		}else{
			writer.println("<script>");
			writer.println("alert('오류가 발생했습니다.')");
			writer.println("location.href='findRestaurant.jsp'");
			writer.println("</script>");
		}
	%>
	
</body>
</html>