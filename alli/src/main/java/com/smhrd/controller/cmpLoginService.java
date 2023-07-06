package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.cmpDAO;
import com.smhrd.model.cmpVO;

public class cmpLoginService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {

		cmpVO cmpLogin_vo = null;

		String cmp_id = request.getParameter("cmp_id");
		String cmp_pw = request.getParameter("cmp_pw");
		String moveURL;

		System.out.println(cmp_id);

		cmpVO vo = new cmpVO(cmp_id, cmp_pw);

		cmpDAO dao = new cmpDAO();

		cmpLogin_vo = dao.cmpLogin(vo);

		if (cmpLogin_vo != null) {

			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("cmpLogin_vo", cmpLogin_vo);
			moveURL = "index.jsp";

		} else {

			HttpSession session = request.getSession();
			System.out.println("실패");
			moveURL = "login.jsp";
			session.setAttribute("cmploginFailed", moveURL);
			
			System.out.println("서비스값" + session.getAttribute("cmploginFailed"));
		}

		return moveURL;

	}

}
