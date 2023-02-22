<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.GuestBookDaoImpl"%>
<%@page import="guestbook.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String dl = request.getParameter("dl"); // 보여주는건지 체크
	System.out.print("테스트 : "+dl);
	
	String no = request.getParameter("no");
	GuestBookVo vo = new GuestBookVo();
	GuestBookDaoImpl Dao = new GuestBookDaoImpl();
	vo.setNo(no);
	
	
	ArrayList<GuestBookVo> list = new ArrayList<GuestBookVo>();
	
	list = Dao.search(vo);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="guest.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="wrap">
<script type="text/javascript">
	function update(){
		document.update.action =update.jsp;
		document.update.submit();
		
	}
</script>
	<h2>
		<%	if(dl.equals("n")){ %>
			게시물 상세페이지
		
		<%}else{ %>
			게시물 수정
		<%	} %>
	</h2>
<form  method="post" name="update" action="update.jsp">
<% 
	for(GuestBookVo item : list){
%>
	<table class="questbook_top">
		<colgroup>
			<col style="width:60px">
			<col style="width:calc(100% - 25px)">
			<col style="width:60px">
			<col style="width:110px">
		</colgroup>
		<thead>
			<tr>
				<th>
					<label for="name">제목</label>
				</th>
				<td>
				<%	if(dl.equals("n")){ %>
					<%= item.getName()%>
				<% 
					}else{
				%>
					<input name="name" value="<%= item.getName()%>">
				<% 
					}
				%>
				
				</td>
				<th>
					날짜
				</th>
				<td>
					<%= item.getReq_date()%>
				</td>
			</tr>
		</thead>
		<tbody>				
			<tr>
				<td colspan="4">
					<%	if(dl.equals("n")){ %>
						<div class="contentbox">
							<%= item.getContent()%>
						</div>
					<% }else{ %>
						<textarea name="content" class="read"><%= item.getContent()%></textarea>
					<% } %>
					
				</td>
			</tr>
		</tbody>
	</table>
	
		<a class="btn" href="javascript:history.back()"> < 뒤로가기 </a>
		<%	if(dl.equals("n")){ %>
			<a class="btn " href="updateForm.jsp?no=<%= no %>&amp;dl=y"> 수정 </a>
		<% }else{ %>
			<input type="hidden" name="no" value="<%= no %>" />
			<div class="" style="float:right;">
				비밀번호 : 
				<input type="password" name="password" id="password" />
				<button class="btn" type="submit"> 확인 </button>
			</div>
		<% } %>
		<br />
		
<% 
	}
%>
</div>
</form>
</body>
</html>