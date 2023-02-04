<%@ page contentType="text/html; charset=UTF-8" %>
<%
      String strTitle = "JSP Home";
	  String cPath = request.getContextPath();
	  System.out.print(cPath);
%>
<html>
<head>
<title><%=strTitle%></title>
</head>
<frameset frameborder="0" framespacing="0" border="5" rows="130,*" >
	<frame  frameborder="1" scrolling="NO" noresize name="head" src="head.jsp">
  <frameset name="body" frameborder="5" framespacing="0" border="0" rows="*,20"> <!-- 240,* -->		
    <frameset name="main" frameborder="5" framespacing="0" border="0" cols="240,*"> <!-- *,0,37,12 -->
			<frame name="left" marginwidth="0" marginheight="0" frameborder="5" scrolling="NO" resize="NO" src="left.jsp">
			<frame name="content" src="main.jsp" scrolling="YES" marginwidth="0" marginheight="0" frameborder="5" noresize>
    </frameset>
		<frame name="copy" src="copy.jsp" scrolling="NO" marginwidth="0" marginheight="0" frameborder="0" noresize>        
	</frameset>
</frameset>
</html>