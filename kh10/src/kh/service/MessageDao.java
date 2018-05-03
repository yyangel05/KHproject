package kh.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import kh.service.Message;
import ssol.jdbc.JdbcUtil;


public abstract class MessageDao {
	
	//insert문은 DBMS마다 달라서 따로 작성하기 위해 추상클래스로 선언. -> OracleMessageDao에서 MessageDao를 상속받아 구현함
	public abstract int insert(Connection conn, Message message) 
		throws SQLException;

	
	public Message select(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message_zzuggumi where message_id=?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return makeMessageFromResultSet(rs);
			} 
			else {
				return null;
			}
		}  finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	

	protected Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message_zzuggumi");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	//selectList는 OracleMessageDao에서  MessageDao를 상속받아 구현함
	public abstract List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException ;
	
	
	public int delete(Connection conn, int messageId )throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("delete from guestbook_message_zzuggumi where message_id=?" );
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
