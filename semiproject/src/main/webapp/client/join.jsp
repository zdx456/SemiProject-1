<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>회원가입</h1>
<form action="join.kh" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="clientId" required
				placeholder="아이디"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="clientPw" required
				placeholder="비밀번호"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="clientNick" required
				placeholder="닉네임"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" name="clientBirth" required
				placeholder="생일"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="text" name="clientGender" required
				placeholder="남성/여성"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="clientEmail" required
				placeholder="이메일"></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="submit" value="회원가입">
		</tr>


	</table>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>


