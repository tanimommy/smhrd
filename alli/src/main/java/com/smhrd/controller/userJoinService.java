package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.userDAO;
import com.smhrd.model.userVO;

public class userJoinService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {

			String moveURL = null;			
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_name = request.getParameter("user_name");
			String user_tel = request.getParameter("user_tel");
			String user_email = request.getParameter("user_email");
			String date_birth = request.getParameter("date_birth");
			String hope_area = request.getParameter("hope_area");
			String gender = request.getParameter("gender");
			
			System.out.println(user_id);
			
			userVO vo = new userVO(user_id, user_pw, user_name, user_tel, user_email, date_birth, hope_area, gender);

			userDAO dao = new userDAO();

			int cnt = dao.insertUser(vo);

			if (cnt > 0) {

				System.out.println("성공");
				moveURL = "login.jsp?user_name" + user_name;
			} else {
				System.out.println("실패");
				moveURL = "join.jsp";
			}

			return moveURL;
	}
}