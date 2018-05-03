<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String id_rem = request.getParameter("id_rem");
	Cookie cookieId=null;
	Cookie cookiePass=null;
	
	if(id_rem!= null && id_rem.trim().equals("on")) {
		cookieId = new Cookie("id",id);
		cookieId.setMaxAge(1*60);
		cookieId.setPath("/");
		response.addCookie(cookieId);
		
		cookiePass = new Cookie("password", password);
		cookiePass.setMaxAge(1*60);
		cookieId.setPath("/");
		response.addCookie(cookiePass);
	} else {
		cookieId = new Cookie("id",null);
		cookieId.setMaxAge(0);
		response.addCookie(cookieId);
		
		cookiePass = new Cookie("id",null);
		cookiePass.setMaxAge(0);
		response.addCookie(cookiePass);
	}

	if(id.equals(password)) {
		session.setAttribute("MEMBERID",id); 
%>		

		
<html>
<head><title>로그인성공</title></head>
<body>
로그인에 성공했습니다.
</body>
</html>
<%
	} else {
%>
<script>
alert("로그인에 실패했습니다.");
history.go(-1);
</script>
<%
	}
%>