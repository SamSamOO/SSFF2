<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>메인화면입니다.</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/head.jsp"></jsp:include>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/header.jsp"></jsp:include>

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
</div>
<div class="form-group">
	<h6>카카오톡 로그인 성공 화면</h6>
	<hr />
	<h3>${kemail}</h3>
	<h3>${kname}</h3>
	<h3>${member_id}</h3>


	<div id="k_email" style="text-align:center"></div>
	<div id="k_nickname" style="text-align:center"></div>
</div>


<!-- 로그인한 상태 -->
<c:if test="${ member != null }">
	<div class="login_success_area">
		<span>회원 : ${member.member_id}</span>
	</div>
</c:if>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/commons/footer.jsp"></jsp:include>
</body>
</html>
