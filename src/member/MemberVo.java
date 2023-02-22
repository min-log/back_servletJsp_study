package member;

public class MemberVo {
	//INSERT INTO KBNMEMBER (NUM,ID,PW,NAME,BIRTHDAY,EMAIL,PHONE,ADDRES,ESPONSIBILITY,AFFILIATED,DEPARTMENT)
	String id;
	String pw;
	String name;
	String birthday;
	//email
	String email01;
	String email02;
	//핸드폰번호
	String phone01;
	String phone02;
	String phone03;
	//주소
	String zipcode; // 우편번호 추가
	String addres01;
	String addres02;
	
	String esponibility;
	String affiliated;
	String department;
	String position;

	public MemberVo() {}
	


	public MemberVo(String id, String pw, String name, String birthday, String email01, String email02, String phone01,
			String phone02, String phone03, String zipcode, String addres01, String addres02, String esponibility,
			String affiliated, String department, String position) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birthday = birthday;
		this.email01 = email01;
		this.email02 = email02;
		this.phone01 = phone01;
		this.phone02 = phone02;
		this.phone03 = phone03;
		this.zipcode = zipcode;
		this.addres01 = addres01;
		this.addres02 = addres02;
		this.esponibility = esponibility;
		this.affiliated = affiliated;
		this.department = department;
		this.position = position;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getBirthday() {
		return birthday;
	}



	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}



	public String getEmail01() {
		return email01;
	}



	public void setEmail01(String email01) {
		this.email01 = email01;
	}



	public String getEmail02() {
		return email02;
	}



	public void setEmail02(String email02) {
		this.email02 = email02;
	}



	public String getPhone01() {
		return phone01;
	}



	public void setPhone01(String phone01) {
		this.phone01 = phone01;
	}



	public String getPhone02() {
		return phone02;
	}



	public void setPhone02(String phone02) {
		this.phone02 = phone02;
	}



	public String getPhone03() {
		return phone03;
	}



	public void setPhone03(String phone03) {
		this.phone03 = phone03;
	}



	public String getZipcode() {
		return zipcode;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	public String getAddres01() {
		return addres01;
	}



	public void setAddres01(String addres01) {
		this.addres01 = addres01;
	}



	public String getAddres02() {
		return addres02;
	}



	public void setAddres02(String addres02) {
		this.addres02 = addres02;
	}



	public String getEsponibility() {
		return "";
	}



	public void setEsponibility(String esponibility) {
		this.esponibility = esponibility;
	}



	public String getAffiliated() {
		return affiliated;
	}



	public void setAffiliated(String affiliated) {
		this.affiliated = affiliated;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}


	

}
