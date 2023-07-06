package com.smhrd.model;

public class jjimVO {
	
	private int jjim;
	private String cmp_id;
	private int resume_num;
	
	
	
	public jjimVO() {
		
	}
	
	public jjimVO(String cmp_id, int resume_num) {
		super();
		this.cmp_id = cmp_id;
		this.resume_num = resume_num;
	}

	public jjimVO(int jjim, String cmp_id, int resume_num) {
		super();
		this.jjim = jjim;
		this.cmp_id = cmp_id;
		this.resume_num = resume_num;
	}
	
	public int getJjim() {
		return jjim;
	}
	public String getCmp_id() {
		return cmp_id;
	}
	public int getResume_num() {
		return resume_num;
	}
	
	
}
