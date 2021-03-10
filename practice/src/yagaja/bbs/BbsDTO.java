package yagaja.bbs;

import java.util.*;

public class BbsDTO {

	private int idx;
	private int num;
	private String writer;
	private String userimg;
	private String subject;
	private String content;
	private String file_y;
	private Date joindate;
	private String addr;
	private int count;
	
	public BbsDTO() {
		// TODO Auto-generated constructor stub
	}

	public BbsDTO(int idx, int num, String writer, String userimg, String subject, String content, String file_y,
			Date joindate, String addr, int count) {
		super();
		this.idx = idx;
		this.num = num;
		this.writer = writer;
		this.userimg = userimg;
		this.subject = subject;
		this.content = content;
		this.file_y = file_y;
		this.joindate = joindate;
		this.addr = addr;
		this.count = count;
		
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

	public String getFile_y() {
		return file_y;
	}

	public void setFile_y(String file_y) {
		this.file_y = file_y;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
}