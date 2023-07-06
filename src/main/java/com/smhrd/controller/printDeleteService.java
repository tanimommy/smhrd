package com.smhrd.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.resumeDAO;

public class printDeleteService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL = "";
		
		BigDecimal resume_num = new BigDecimal(request.getParameter("resume_num"));
		int myInt = resume_num.intValue();
		System.out.println("printDelete_myInt: "+myInt);
		System.out.println("printDelete_myInt: "+int.class.getName());		
		resumeDAO dao = new resumeDAO();
		int cnt = dao.deletePrint(myInt);
		
		if(cnt > 0) {
			System.out.println("삭제 성공");
			moveURL = "boardJob.jsp";
		}else {
			System.out.println("삭제 실패");
			moveURL = "boardJob.jsp";
		}
		return moveURL;
	}

}
