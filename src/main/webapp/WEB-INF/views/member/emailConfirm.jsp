<%--
  Created by IntelliJ IDEA.
  User: jangsunhyeong
  Date: 2021/11/15
  Time: 8:08 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
    var member_id = '${member_id}';

    alert(member_id + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');

    window.open('', '_self', '');

    self.location ='/member/loginGo';
</script>
</body>
</html>
