<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="Navbar.jsp" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="recipe.RecipeDto" %>
<%@ page import="recipe.RecipeDAO_dessert" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/jumbotron/">

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
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico" type="image/x-icon">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

	<div class="jumbotron"
		style="background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<h1 class="display-3" style="margin-right: 50px; text-align:center">레시피 추천 : 디저트</h1>
		</div>
	</div>
	
	<%
		RecipeDAO_dessert dao = RecipeDAO_dessert.getInstance();
		ArrayList<RecipeDto> listOfDesserts = dao.getAllDesserts();
	%> 

	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfDesserts.size(); i++) {
					RecipeDto dessert = listOfDesserts.get(i);
			%>
			<div class="col-md-4">
				<img src ="./images/<%=dessert.getFoodImage()%>" style ="width: 100%">
				<h3 style = "margin-top:10px"><%=dessert.getFoodName()%></h3>
				<p><a href="./dessert.jsp?foodId=<%=dessert.getFoodId()%>" style = "margin-top:10px" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
	</div>

</body>
</html>