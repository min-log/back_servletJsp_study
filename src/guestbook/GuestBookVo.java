package guestbook;

public class GuestBookVo {
//	NO NUMBER(5),
//	name varchar2(80),
//	password varchar2(20),
//	content varchar2(2000),
//	req_date DATE
	private String no;
	private String name;
	private String password;
	private String content;
	private String req_date;
	public GuestBookVo() {};
	
	public GuestBookVo(String no, String password) {
		super();
		this.no = no;
		this.password = password;
	}
	
	public GuestBookVo(String name, String password, String content) {
		super();
		this.name = name;
		this.password = password;
		this.content = content;
	}
	
	
	
	
	
	public GuestBookVo(String no, String name, String password, String content, String req_date) {
		super();
		this.no = no;
		this.name = name;
		this.password = password;
		this.content = content;
		this.req_date = req_date;
	}
	
	
	
	@Override
	public String toString() {
		return "GuestBookVo [no=" + no + ", name=" + name + ", password=" + password + ", content=" + content
				+ ", req_date=" + req_date + "]";
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	
	
	
	
}
