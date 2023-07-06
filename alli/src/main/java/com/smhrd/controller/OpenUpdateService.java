package com.smhrd.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.resumeDAO;
import com.smhrd.model.resumeVO;

public class OpenUpdateService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = "";
		BigDecimal resume_num = new BigDecimal(request.getParameter("resume_num"));
		String user_id = request.getParameter("user_id");
		resumeVO vo = new resumeVO(resume_num,user_id);
		resumeDAO dao = new resumeDAO();
		int cnt2 = dao.openUpdate2(vo);
		int cnt = dao.openUpdate(vo);
		
		if(cnt>0 && cnt2>0) {
			System.out.println("업데이트 성공");
			moveURL = "boardJob.jsp";
		}else {
			System.out.println("업데이트 실패");
			moveURL = "boardJob.jsp";
		}
		
		
		return moveURL;
	}

}
