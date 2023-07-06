package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.command.Command;
import com.smhrd.db.SqlSessionManager;
import com.smhrd.model.FrameworkVO;
import com.smhrd.model.LanguageVO;
import com.smhrd.model.LicenseVO;
import com.smhrd.model.OsVO;
import com.smhrd.model.resumeVO;

public class testService implements Command {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
	    List<resumeVO> resumeList = session.selectList("selectListToEmp");
	    
		System.out.println(resumeList.get(0).getSchool_division());
		System.out.println(resumeList.size());
				
		// 학력
		List<String> selectedSchoolDivision = new ArrayList<>();
		String[] school_divisions = request.getParameterValues("school_division");

		if (school_divisions != null) {
		    for (int i = 0; i < school_divisions.length; i++) {
		    	selectedSchoolDivision.add(school_divisions[i]);
		    }
		}

		System.out.println("백 선택된 학력:");
		for (int i = 0; i < selectedSchoolDivision.size(); i++) {
		    System.out.println(selectedSchoolDivision.get(i));
		}
		
		// 가져온 학력과 비교
		List<resumeVO> filteredResumeList = new ArrayList<>();

		if (selectedSchoolDivision.isEmpty()) {
		    filteredResumeList.addAll(resumeList);
		} else {
		    for (resumeVO resume : resumeList) {
		        if (selectedSchoolDivision.contains(resume.getSchool_division())) {
		            filteredResumeList.add(resume);
		        }
		    }
		}
		System.out.println(filteredResumeList.size());
		
		// 경력
		List<String> selectedCareerDate = new ArrayList<>();
		String[] career_dates = request.getParameterValues("career_date");

		if (career_dates != null) {
		    for (int i = 0; i < career_dates.length; i++) {
		        selectedCareerDate.add(career_dates[i]);
		    }
		}

		System.out.println("백 선택된 경력:");
		for (int i = 0; i < selectedCareerDate.size(); i++) {
		    System.out.println(selectedCareerDate.get(i));
		}
		
		// 가져온 경력과 비교
		List<resumeVO> filteredResumeList2 = new ArrayList<>();
		if (selectedCareerDate.isEmpty()) {
		    filteredResumeList2.addAll(filteredResumeList);
		} else {
		    for (resumeVO resume : filteredResumeList) {
		        if (selectedCareerDate.contains(resume.getCareer_date())) {
		            filteredResumeList2.add(resume);
		        }
		    }
		}
		System.out.println(filteredResumeList2.size());
		
		// 언어
		List<String> selectedLanguages = new ArrayList<>();
		String[] languages = request.getParameterValues("languages");

		if (languages != null) {
		    for (int i = 0; i < languages.length; i++) {
		        selectedLanguages.add(languages[i]);
		    }
		}
		
		// 필터링 언어
		
		List<LanguageVO> languageList = session.selectList("selectLanguage");
		
		System.out.println("백 자바 선택된 언어:");
		for (int i = 0; i < selectedLanguages.size(); i++) {
		    System.out.println(selectedLanguages.get(i));
		}
		
		// 가져온 언어와 비교
		List<LanguageVO> filteredLanguageList = new ArrayList<>();
		if (selectedLanguages != null) {
		    for (LanguageVO language : languageList) {
		        if (selectedLanguages.contains(language.getLanguage_name())) {
		            filteredLanguageList.add(language);
		        }
		    }
		}

		// 선택된 언어와 일치하는 이력서만 추출
		List<resumeVO> filteredResumeList3 = new ArrayList<>();

		if (selectedLanguages == null || selectedLanguages.isEmpty()) {
		    filteredResumeList3.addAll(filteredResumeList2);
		} else {
		    for (int i = 0; i < filteredResumeList2.size(); i++) {
		        resumeVO resume = filteredResumeList2.get(i);
		        for (int j = 0; j < filteredLanguageList.size(); j++) {
		            LanguageVO language = filteredLanguageList.get(j);
		            if (resume.getResume_num().toBigInteger().equals(language.getResume_num().toBigInteger())) {
		                filteredResumeList3.add(resume);
		                break;
		            }
		        }
		    }
		}
		System.out.println(filteredResumeList3.size());
		
		// 프레임워크
		List<String> selectedFrameworks = new ArrayList<>();
		String[] frameworks = request.getParameterValues("frameworks");

		if (frameworks != null) {
		    for (int i = 0; i < frameworks.length; i++) {
		    	selectedFrameworks.add(frameworks[i]);
		    }
		}

		System.out.println("백 선택된 프레임워크:");
		for (int i = 0; i < selectedFrameworks.size(); i++) {
		    System.out.println(selectedFrameworks.get(i));
		}
		
		// 필터링 프레임워크
		List<FrameworkVO> frameworkList = session.selectList("selectFramework");
		
		// 가져온 프레임워크와 비교
		List<FrameworkVO> filteredFrameworkList = new ArrayList<>();
		if (selectedFrameworks != null) {
		    for (FrameworkVO framework : frameworkList) {
		        if (selectedFrameworks.contains(framework.getFramework_name())) {
		        	filteredFrameworkList.add(framework);
		        }
		    }
		}

		// 선택된 프레임워크와 일치하는 이력서만 추출
		List<resumeVO> filteredResumeList4 = new ArrayList<>();

		if (selectedFrameworks == null || selectedFrameworks.isEmpty()) {
		    filteredResumeList4.addAll(filteredResumeList3);
		} else {
		    for (int i = 0; i < filteredResumeList3.size(); i++) {
		        resumeVO resume = filteredResumeList3.get(i);
		        for (int j = 0; j < filteredLanguageList.size(); j++) {
		            FrameworkVO framwork = filteredFrameworkList.get(j);
		            if (resume.getResume_num().toBigInteger().equals(framwork.getResume_num().toBigInteger())) {
		                filteredResumeList4.add(resume);
		                break;
		            }
		        }
		    }
		}
		System.out.println(filteredResumeList4.size());
		
		// 운영체제
		List<String> selectedOSS = new ArrayList<>();
		String[] oss = request.getParameterValues("oss");

		if (oss != null) {
		    for (int i = 0; i < oss.length; i++) {
		    	selectedOSS.add(oss[i]);
		    }
		}

		System.out.println("백 선택된 운영체제:");
		for (int i = 0; i < selectedOSS.size(); i++) {
		    System.out.println(selectedOSS.get(i));
		}
		
		// 필터링 운영체제
		List<OsVO> osList = session.selectList("selectOs");
		
		// 가져온 운영체제와 비교
		List<OsVO> filteredOsList = new ArrayList<>();
		if (selectedOSS != null) {
		    for (OsVO os : osList) {
		        if (selectedOSS.contains(os.getOs_name())) {
		        	filteredOsList.add(os);
		        }
		    }
		}

		// 선택된 운영체제와 일치하는 이력서만 추출
		List<resumeVO> filteredResumeList5 = new ArrayList<>();

		if (selectedOSS == null || selectedOSS.isEmpty()) {
		    filteredResumeList5.addAll(filteredResumeList4);
		} else {
		    for (int i = 0; i < filteredResumeList4.size(); i++) {
		        resumeVO resume = filteredResumeList4.get(i);
		        for (int j = 0; j < filteredOsList.size(); j++) {
		            OsVO os = filteredOsList.get(j);
		            if (resume.getResume_num().toBigInteger().equals(os.getResume_num().toBigInteger())) {
		                filteredResumeList5.add(resume);
		                break;
		            }
		        }
		    }
		}
		System.out.println(filteredResumeList5.size());
		
		// 자격증
		List<String> selectedLicenses = new ArrayList<>();
		String[] licenses = request.getParameterValues("licenses");

		if (licenses != null) {
		    for (int i = 0; i < licenses.length; i++) {
		    	selectedLicenses.add(licenses[i]);
		    }
		}

		System.out.println("백 선택된 자격증:");
		for (int i = 0; i < selectedLicenses.size(); i++) {
		    System.out.println(selectedLicenses.get(i));
		}
		
		// 필터링 자격증
		List<LicenseVO> licenseList = session.selectList("selectLicense");
		
		// 가져온 자격증과 비교
		List<LicenseVO> filteredLicenseList = new ArrayList<>();
		if (selectedLicenses != null) {
		    for (LicenseVO license : licenseList) {
		        if (selectedLicenses.contains(license.getLicense_name())) {
		        	filteredLicenseList.add(license);
		        }
		    }
		}

		// 선택된 자격증과 일치하는 이력서만 추출
		List<resumeVO> filteredResumeList6 = new ArrayList<>();

		if (selectedLicenses == null || selectedLicenses.isEmpty()) {
		    filteredResumeList6.addAll(filteredResumeList5);
		} else {
		    for (int i = 0; i < filteredResumeList5.size(); i++) {
		        resumeVO resume = filteredResumeList5.get(i);
		        for (int j = 0; j < filteredLicenseList.size(); j++) {
		            LicenseVO license = filteredLicenseList.get(j);
		            if (resume.getResume_num().toBigInteger().equals(license.getResume_num().toBigInteger())) {
		                filteredResumeList6.add(resume);
		                break;
		            }
		        }
		    }
		}
		System.out.println(filteredResumeList6.size());
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("filter", filteredResumeList6);
		
		session.close();
		
		return "boardEmp.jsp";
	}

}
