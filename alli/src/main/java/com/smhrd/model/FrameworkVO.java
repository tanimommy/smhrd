package com.smhrd.model;

import java.math.BigDecimal;

public class FrameworkVO {
	
	private BigDecimal resume_num;
	private String framework_name;
	private String framework_level;
	
	public FrameworkVO() {
		
	}

	public FrameworkVO(BigDecimal resume_num, String framework_name, String framework_level) {
		super();
		this.resume_num = resume_num;
		this.framework_name = framework_name;
		this.framework_level = framework_level;
	}

	public BigDecimal getResume_num() {
		return resume_num;
	}

	public String getFramework_name() {
		return framework_name;
	}

	public String getFramework_level() {
		return framework_level;
	}
	
}
