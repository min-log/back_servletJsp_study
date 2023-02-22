<%@page import="guestbook.GuestBookDaoImpl"%>
<%@page import="guestbook.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String password = request.getParameter("password");
	String no = request.getParameter("no");
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");

	GuestBookVo vo = new GuestBookVo();
	GuestBookDaoImpl Dao = new GuestBookDaoImpl();
	
	vo.setName(name);
	vo.setContent(content);
	vo.setPassword(password);
	vo.setNo(no);
	
	
	int count = Dao.update(vo);

	if(count > 0){
%>
	<script>
		alert("게시판 수정이 완료 되었습니다.");
		document.location.href="list.jsp";
	</script>
<%
	}else{

%>
	<script>
		alert("게시판 수정이 실패했습니다. \n다시 입력해주세요.");
		history.back();
		//document.location.href="list.jsp";
	</script>
<%
	}

%>