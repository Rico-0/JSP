<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
 
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
</head>
<body>
	<!-- 데이터베이스 연결 -->
	<sql:setDataSource var = "dataSource" url = "jdbc:mysql://veganweb.cdnugemn7oam.ap-northeast-2.rds.amazonaws.com:3306/veganweb_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&mysqlEncoding=utf-8&allowPublicKeyRetrieval=true&useSSL=false"
		driver = "com.mysql.cj.jdbc.Driver" user = "cky68081" password = "skfvkfl2004!" />
</body>
</html>


