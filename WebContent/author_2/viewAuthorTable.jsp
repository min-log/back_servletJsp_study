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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>저자 정보 보기</title>
<style type="text/css" media="screen">
*           { margin:0; padding:0 }
body        { font-family: '맑은 고딕' 돋움; font-size:0.75em; color:#333 }

.tbl-ex     { margin:10px auto; border:1px solid #333; border-collapse:collapse; border-left-width:0; border-right-width:0 }

.tbl-ex th, 
.tbl-ex td  { border:1px solid #333; padding:8px; border-left-width:1; border-right-width:1  } 

.tbl-ex th  { background-color:#999; font-size:1.1em; color:#fff; border-top-width:2px; border-bottom-width:2px }
.tbl-ex td  { border-style:solid }
.tbl-ex tr.even     { background-color:#E8ECF6  }

.tbl-ex tr:hover,
.tbl-ex tr.even:hover   { background-color:#fc6; cursor:pointer }

</style>
<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous">
</script>
</head>
<body>
  <table width="500" class=tbl-ex>
    <tr><td>
    <form name="insertForm" method="post" action="insertAuthorTable.jsp">
      <input type="hidden" name="author_id" />
      저자명 : <input type="text" name="author_name" />
      설명 : <input type="text" name="author_desc" />
      &nbsp;<input type="submit" value="저장"/>
      &nbsp;<input type="button" id="new" value="신규"/>
    </form>
    </td></tr>
  </table>
  <br>
  <hr>
	<table width="500" class=tbl-ex>
		<thead>
    <tr>
			<th>저자번호</th>
			<th>저자</th>
			<th>설명</th>
		</tr>
    </thead>
    <tbody>
		<%
		try{
			//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDirverz");  //MS-sql
			//Class.forName("org.gjt.mm.msql.Driver");  //mySql
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
      
			while(rs.next()) {
			  count++;
		    int authorId = rs.getInt("author_id");
		    String authorName = rs.getString("author_name");
		    String authorDesc = rs.getString("author_desc");
		    System.out.println(authorId + "\t" + authorName + "\t" + authorDesc + "\t");
		    if(count%2 == 0){
		      out.println("<tr class='even'>");
		    }else{
		      out.println("<tr class='odd'>");
		    }
		    
        out.print("  <td>" + authorId + " ");
        out.println("<a href='deleteAuthorTable.jsp?author_id=" +authorId+ "'>(삭제)</a></td>");
        
        out.println("  <td>"+ authorName +"</td>");
        out.println("  <td>"+ authorDesc +"</td>");
		    out.println("</tr>");
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
  </tbody>
	</table>
  
</body>
<script type="text/javascript">
$(function(){
  $('.tbl-ex tbody').on('click', 'tr td:not(:first-child)', function () {
    //console.log('1');
    var str = ""
    var tdArr = new Array();   
    var tr = $(this).parent();
    var td = tr.children();
    // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
    //console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
    // tr의 모든 td 값접근해서 tdArr 배열에 넣기
    tdArr.push(td.eq(0).text());
    tdArr.push(td.eq(1).text());
    tdArr.push(td.eq(2).text());
            
    //console.log("배열[0]에 담긴 값 : "+tdArr[0]);
    //console.log("배열[1]에 담긴 값 : "+tdArr[1]);
    //console.log("배열[2]에 담긴 값 : "+tdArr[2]);
    
    //console.log("배열[0]에 담긴 값 : "+tdArr[0].split(' ')[0]);
    
    $('input[name=author_id]').val(tdArr[0].split(' ')[0]);
    $('input[name=author_name]').val(tdArr[1]);
    $('input[name=author_desc]').val(tdArr[2]);
    $("form[name='insertForm'").attr("action", "updateAuthorTable.jsp");
  });
  
  $('#new').on('click', function () {
    //console.log('new button clicked');
    $('input[name=author_name]').val("");
    $('input[name=author_desc]').val("");
    $("form[name='insertForm'").attr("action", "insertAuthorTable.jsp");
  });
});
</script>
</html>







