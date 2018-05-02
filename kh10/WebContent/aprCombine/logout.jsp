<%
session.invalidate();
response.sendRedirect("list.jsp");
%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!= null) {
		for(int i=0;i<cookies.length;i++) {
			if(cookies[i].getName().equals("MEMBERID")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
			if(cookies[i].getName().equals("password")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
	
	
	%>