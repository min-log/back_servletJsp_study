<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%! //변수 선언
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "webDB";
	String pass = "1234";
	String sql = "UPDATE author SET author_name = ?, author_desc = ? WHERE author_id = ?";
%>

<%
	try{
		request.setCharacterEncoding("utf-8");
		int count = -1;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("author_name"));
		pstmt.setString(2, request.getParameter("author_desc"));
		pstmt.setString(3, request.getParameter("author_id"));
		
		count = pstmt.executeUpdate();
		
		if(count > -1 ){
%>
	<script>
		alert("수정이 성공하였습니다.");
		document.location.href = "viewAuthorTable.jsp";
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

	String mas= "수정이 완료되었습니다.";
	String url= "viewAuthorTable.jsp";
	
	

%>