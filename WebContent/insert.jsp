<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here </title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8"); // 인코딩 방식
		
		// 모든 받은 파라미터는 String 이다
		String id = request.getParameter("id"); // 파라미터 아이디 값을 가져와
		String pw = request.getParameter("pw"); 
		//out.println("<span>" + str +"</span>");
	%>
	<p><%= id %> </p>
	<p><%= pw %> </p>
	<a href="./form.jsp"> 다시 돌아가기</a>
</body>
</html>