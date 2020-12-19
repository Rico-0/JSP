<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.net.URLEncoder, java.net.URLDecoder" %>
<%@ include file = "DB_connect.jsp" %>
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
<title>식당 찾기 - Vegan Life</title>
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico"
	type="image/x-icon">
</head>
<body>
	 <%
		request.setCharacterEncoding("UTF-8");
		String id = null;
		if (session.getAttribute("sessionId") != null)
			id = (String) session.getAttribute("sessionId");	
		
	 	String search_button = request.getParameter("search_button"); // 식당명으로 검색하는 버튼
		String save_button = request.getParameter("save_button"); // 식당 저장하는 버튼
		
		// 양 옆 공백을 제거하여 인코딩 후 디코딩함으로 식당 이름을 얻어옴
		String place_name_enc = URLEncoder.encode(request.getParameter("place_name").trim(), "UTF-8");
		String place_name_dec = URLDecoder.decode(request.getParameter("place_name").trim(), "UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		if(search_button != null){ // 검색하는 버튼을 눌렀을 경우
	 		if(place_name_dec == null || place_name_dec.equals("")){ // 아무 텍스트도 입력하지 않았을 경우
	 			writer.println("<script>");
				writer.println("alert('검색할 장소를 입력해 주세요.')");
				writer.println("history.back()");
				writer.println("</script>");
	 		}else{
	 			response.sendRedirect("https://map.kakao.com/link/search/" + place_name_enc); // 디코딩된 문자를 넣으면 보안상 문제 때문인지 값이 안 들어감
	 		}
	 	}else if(save_button != null){ // 저장하기 버튼을 눌렀을 경우
	 		if(session.getAttribute("sessionId") == null){ // 세션이 만료되었을 경우
	 			writer.println("<script>");
	 			writer.println("alert('식당을 저장하려면 로그인해야 합니다.')");
	 			writer.println("location.href='loginForm.jsp'");
	 			writer.println("</script>");
	 		}
	 		if(place_name_dec == null || place_name_dec.equals("")){ // 아무 텍스트도 입력하지 않았을 경우
	 			writer.println("<script>");
				writer.println("alert('아무 값도 입력되지 않았습니다. 식당 이름을 입력해 주세요.')");
				writer.println("location.href='findRestaurant.jsp'");
				writer.println("</script>");
	 		}
	 		// 카카오맵 검색 url의 queryString으로 입력한 장소명을 저장
			String url = "https://map.kakao.com/link/search/" + place_name_dec;	
			restaurantDAO dao = new restaurantDAO();
			if(dao.existRestaurant(id, url) == 1){ // 이미 존재하는 레스토랑일 경우
				writer.println("<script>");
				writer.println("alert('이미 등록한 식당입니다.')");
				writer.println("history.back()");
				writer.println("</script>");
			}else{
		%>
		<!-- 등록할 것인지 여부를 판단하는 자바스크립트 코드 -->
		<script type = "text/javascript">
			var con = confirm("이 식당을 등록하시겠습니까?");
			var url = "<%= url %>"
			var place_name = "<%= place_name_dec %>"
			if(con == true){
				location.href = "addRestaurant_Action.jsp?url=" + url;  // 식당 등록을 처리하는 페이지에 url 값을 넘겨줌
			}else{
				location.href = "findRestaurant.jsp";
			}
		</script>
		<% 
	 		}
	 	}
		%>
</body>
</html>