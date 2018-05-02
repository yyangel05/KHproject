package soldesk.MVCModelBoard;


//writingrequest를 상속받아 오버라이딩하여 사용한다
public class ReplyingRequest extends WritingRequest{ 
	private int parentArticleId; //답변글에는 기존 자바빈에 부모글을 다믄 변수가 하나 필요함
	
	public int getParentArticleId() {
		return parentArticleId;
	}
	public void setParentArticleId(int parentArticleId) {
		this.parentArticleId = parentArticleId;
	}

}
