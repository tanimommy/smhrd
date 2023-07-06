package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.developDAO;
import com.smhrd.model.developVO;

public class DevelopService  implements Command{
	
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * String moveURL=""; developDAO dao = new developDAO(); List<developVO> list =
		 * dao.selectDevelopList();
		 * 
		 * if(list != null) { System.out.println("개발T 성공"); HttpSession session =
		 * request.getSession(); session.setAttribute("developList", list); moveURL
		 * ="boardEmp.jsp";
		 * 
		 * } else {
		 * 
		 * System.out.println("개발T 실패"); }
		 */
		return null;
		}
}
