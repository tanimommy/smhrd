package com.smhrd.model;

import java.math.BigDecimal;

public class LanguageVO {
	
	private BigDecimal resume_num;
	private String language_name;
	private String language_level;
	
	public LanguageVO() {
		
	}
		
	public LanguageVO(BigDecimal resume_num, String language_name, String language_level) {
		super();
		this.resume_num = resume_num;
		this.language_name = language_name;
		this.language_level = language_level;
	}

	public BigDecimal getResume_num() {
		return resume_num;
	}


	public String getLanguage_name() {
		return language_name;
	}


	public String getLanguage_level() {
		return language_level;
	}
	
	

}
