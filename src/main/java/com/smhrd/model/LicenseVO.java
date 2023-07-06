package com.smhrd.model;

import java.math.BigDecimal;

public class LicenseVO {
	private BigDecimal resume_num;
	private String License_name;
	
	public LicenseVO() {
		
	}
	
	public LicenseVO(BigDecimal resume_num, String license_name) {
		super();
		this.resume_num = resume_num;
		this.License_name = license_name;
	}

	public BigDecimal getResume_num() {
		return resume_num;
	}

	public String getLicense_name() {
		return License_name;
	}
	
}

