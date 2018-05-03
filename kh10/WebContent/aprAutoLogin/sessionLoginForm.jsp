<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	Cookie[] cookie = request.getCookies();
	String id = "";
	String password="";
	if(cookie != null) {
		for(int i=0;i<cookie.length;i++) {
			if(cookie[i].getName().trim().equals("id")) {
				System.out.println(cookie[i].getValue());
				id= cookie[i].getValue();
			}
			if(cookie[i].getName().trim().equals("password")) {
				System.out.println(cookie[i].getValue());
				password= cookie[i].getValue();
			}
		}
	}
%>

<html>
<head><title>세션 로그인 유지하는 폼</title></head>
<body>
<form action="<%= request.getContextPath() %>/aprAutoLogin/sessionLogin.jsp" method="post">

아이디 <input type ="text" name= "id" size="10" value="<%=id%>" >
암호 <input type="password" name="password" size="10" value="<%=password %>">
<input type="submit" value="로그인"> <br>
아이디 저장<input type="checkbox" name="id_rem" >
<%-- <% if(id.length() > 1) {("input:checkbox[id='id_rem']").prop("checked", true);} %> --%>
<%-- <% if(id.length() > 1)out.println("checked"); %> <br/> --%>
</body>
</html>



<!-- 
참고하기
http://lifeaddict.tistory.com/47 -->