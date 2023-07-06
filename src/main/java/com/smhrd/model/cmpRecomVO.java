package com.smhrd.model;

public class cmpRecomVO {
	private int cmp_num ;
	private String cmp_name ;
	private String career ;
	private String education ;
	private String employment ;
	private String area ;
	private String cmp_title ;
	private String stac ;
	private String cmp_link ;
	
	public cmpRecomVO() {
		
	}
	
	public cmpRecomVO(int cmp_num, String cmp_name, String career, String education, String employment, String area,
			String cmp_title, String stac, String cmp_link) {
		super();
		this.cmp_num = cmp_num;
		this.cmp_name = cmp_name;
		this.career = career;
		this.education = education;
		this.employment = employment;
		this.area = area;
		this.cmp_title = cmp_title;
		this.stac = stac;
		this.cmp_link = cmp_link ;
	}


	public int getCmp_num() {
		return cmp_num;
	}
	public String getCmp_name() {
		return cmp_name;
	}
	public String getCareer() {
		return career;
	}
	public String getEducation() {
		return education;
	}
	public String getEmployment() {
		return employment;
	}
	public String getArea() {
		return area;
	}
	public String getCmp_title() {
		return cmp_title;
	}
	public String getStac() {
		return stac;
	}

	public String getCmp_link() {
		return cmp_link;
	}
	
	
	
}
