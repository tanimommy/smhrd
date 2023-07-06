package com.smhrd.model;

public class developVO {
	
	private String languages;
	private String frameworks;
	private String oss;
	private String licenses;
	
	//임의 테이블 1개담기
	public developVO(String frameworks) {
		super();
		this.frameworks = frameworks;
	}
	
	// 자격증 명칭 테이블 4개
	public developVO(String languages, String frameworks, String oss, String licenses) {
		super();
		this.languages = languages;
		this.frameworks = frameworks;
		this.oss = oss;
		this.licenses = licenses;
	}
	
	public String getLanguages() {
		return languages;
	}
	public String getFrameworks() {
		return frameworks;
	}
	public String getOss() {
		return oss;
	}
	public String getLicenses() {
		return licenses;
	}
	
	
}
