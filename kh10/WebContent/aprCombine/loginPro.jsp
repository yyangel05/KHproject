<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.logon.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String id_rem = request.getParameter("id_rem");
	Cookie cookieId=null;
	Cookie cookiePass=null;
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id, passwd);
	
	if(id_rem!= null && id_rem.trim().equals("on")) {
		cookieId = new Cookie("id",id);
		cookieId.setMaxAge(1*60);
		cookieId.setPath("/");
		response.addCookie(cookieId);
		
		cookiePass = new Cookie("passwd", passwd);
		cookiePass.setMaxAge(1*60);
		cookieId.setPath("/");
		response.addCookie(cookiePass);
	} else {
		cookieId = new Cookie("id",null);
		cookieId.setMaxAge(0);
		response.addCookie(cookieId);
		
		cookiePass = new Cookie("passwd",null);
		cookiePass.setMaxAge(0);
		response.addCookie(cookiePass);
	}
	
	
	if(check==1) {
		session.setAttribute("memId", id);
		session.setMaxInactiveInterval(60*5);
		
		response.sendRedirect("main.jsp");
	}
	else if(check==0){%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<% } else { %>	
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>	
	
<%}%>
<%-- 
<%
	
	

	if(id.equals(passwd)) {
		session.setAttribute("MEMBERID",id); 
	}
%>
 --%>




<%-- 
=============================================
<% request.setCharacterEncoding("euc-kr");%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id, passwd);
	
	if(check==1) {
		session.setAttribute("memId", id);
		response.sendRedirect("main.jsp");
	}
	else if(check==0){%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<% } else { %>	
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>	
	
<%}%> --%>