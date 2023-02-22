<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="email.EmaillistDao"%>
<%@ page import="email.EmaillistVo"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	EmaillistVo vo = new EmaillistVo();
  vo.setNo(Integer.parseInt(no));
  
	//out.println(no);
	
  EmaillistDao dao = new EmaillistDao();
  if(dao.delete(vo)){
    response.sendRedirect("list.jsp");  
  }else{
%>
<script type="text/javascript">
  alert("데이터 삭제 실패");
  history.go(-1);
</script>

<%    
  }
%>
