package com.smhrd.model;

public class userVO {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private String user_email;
	private String date_birth;
	private String hope_area;
	private String gender;

	// 유저(구직자)회원가입 정보
	public userVO(String user_id, String user_pw, String user_name, String user_tel, String user_email,
			String date_birth, String hope_area, String gender) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.date_birth = date_birth;
		this.hope_area = hope_area;
		this.gender = gender;
	}
	
	// 유저(구직자)로그인 정보
	public userVO(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getDate_birth() {
		return date_birth;
	}

	public String getHope_area() {
		return hope_area;
	}
	
	public String getGender() {
		return gender;
	}

	
	
}
