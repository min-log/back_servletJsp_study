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
	String user = "webdb";
	String pass = "1234";
	
	String sql = "select author_id, author_name, author_desc from author order by 1";
%>
<script type="text/javascript">
function remove(){
	document.insertForm2.action = "removeAuthorTable.jsp";
	document.insertForm2.sudmit();

}

function update(){
	if(document.insertForm2.author_id == null){retrun}
	document.insertForm2.action = "updateAuthorTable.jsp";
	document.insertForm2.sudmit();
	
	

}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="author.css" rel="stylesheet" type="text/css"/>

<title>저자 정보 보기</title>
</head>
<body>
<div class="author_wrap">	
	<div class="author_top" >
	  <form name="insertForm" method="post" action="insertAuthorTable.jsp">
	    저자명 : <input type="text" name="author_name"  />
	    저자 설명 : <input type="text" name="author_desc" />
	    &nbsp;<input type="submit"/>
	  </form> 
	</div>
	<br>
	<form name="insertForm2" method="post" >
		<table  class="author_list">
			<tr>
				<th>선택</th>
				<!-- <th>저자번호</th> -->
				<th>저자</th>
				<th>설명</th>
			</tr>
			<%
			try{
				//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDirverz");  //MS-sql
				//Class.forName("org.gjt.mm.msql.Driver");  //mySql
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pass);
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
	        		out.print("<tr>\n");
	        			out.print("<td> <input type='radio' name='author_id'  value='"+ rs.getInt("author_id") +"' /> </td>\n");
						//out.print("<td>"+rs.getInt("author_id")+"</td>\n");
						out.print("<td>"+rs.getString("author_name")+"</td>\n");
						out.print("<td>"+rs.getString("author_desc")+"</td>\n");
					out.print("</tr>\n");
	      }
				//System.out.print("12344567898765fghfds");
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
		</table>
		</br>
		<button onclick="remove()" >삭제</button>
		<button onclick="update()" >수정</button>
	</form>
	
 </div>
</body>
</html>







