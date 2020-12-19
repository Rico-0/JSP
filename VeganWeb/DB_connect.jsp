<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
 
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
</head>
<body>
	<!-- 데이터베이스 연결 -->
	<sql:setDataSource var = "dataSource" url = "jdbc:mysql://도메인URI:포트번호/DB이름?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&mysqlEncoding=utf-8&allowPublicKeyRetrieval=true&useSSL=false"
		driver = "com.mysql.cj.jdbc.Driver" user = "아이디" password = "비밀번호" />
</body>
</html>


