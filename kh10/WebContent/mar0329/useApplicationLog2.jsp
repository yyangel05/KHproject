<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>로그 메세지 기록2</title></head>
<body>

<%
	application.log("로그 메세지 기록");	
	log("로그 메세지 기록2");
%>
로그 메세지를 기록합니다.

</body>
</html>

<!-- <결과>
정보 : jsp: 로그 메세지 기록2
jsp가 자체적으로 제공하는 log메서드이기에 jsp라는 문장이 추가된다
 -->