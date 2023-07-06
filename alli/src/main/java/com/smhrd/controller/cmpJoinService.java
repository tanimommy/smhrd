package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.cmpDAO;
import com.smhrd.model.cmpVO;

public class cmpJoinService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		String cmp_id = request.getParameter("cmp_id");
		String cmp_pw = request.getParameter("cmp_pw");
		String cmp_name = request.getParameter("cmp_name");
		String business_num = request.getParameter("business_num");
		String area = request.getParameter("area");
		String moveURL;
		
		System.out.println(cmp_id);
		
		cmpVO vo = new cmpVO(cmp_id, cmp_pw, cmp_name, business_num, area);
		
		cmpDAO dao = new cmpDAO();
		
		int cnt = dao.insertCmp(vo);
		
		if (cnt > 0) {

			System.out.println("성공");
			moveURL = "login.jsp?user_name" + cmp_name;
		} else {
			System.out.println("실패");
			moveURL = "join.jsp";
		}

		return moveURL;
	}

}
