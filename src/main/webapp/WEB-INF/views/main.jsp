<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>메인화면입니다.</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script>
		if ('${k_userInfo}') {

			$("#k_email").text("이메일 : " + '${kemail}');
			$("#k_nickname").text("이름 : " + '${kname}');

			$("#k_image").children("img").attr("src", imageURL);
		}
	</script>
</head>
<body>
<h1>
	Hello world!  asdasasd
</h1>
<h3>${member_id}</h3>
</div>
<div class="form-group">
	<h6>카카오톡 로그인 성공 화면</h6>
	<hr />
	<h3>${kemail}</h3>
	<h3>${kname}</h3>
	<h3>${member_id}</h3>


	<div id="k_email" style="text-align:center"></div>
	<div id="k_nickname" style="text-align:center"></div>



	<form>
		<label>아이디</label>
		<input type="text" class="login_input input" name="member_id" id="member_id" value="${member_id}" readonly>

		<label>패스워드</label>
		<input type="password" class="login_input input" id="password" name="password"
			   value="${memberDto.password}">
		<div class="tdpw"></div>

		<label>닉네임</label>
		<input type="text" class="login_input input" id="name" name="name" value="${memberDto.name}">
		<div class="tdname"></div>




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
