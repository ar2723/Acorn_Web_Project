package test.guest.dto;

public class GuestDto {
	/*
	 * Dto의 필드 선언하기
	 * - 필드의 type과 필드명 정하기 - 필드명은 가급적이면 데이터베이스 필드와 일치시켜주자
	 * - Dto 파일은 '주제, 카테고리'당 하나씩 작성하게 된다
	 */
	
	private int num;
	private String writer;
	private String content;
	private String pwd;
	private String date;
	
	//디폴트 생성자
	public GuestDto() {}
	
	public GuestDto(int num, String writer, String content, String pwd, String date) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.pwd = pwd;
		this.date = date;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
