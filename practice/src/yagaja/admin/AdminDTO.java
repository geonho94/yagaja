package yagaja.admin;

public class AdminDTO {
	private int idx;
	private String subject;
	private String content;
	private String image;
	private String location;
	private String runningtime;
	private String tel;
	private String city;
	private String gu;
	private String thema;
	private double star;
	private String writedate;
	private int readnum;
	private int reviewnum;
	private int likenum;
	private int ref;

	public AdminDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminDTO(int idx, String subject, String content, String image, String location, String runningtime,
			String tel, String city, String gu, String thema, double star, String writedate, int readnum, int reviewnum,
			int likenum, int ref) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.image = image;
		this.location = location;
		this.runningtime = runningtime;
		this.tel = tel;
		this.city = city;
		this.gu = gu;
		this.thema = thema;
		this.star = star;
		this.writedate = writedate;
		this.readnum = readnum;
		this.reviewnum = reviewnum;
		this.likenum = likenum;
		this.ref = ref;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRunningtime() {
		return runningtime;
	}

	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getThema() {
		return thema;
	}

	public void setThema(String thema) {
		this.thema = thema;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
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

	