<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	response.setCharacterEncoding("UTF-8");
%>
<%@ page import="email.EmailVo" %> 
<%@ page import="email.EmaillistDao" %> 
<%
	EmailVo vo = new EmailVo();
	EmaillistDao Dao = new EmaillistDao();
	
	ArrayList<EmailVo> list = Dao.getlist(); 
	int listSize = list.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 리스트</title>
<link href="email.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	
	<h1>메일리스트에 가입되었습니다.</h1>
	<table class="email_list">
	<%
	for(int i = 0;i< list.size() ;i++){
		request.setAttribute("listVo", list.get(i));
	%>
		<tr>
			<th>
				First name
			</th>
			<td>
				${listVo.getFirst_name()}
			</td>
			<th>
				Last name
			</th>
			<td>
				${listVo.getLast_name()}
			</td>
			<th>
				Email
			</th>
			<td>
				${listVo.getEmail()}
			</td>
		</tr>		
	<%	
	}//for
	%>
	</table>


	
	

	
</body>
</html>