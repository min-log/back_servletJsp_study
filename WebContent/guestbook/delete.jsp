<%@page import="guestbook.GuestBookDaoImpl"%>
<%@page import="guestbook.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String password = request.getParameter("passwordck");

	GuestBookVo vo = new GuestBookVo();
	GuestBookDaoImpl Dao = new GuestBookDaoImpl();
	vo.setPassword(password);
	int count = Dao.delete(vo);

	if(count > 0){
%>
	<script>
		alert("게시판 삭제가 완료 되었습니다.");
		document.location.href="list.jsp";
	</script>
<%
	}else{

%>
	<script>
		alert("게시판 삭제가 실패했습니다. \n다시 입력해주세요.");
		document.location.href="list.jsp";
	</script>
<%
	}

%>