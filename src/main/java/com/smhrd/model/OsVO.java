package com.smhrd.model;

import java.math.BigDecimal;

public class OsVO {
	private BigDecimal resume_num;
	private String os_name;
	private String os_level;
	
	public OsVO() {
		
	}
	
	public OsVO(BigDecimal resume_num, String os_name, String os_level) {
		super();
		this.resume_num = resume_num;
		this.os_name = os_name;
		this.os_level = os_level;
	}
	
	public BigDecimal getResume_num() {
		return resume_num;
	}

	public String getOs_name() {
		return os_name;
	}

	public String getOs_level() {
		return os_level;
	}

	
	
}
