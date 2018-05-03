package soldesk.MVCModelBoard;


//레벨 3을 넘어가면 답변을 더 등록하지 못하게 하기 위한
public class CannotReplyArticleException extends Exception{ 
	public CannotReplyArticleException(String message) {
		super(message);
	}

}
