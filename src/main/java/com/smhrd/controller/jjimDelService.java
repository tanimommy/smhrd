package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.jjimDAO;
import com.smhrd.model.jjimVO;

public class  jjimDelService implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		  
		  String cmp_id = request.getParameter("cmp_id");
		  int resume_num = Integer.parseInt(request.getParameter("resume_num"));
		
		  jjimVO vo = new jjimVO(cmp_id, resume_num);
		  jjimDAO dao = new jjimDAO(); 
		  int cnt = dao.deletejjim(vo);
		  
		  
		  if(cnt > 0) { 
			  System.out.println("찜삭제 성공"); 
			  //HttpSession session =request.getSession(); 
			  //session.setAttribute("developList", list); 
		  
		  } else {
			  System.out.println("찜삭제 실패"); }
			 
		  
		return "boardEmp.jsp";
	}

}
