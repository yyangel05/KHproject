<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!-- 인터페이스인지 클래스인지 찾아놓기 ↑ 위에 애들은 jdbc api-->

<html>
<head><title>회원 목록</title></head>
<body>
MEMBER_ZGM 테이블의 내용
<table width="100%" border="1">
<tr>
	<td>이름</td> <td>아이디</td> <td>이메일</td>
</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
		String dbUser = "KH10";
		String dbPass = "oracle";
		
		String query = "select * from MEMBER_ZGM order by MEMBERID";

		
		/* 접속 관련 연결객체 */	
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		/* 쿼리문 실행 */
		stmt = conn.createStatement();
		
		/* 처리결과가 여기(rs)에 저장 */
		rs = stmt.executeQuery(query);
		
		/* 저장된 것은 꺼내져야 하기에 꺼내는 코드. */
		while(rs.next()) {
%>
<tr>
	<td><%= rs.getString("NAME") %></td>
	<td><%= rs.getString("MEMBERID") %></td>
	<td><%= rs.getString("EMAIL") %></td>
</tr>
<%
		}
	} catch(SQLException ex) {
		 out.println(ex.getMessage());
		 ex.printStackTrace();
	} finally {
		if(rs!=null) try {rs.close();} catch(SQLException ex) {}
		if(stmt!= null) try {stmt.close(); } catch(SQLException ex) {}
		if(conn!= null) try {conn.close(); } catch(SQLException ex) {}
	}
%>
</table>
</body>
</html>