<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>메인화면입니다.</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>
<h1>
	Hello world!  asdasasd
</h1>
<h3>${member_id}</h3>
</div>
<div class="form-group">

	<c:set var="memberVO" value="${requestScope.memberVO}"/>
	<form>
		<label>아이디</label>
		<input type="text" class="login_input input" name="member_id" id="member_id" value="${memberVO.member_id}" readonly>

		<label>패스워드</label>
		<input type="password" class="login_input input" id="password" name="password"
			   value="${memberDto.password}">
		<div class="tdpw"></div>

		<label>이름</label>
		<input type="text" class="login_input input" id="name" name="name" value="${memberDto.name}">
		<div class="tdname"></div>

		<label>주소</label>
		<input type="text" id="address" name="address" class="login_input input" value="${memberDto.address}">
		<input type="button" class="button search-btn" onclick="sample6_execDaumPostcode()" value="검색">


		<label>생년월일</label>
		<input placeholder="&nbsp;8자리를 입력하세요 예)19990101" type="text" class="login_input input" id="birth"
			   name="birth" value="${memberDto.birth}">
		<div class="tdbirth"></div>

		<div class="edit-btn">
			<button type="submit" class="button" id="btn1" class="submit_btn">정보수정
			</button>
			<button type="button" class="button" id="cancel" style="border: none;"
					onclick="location.href='Unregister.member?id=${memberDto.id}'">회원탈퇴
			</button>
		</div>
	</form>
</body>
</html>
