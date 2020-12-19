<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="DB_connect.jsp"%>
<%@ include file="Navbar.jsp"%>
<%@ page import="java.io.PrintWriter"%>


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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
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
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9047093ed094e5c345601b8e3cac23&libraries=services"></script>
	<div class="jumbotron"
		style="background-image: url('./images/veganlife_main.png'); background-repeat: no-repeat; background-size: cover;">
		<div class="container">
			<h1 class="display-3" style="margin-right: 50px; text-align: center">비건 식당 찾기</h1>
		</div>
	</div>
	<div class = "container">
  	  <div class = "row">
  		<div id="map" style="width: 80%; height: 400px; align:center; margin-right:10px;"></div><br><br>
  		<form action = "findRestaurant_Action.jsp" class="form-inline my-2 my-lg-0" style = "width:80%">
  		<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd; background-color: #ffffff;">
  			<thead>
  				<tr>
  					<th colspan = "3" style = "background-color: #ffffff; text-align: center">검색하기 (Tip: 로그인 후 식당명을 입력하고 저장하기를 누르면, '내 비건 식당 목록' 에서 확인할 수 있습니다.)</th>
  				</tr>
  			</thead> 
  			<tbody>
  				<tr>
  					<td>지역명으로 검색</td>
  					<td colspan = "2"><input type = "text" class="form-control mr-sm-2" style = "text-align: left" id = "place" name = "place" placeholder = "예)연무동" aria-label="Search">&nbsp;<button class="btn btn-secondary my-2 my-sm-0" type="button" name = "search" onclick = "map_search();">검색하기</button></td>
  					
  				</tr>
  				<tr>
  					<td>식당명으로 검색</td>
  					<td colspan = "2"><input class="form-control mr-sm-2" type="text" name = "place_name" style = "text-align: left" placeholder = "예)샐러디 광교역점" aria-label="Search">&nbsp;<button class="btn btn-secondary my-2 my-sm-0" name = "search_button" type="submit">검색하기</button>&nbsp;
  					 <% 
					if (session.getAttribute("sessionId") != null) {
					  %>
      					<button class="btn btn-secondary my-2 my-sm-0" name = "save_button" type="submit">내 식당 목록에 저장하기</button>
      				 <% 
		             }
		             %>
  					</td>
  				 </tr>
  			 </tbody>
  		  </table>
  		</form>
  		 <script>
    	var search_place = document.getElementById('place'); // 지역명으로 검색 란에 입력한 텍스트를 얻어옴
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		var container = document.getElementById('map'),
		options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		// 카카오맵을 생성
		var map = new kakao.maps.Map(container, options);
		
	function map_search(){	
		// 장소 검색 객체를 생성
		var ps = new kakao.maps.services.Places(); 
		// 키워드로 장소를 검색
		if(search_place.value == null || search_place.value == ""){
			alert('검색할 지역명을 입력해 주세요.');
			return false;
		}
		// 지역명만 입력하면 자동으로 검색되도록 비건식당 문자열을 추가
		ps.keywordSearch(search_place.value + ' 비건식당', placesSearchCB); 
		
		
		// 키워드 검색 완료 시 호출되는 콜백 함수
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해
		        // LatLngBounds 객체에 좌표를 추가
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정
		        map.setBounds(bounds);
		    } else{
		    	alert('검색 결과가 없습니다.');
		    }
		}

		// 지도에 마커를 표시하는 함수
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
	}
	</script>
  	</div>
  </div>
</body>
</html>