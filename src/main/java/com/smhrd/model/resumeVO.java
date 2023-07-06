package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import oracle.sql.BLOB;

public class resumeVO {
   
   private BigDecimal resume_num;
   private String user_id;
   private String user_name;
   private String user_tel;
   private String user_email;
   private String date_birth;
   private String hope_area;
   private String resume_title;
   private String address;
   private String self_introduction;
   private String gender;
   private Timestamp cre_date;
   private String school_division; //학교구분
   private String school_name; //학교명
   private String graduation_status; //졸업상태
   private String hope_salary;
   private String picture; //이미지
   private String file_name;
   private String major; //학과
   private String career;
   private String award;
   private String url;
   private String hope_area2;
   private String on_off;
   private String user_tel2;
   private String career_date;
   private String other_license;


   public resumeVO() {
      
   }

   //기업게시판에 이력서미리보기
   public resumeVO(BigDecimal resume_num, String user_id, String user_name, String user_tel, String user_email,
         String date_birth, String hope_area, String resume_title, String address, String self_introduction,
         String gender, Timestamp cre_date, String school_division, String school_name, String graduation_status, String hope_salary,
         String picture, String file_name, String major, String career, String award, String url, String hope_area2,
         String on_off, String career_date,String other_license) {
         super();
         this.resume_num = resume_num;
         this.user_id = user_id;
         this.user_name = user_name;
         this.user_tel = user_tel;
         this.user_email = user_email;
         this.date_birth = date_birth;
         this.hope_area = hope_area;
         this.resume_title = resume_title;
         this.address = address;
         this.self_introduction = self_introduction;
          this.gender = gender;
         this.cre_date = cre_date;
         this.school_division = school_division;
         this.school_name = school_name;
         this.graduation_status = graduation_status;
         this.hope_salary = hope_salary;
         this.picture = picture;
         this.file_name = file_name;
         this.major = major;
         this.career = career;
         this.award = award;
         this.url = url;
         this.hope_area2 = hope_area2;
         this.on_off = on_off;
         this.career_date = career_date;
         this.other_license = other_license;
   }
   
   public resumeVO(String user_id, String user_name, String user_tel, String user_email,
	         String date_birth, String hope_area, String resume_title, String address, String self_introduction,
	         String gender, String school_division, String school_name, String graduation_status, String hope_salary,
	         String picture, String file_name, String major, String career, String award, String url, String hope_area2,
	         String on_off, String user_tel2, String career_date,String other_license) {
	         super();
	         this.user_id = user_id;
	         this.user_name = user_name;
	         this.user_tel = user_tel;
	         this.user_email = user_email;
	         this.date_birth = date_birth;
	         this.hope_area = hope_area;
	         this.resume_title = resume_title;
	         this.address = address;
	         this.self_introduction = self_introduction;
	         this.gender = gender;
	         this.school_division = school_division;
	         this.school_name = school_name;
	         this.graduation_status = graduation_status;
	         this.hope_salary = hope_salary;
	         this.picture = picture;
	         this.file_name = file_name;
	         this.major = major;
	         this.career = career;
	         this.award = award;
	         this.url = url;
	         this.hope_area2 = hope_area2;
	         this.on_off = on_off;
	         this.user_tel2 = user_tel2;
	         this.career_date = career_date;
	         this.other_license = other_license;
	   }
   
   
   @Override
	public String toString() {
		return "resumeVO [resume_num=" + resume_num + ", user_id=" + user_id + ", user_name=" + user_name + ", user_tel="
				+ user_tel + ", user_email=" + user_email + ", date_birth=" + date_birth + ", hope_area=" + hope_area
				+ ", resume_title=" + resume_title + ", address=" + address + ", self_introduction=" + self_introduction
				+ ", gender=" + gender + ", cre_date=" + cre_date + ", school_division=" + school_division
				+ ", school_name=" + school_name + ", graduation_status=" + graduation_status + ", hope_salary="
				+ hope_salary + ", picture=" + picture + ", file_name=" + file_name + ", major=" + major + ", career="
				+ career + ", award=" + award + ", url=" + url + ", hope_area2=" + hope_area2 + ", on_off=" + on_off
				+ ", user_tel2=" + user_tel2 + ", career_date=" + career_date + ", other_license=" + other_license + "]";
	}

// 구직자 이력서 공개/비공개 전환을 위한 생성자
   public resumeVO(BigDecimal resume_num, String user_id) {
	   super();
	   this.resume_num = resume_num;
	   this.user_id = user_id;
   }
   

   public BigDecimal getResume_num() {
      return resume_num;
   }

   public String getUser_id() {
      return user_id;
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

   public String getResume_title() {
      return resume_title;
   }

   public String getAddress() {
      return address;
   }

   public String getSelf_introduction() {
      return self_introduction;
   }

   public String getGender() {
      return gender;
   }
   
   public Timestamp getCre_date() {
      return cre_date;
   }

   public String getSchool_division() {
      return school_division;
   }

   public String getSchool_name() {
      return school_name;
   }

   public String getGraduation_status() {
      return graduation_status;
   }

   public String getHope_salary() {
      return hope_salary;
   }

   public String getPicture() {
      return picture;
   }

   public String getFile_name() {
      return file_name;
   }

   public String getMajor() {
      return major;
   }

   public String getCareer() {
      return career;
   }

   public String getAward() {
      return award;
   }

   public String getUrl() {
      return url;
   }

   public String getHope_area2() {
      return hope_area2;
   }

   public String getOn_off() {
      return on_off;
   }

   public String getUser_tel2() {
      return user_tel2;
   }
   
   public String getCareer_date() {
      return career_date;
   }
   public String getOther_license() {
	   return other_license;
   }
}