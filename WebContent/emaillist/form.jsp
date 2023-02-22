<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 리스트 가입</title>
</head>
<body>
	<h1>메일 리스트 가입</h1>
	<p>메일 리스트에 가입하려면,<br /> 아래 항목을 기입하고 등록해주세요.</p>
	<form action="insert.jsp" method="post" name="email">
		<table>
			<tr>
				<th>
					<label for="last_name">Last name (성)</label>
				</th>
				<td>
					<input type="text" name="last_name" id="last_name" />
				</td>
			</tr>
			<tr>
				<th>
					<label for="first_name">First name (이름)</label>
				</th>
				<td>
					<input type="text" name="first_name" id="first_name" />
				</td>
			</tr>
			<tr>
				<th>
					<label for="email">Email address</label>
				</th>
				<td>
					<input type="text" name="email" id="first_name" />
				</td>
			</tr>
		</table>
		<button type="sudmit" >등록</button>
	</form>
	<a href="">리스트 바로가기</a>
</body>
</html>