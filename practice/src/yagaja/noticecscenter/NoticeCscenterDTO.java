

package yagaja.noticecscenter;

import java.util.Date;

public class NoticeCscenterDTO {
	
	// 공지사항용 메소드들
	
	private int idx;
	private String writer;
	private String img;
	private String uploading;
	private String subject;
	private String content;
	private Date writedate;
	private int ref;
	private int lev;
	private int sunbun;
	
	public NoticeCscenterDTO() {
		System.out.println("noticeCscenterDTO 생성자 호출됨~");
	}
	
	public NoticeCscenterDTO(int idx, String writer, String img, String uploading, String subject, String content,
			Date writedate, int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.img = img;
		this.uploading = uploading;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}
	
	public NoticeCscenterDTO(String writer, String img, String uploading, String subject, String content,
			Date writedate, int ref, int lev, int sunbun) {
		super();
		this.writer = writer;
		this.img = img;
		this.uploading = uploading;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUploading() {
		return uploading;
	}
	public void setUploading(String uploading) {
		this.uploading = uploading;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSunbun() {
		return sunbun;
	}
	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
}
