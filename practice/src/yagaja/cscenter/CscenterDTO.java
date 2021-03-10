package yagaja.cscenter;

import java.util.*;

public class CscenterDTO {
	private int idx;
	private String writer;
	private String img;
	private String subject;
	private String content;
	private Date writedate;
	private int ref;
	private int lev;
	private int sunbun;
	
	public CscenterDTO() {
		System.out.println("CscenterDTO 생성자 호출됨~");
	}

	public CscenterDTO(int idx, String writer, String img, String subject, String content, Date writedate, int ref,
			int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.img = img;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public CscenterDTO(String writer, String img, String subject, String content, Date writedate, int ref, int lev,
			int sunbun) {
		super();
		this.writer = writer;
		this.img = img;
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