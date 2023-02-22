<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form update</title>
</head>
<body>
	<form method="get" action="insert.jsp">
		<input type="text" name="id" />
		<input type="password" name="pw" />
		<input type="submit" />
		<a href="./insert.jsp?id=apple&pw=1234"> 상세페이지</a>
	</form>
</body>
</html>