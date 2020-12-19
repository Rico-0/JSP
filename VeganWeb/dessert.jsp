<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="Navbar.jsp" %>
<%@ page import="recipe.RecipeDto"%>
<%@ page import="recipe.RecipeDAO_dessert"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>Vegan Life</title>
<link rel="shortcut icon" href="./resources/veganlife_favicon.ico" type="image/x-icon">
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
			<h1 class="display-3" style="margin-right: 50px; text-align:center">디저트 정보 상세보기</h1>
		</div>
	</div>
	<%
		String dessertId = request.getParameter("foodId");
		RecipeDAO_dessert dao = RecipeDAO_dessert.getInstance();
		RecipeDto dessert = dao.getDessertById(dessertId);
	%>
	<div class="container">
		<div class="row">
			<div class ="col-md-5">
				<img src="./images/<%=dessert.getFoodImage() %>" style="width: 100%"/>
			</div>
			<div class="col-md-6">
				<h3><%=dessert.getFoodName()%></h3>
				<p><span class="badge badge-danger">재료</span><br><%=dessert.getIngredients() %>
				<p><span class="badge badge-danger">레시피</span><br><%=dessert.getRecipe()%>
				<p><a href="./desserts.jsp" class="btn btn-secondary">디저트 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
</body>
</html>
