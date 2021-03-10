package yagaja.member;

import java.sql.*;

public class MemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String img;
	private Date joindate;

	public MemberDTO() {
		System.out.println("yagaja_MemberDTO 호출됨");
	}

	public MemberDTO(int idx, String id, String pwd, String name, String email, String tel, String img, Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.img = img;
		this.joindate = joindate;
	}

    public MemberDTO(String pwd, String name, String email, String tel, Date joindate) {
        super();
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.tel = tel;
        this.joindate = joindate;
     }
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	
	
}
