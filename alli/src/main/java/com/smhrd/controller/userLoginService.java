package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.userDAO;
import com.smhrd.model.userVO;

public class userLoginService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {

		userVO login_vo = null;

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String moveURL;

		System.out.println(user_id);

		userVO vo = new userVO(user_id, user_pw);

		userDAO dao = new userDAO();

		login_vo = dao.userLogin(vo);

		if (login_vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login_vo", login_vo);
			moveURL = "index.jsp";
		} else {
			HttpSession session = request.getSession();
			System.out.println("실패");
			moveURL = "login.jsp";
			session.setAttribute("loginFailed", moveURL);
			
			System.out.println("서비스값" + session.getAttribute("loginFailed"));

		}
		return moveURL;
	}
}
