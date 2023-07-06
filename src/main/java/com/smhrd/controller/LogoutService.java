package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;

public class LogoutService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String moveURL = "index.jsp";
		
		return moveURL;
	}

}
