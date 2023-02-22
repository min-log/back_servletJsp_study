<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="email.EmailVo" %> 
<%@ page import="email.EmaillistDao" %> 

<%	
	EmailVo vo = new EmailVo();
	EmaillistDao Dao = new EmaillistDao();
	
	vo.setEmail(request.getParameter("email"));
	vo.setFirst_name(request.getParameter("first_name"));
	vo.setLast_name(request.getParameter("last_name"));
	int count = -1;
	count = Dao.insert(vo);
	request.setAttribute("count", count);
	
%>
<c:choose>
	<c:when test="${count > -1}">
		<script>
			alert("가입 성공");
			document.location.href="list.jsp";
			
			
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("가입 실패");
			document.location.href="form.jsp";
		</script>
	</c:otherwise>
</c:choose>
 

