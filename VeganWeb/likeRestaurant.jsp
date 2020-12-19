<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter"%>
<%@include file="Navbar.jsp" %>  
<%@include file="DB_connect.jsp" %> 
<%@page import="restaurant.restaurantDTO" %>
<%@page import="restaurant.restaurantDAO" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="./css/bootstrap.min.css">

<title>Vegan Life</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	
	<%
		String id = null;
		if (session.getAttribute("sessionId") != null)
			id = (String) session.getAttribute("sessionId");	
		else{
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원만 이용할 수 있는 페이지입니다.')");
			writer.println("location.href='loginForm.jsp'");
			writer.println("</script>");
		}
	%>
	
	<div class="jumbotron"
		style="background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<h1 class="display-3" style="margin-right: 50px; text-align:center">내 비건 식당 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">목록 보기 (tip:식당 이름을 클릭하면 자세한 정보를 볼 수 있습니다.)</th>
					</tr>
				</thead>
				<tbody>
					<%
						restaurantDAO dao = new restaurantDAO();
						ArrayList<restaurantDTO> list = dao.list(id); // 회원 아이디로 등록된 모든 비건 식당을 가져옴
						if(list.size() == 0){ // 만약 등록된 식당이 없다면
					%>
						<tr style = "text-align:center">
						<td style = "position:relative; background-color:white; border:1px solid #eeeeee">아직 내가 등록한 식당이 없습니다. 식당을 등록해 주세요!</td>
						</tr>
					<%
						}else{
							for(int i = 0; i < list.size(); i++){ // 등록된 식당을 화면에 뿌려줌
					%>
					<tr>
						<td style="width: 20%">식당 이름</td>
						<td colspan = "2" style="min-height: 200px; text-align: center" onClick = "location.href='<%= list.get(i).getUrl() %>'" onMouseOver = "window.status = '<%= list.get(i).getUrl() %>'" onMouseOut = " window.status = '' "><%= list.get(i).getUrl().substring(34) %></td>
						<td class="btn btn-primary" onClick="location.href='deleteRestaurant.jsp?url=<%= list.get(i).getUrl() %>'">삭제</td>
					</tr>
					<%
							}
						}		
					%>
				</tbody>
			</table>
			<a href="findRestaurant.jsp" class="btn btn-primary">더 많은 식당 찾으러 가기</a>&nbsp;
		</div>
	</div>
</body>
</html>