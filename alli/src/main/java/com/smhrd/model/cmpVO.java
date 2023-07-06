package com.smhrd.model;

public class cmpVO {

	private String cmp_id;
	private String cmp_pw;
	private String cmp_name;
	private String business_num;
	private String area;

	// 사용자(기업)회원가입 정보
	public cmpVO(String cmp_id, String cmp_pw, String cmp_name, String business_num, String area) {
		super();
		this.cmp_id = cmp_id;
		this.cmp_pw = cmp_pw;
		this.cmp_name = cmp_name;
		this.business_num = business_num;
		this.area = area;
	}
	
	// 사용자(기업)로그인 정보
	public cmpVO(String cmp_id, String cmp_pw) {
		super();
		this.cmp_id = cmp_id;
		this.cmp_pw = cmp_pw;
	}

	public String getCmp_id() {
		return cmp_id;
	}

	public String getCmp_pw() {
		return cmp_pw;
	}

	public String getCmp_name() {
		return cmp_name;
	}

	public String getBusiness_num() {
		return business_num;
	}

	public String getArea() {
		return area;
	}

}
