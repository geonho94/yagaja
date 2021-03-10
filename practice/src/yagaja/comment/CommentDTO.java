package yagaja.comment;

import java.util.*;

public class CommentDTO {

	private int idx;
	private int num;
	private String writer;
	private String userimg;
	private String addr;
	private String content;
	private Date writedate;
	private int ref;
	private int lev;
	
	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(int idx, int num, String writer, String userimg, String addr, String content, Date writedate,
			int ref, int lev) {
		super();
		this.idx = idx;
		this.num = num;
		this.writer = writer;
		this.userimg = userimg;
		this.addr = addr;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUserimg() {
		return userimg;
	}

	public void setUserimg(String userimg) {
		this.userimg = userimg;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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

	
	
}
