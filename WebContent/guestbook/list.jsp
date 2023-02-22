<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.GuestBookDaoImpl"%>
<%@page import="guestbook.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	GuestBookVo vo = new GuestBookVo();
	GuestBookDaoImpl dao = new GuestBookDaoImpl();
	ArrayList<GuestBookVo> list = new ArrayList<GuestBookVo>();
	
	list = dao.getlist();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="guest.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function listAdd(){
	//document.listadd.action="add.jsp";
	document.listadd.submit();
	
}

function showPw(a){
	let el  = "list_"+ a;
	let elem = document.getElementById(el); 
	elem.classList.add("on"); //비밀번호 영역 
}

function colse(a){
	let el  = "list_"+ a;
	let elem = document.getElementById(el); 
	elem.classList.remove("on"); //비밀번호 영역 
	
}

function listDelete(){
	document.listShow.action="delete.jsp";
	document.listShow.submit();
	
}

</script>
</head>
<body>
	<div class="wrap">
		<h2>게시판 글쓰기</h2>
		<form method="post" action="add.jsp" name="listadd">
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
							<input type="text" name="name" id="name">
						</td>
						<th>
							<label for="password">비밀번호</label>
						</th>
						<td>
							<input type="password" name="password" id="password">
						</td>	
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<textarea rows="" cols="" name="content"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<a href="javascript:void(0)" onclick="listAdd()"  class="btn">확인</a>
			</div>
		</form>
		<div class="list_wrap">
			<h2>게시판 리스트</h2>
		<form method="post" name="listShow">
			<table class="list">
				<colgroup>
					<col style="width:20%">
					<col style="">
					<col style="width:120px">
					<col style="width:110px">
				</colgroup>
				<thead>
					<tr>
						<th>
							제목
						</th>
						<th>
							내용
						</th>
						<th>
							날짜
						</th>
						<th>
							선택
						</th>
					</tr>
				</thead>
				<tbody>
	<% 
		for(GuestBookVo item : list){ 
	%>			<tr id="list_<%= item.getNo() %>">
						<td>
							<p class="con_tit">
							<%= item.getName() %>
							</p>
						</td>
						<td>
							<a class="con_tx" href="updateForm.jsp?no=<%= item.getNo() %>&dl=n">
								<%= item.getContent()%>
							</a>
						</td>
						<td>
							<%= item.getReq_date() %>
						</td>
						<td>
							<a class="btn" href="javascript:void(0)" onclick="showPw(<%= item.getNo() %>)" >삭제</a>
							<a class="btn" href="updateForm.jsp?no=<%= item.getNo()%>&dl=y">수정</a>
									<div id="pw_ck">
										<div class="top"> 비밀번호 확인 <a href="javascript:colse(<%= item.getNo() %>)" class="btn_close">X</a></div>
										<div class="con">
										<p style="text-align:center;">작성한 글을 삭제 하시려면 비밀번호를 입력해주세요.</p><br/>
										비밀번호 : 
											<input type="password" name="passwordck" id="passwordck">
											<a href="javascript:void(0)" onclick="listDelete()"  class="btn btn_pw">확인</a>
										</div>
									</div>
						</td>
					</tr>
	<% 
		}
	%>	
		</tbody>
		</table>
		</form>
		
		
		</div>
	</div>
		
</body>
</html>