<%@page import="guestbook.GuestBookDaoImpl"%>
<%@page import="guestbook.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	GuestBookVo vo = new GuestBookVo(name ,password,content);
	GuestBookDaoImpl dao = new GuestBookDaoImpl();
	
	System.out.print("11");
	int count = dao.insert(vo);
	System.out.print("2");
	if(count > -1){
%>
	<script>
		alert("게시판 작성이 완료 되었습니다.");
		document.location.href="list.jsp";
	</script>
<%
	}else{

%>
	<script>
		alert("게시판 작성이 실패했습니다. /t 다시 입력해주세요.");
		document.location.href="list.jsp";
	</script>
<%
	}

%>