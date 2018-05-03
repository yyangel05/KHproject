package soldesk.MVCModelBoard;

import java.sql.Connection;
import java.sql.SQLException;

import ssol.jdbc.ConnectionProvider;
import ssol.jdbc.JdbcUtil;

public class ReadArticleService {
	private static ReadArticleService instance = new ReadArticleService();
	public static ReadArticleService getInstance() {
		return instance;
	}
	
	private ReadArticleService() {
		
	}
	
	public Article readArticle(int articleId) throws ArticleNotFoundException {
		return selectArticle(articleId, true);
	}
	
	
	//조회수 증가에 대해 참거짓을 나눠서 동작하는 메서드
	private Article selectArticle(int articleId, boolean increaseCount) throws ArticleNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ArticleDao articleDao = ArticleDao.getInstance();
			Article article = articleDao.selectById(conn, articleId);
			if(article == null) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다 :" +articleId);
			}
			if(increaseCount) { //조회수증가 변수가 참이면 데이터도 꺼내오고 조회수증가도 한다.
				articleDao.increaseReadCount(conn, articleId);
				article.setReadCount(article.getReadCount() +1);
			}
			return article;
		} catch(SQLException e) {
			throw new RuntimeException("DB 에러 발생 :"+e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	public Article getArticle(int articleId) throws ArticleNotFoundException {
		return selectArticle(articleId, false); //수정폼에서 가져다 쓰기 위해 조회수 증가를 하지 않음
	}
}
