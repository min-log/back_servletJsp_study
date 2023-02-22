<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! //변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "webDB";
	String pass = "1234";
	
	String sql = "SELECT author_id, author_name, author_desc FROM author WHERE author_id = ?";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>저자 삭제</title>
<link href="author.css" rel="stylesheet" type="text/css"/>
</head>
</head>
<body>
<div class="author_wrap">
	<div class="author_top">
	  <form name="insertForm" method="post" action="updateAuthorTable01.jsp">
<%

try{
	
	if(request.getParameter("author_id") == null){
	%>
	<script>
		alert("수정값없음");
		document.location.href="viewAuthorTable.jsp";
	</script>
	<% 					
	}
	
	//
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	ResultSet re = null; 
	pstmt = conn.prepareStatement(sql);
	
	request.setCharacterEncoding("utf-8");
	pstmt.setString(1, request.getParameter("author_id"));
  
	rs = pstmt.executeQuery();
	
	
	while(rs.next()){
		out.print("번호 : <input type='text' name='author_id' value='" + rs.getString("author_id") + "' readonly='readonly'/>  \n");
		out.print("<br />");
		out.print("저자명 : <input type='text' name='author_name' value='" + rs.getString("author_name") + "'/> \n");
		out.print("저자명 : <input type='text' name='author_desc' value='" + rs.getString("author_desc") + "'/> \n");
		out.print("<br />");
	}//while
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(rs != null) 	 rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
		<input type="submit"/>
	  </form> 
	</div>
</div>
</body>
</html>







