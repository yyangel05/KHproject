package soldesk.MVCModelBoard;

//게시글이 하나도 없을때의 예외처리
public class ArticleNotFoundException extends Exception{
	public ArticleNotFoundException(String msg) {
		super(msg);
	}

}
