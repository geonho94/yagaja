package yagaja.review;

public class ReviewDTO {
	private int idx;
	private int contentidx;
	private String id;
	private String content;
	private String image;
	private String writedate;
	private int star;
	private int commentnum;
	private int likenum;
	private int ref;
	
	
	
	
	public ReviewDTO(int idx, int contentidx, String id, String content, String image, String writedate, int star,
			int commentnum, int likenum, int ref) {
		super();
		this.idx = idx;
		this.contentidx = contentidx;
		this.id = id;
		this.content = content;
		this.image = image;
		this.writedate = writedate;
		this.star = star;
		this.commentnum = commentnum;
		this.likenum = likenum;
		this.ref = ref;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getContentidx() {
		return contentidx;
	}
	public void setContentidx(int contentidx) {
		this.contentidx = contentidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	
	
	
}
