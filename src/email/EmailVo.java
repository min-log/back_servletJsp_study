package email;

public class EmailVo {
	public String last_name;
	public String first_name;
	public String email;
	
	public EmailVo(){}

	public EmailVo(String last_name, String first_name, String email) {
		super();
		this.last_name = last_name;
		this.first_name = first_name;
		this.email = email;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
