<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="member" scope="request" class="kh.member.MemberInfo"></jsp:useBean>
<%
	member.setId("food");
	member.setName("ÂÞ²Ù¹Ì");
%>
<jsp:forward page = "./useObject.jsp" />