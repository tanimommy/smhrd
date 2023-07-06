package com.smhrd.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.resumeDAO;
import com.smhrd.model.resumeVO;

public class CloseUpdateService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = "";
		BigDecimal resume_num = new BigDecimal(request.getParameter("resume_num"));
		resumeDAO dao = new resumeDAO();
		int cnt = dao.closeUpdate(resume_num);
		
		if(cnt>0) {
			System.out.println("업데이트 성공");
			moveURL = "boardJob.jsp";
		}else {
			System.out.println("업데이트 실패");
			moveURL = "boardJob.jsp";
		}
		
		
		return moveURL;
	}

}
