<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate(); // 세션 제거
	// 저장된 쿠키가 있는지 확인
	Cookie[] cookie = request.getCookies();
	Cookie id = null;
	Cookie pw = null;
	for(int i = 0; i < cookie.length; i++){
		if(cookie[i].getName().equals("id"))
			id = cookie[i]; // 아이디 쿠키가 존재하면 변수에 저장
		else if(cookie[i].getName().equals("pw"))
			pw = cookie[i]; // 비밀번호 쿠키가 존재하면 변수에 저장
	}
	
	if(id != null && pw != null){ // 두 쿠키가 모두 존재할 경우 쿠키를 유지할 것인지 물어본다.
%>
	<script>
		var con = confirm('다음 로그인 시 편리하게 로그인할 수 있도록 쿠키를 유지할까요?');
		if(con == true){
			alert('로그인 정보가 저장되었습니다.');
			location.href = "main.jsp"; // 다음 로그인 버튼을 누를 경우 로그인 페이지에 직접 정보를 입력하지 않고 자동으로 로그인된다.
		}else{ // 쿠키를 유지하지 않는다면 쿠키를 삭제하는 페이지로 이동한다.
			location.href = "cookie_delete.jsp";
		}
	</script>
<%
	}else{ // 저장된 쿠키가 없을 경우 즉시 로그아웃
		response.sendRedirect("main.jsp");
	}
%>


