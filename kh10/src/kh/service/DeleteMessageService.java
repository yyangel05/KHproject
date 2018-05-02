package kh.service;

import java.sql.Connection;
import java.sql.SQLException;

import kh.service.MessageDao;
import kh.service.MessageDaoProvider;
import kh.service.Message;
import ssol.jdbc.JdbcUtil;
import ssol.jdbc.ConnectionProvider;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	private DeleteMessageService() {
		
	}
	
	public void deleteMessage(int messageId, String password) throws ServiceException, InvalidMessagePasswordException, MessageNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDao messageDao = MessageDaoProvider.getInstance().getMessageDao();
			Message message = messageDao.select(conn, messageId);
			if(message == null) {
				throw new MessageNotFoundException("메세지가 없습니다:" + messageId);
			}
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException();
			}
			if(!message.getPassword().equals(password)) {
				throw new InvalidMessagePasswordException();
			}
			messageDao.delete(conn, messageId);
			
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 처리 중 에러가 발생했습니다:"+e.getMessage(),e);
			
		} catch(InvalidMessagePasswordException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} catch (MessageNotFoundException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			if(conn!=null) {
				try {
					conn.setAutoCommit(false);
				} catch(SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		
		}
		
	}

}
