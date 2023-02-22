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
	
	String sql = "INSERT INTO AUTHOR VALUES (author_SEQUENCE.nextval, ?, ? )";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>저자 정보 저장</title>
</head>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt = conn.prepareStatement(sql);
	
	request.setCharacterEncoding("utf-8");
	pstmt.setString(1, request.getParameter("author_name"));
	pstmt.setString(2, request.getParameter("author_desc"));
  
	int count = pstmt.executeUpdate();
	
  String msg = "데이터 저장 실패";
  String url = "insertAuthorTable.html";
	if(count==1){
    msg = "데이터 저장 성공";
    url = "viewAuthorTable.jsp";
 %>
	  <script>
	   alert("<%=msg%>");
	   location.href="<%=url%>";
	  </script>
 <% 
  }else{
 %>
    <script>
     alert("<%=msg%>");
     location.href="<%=url%>";
    </script>
<% 
  }
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
</head>
<body>
</body>
</html>







