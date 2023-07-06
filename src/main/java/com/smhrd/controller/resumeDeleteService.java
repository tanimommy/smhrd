package com.smhrd.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.resumeDAO;

public class resumeDeleteService implements Command {

	   @Override
	   public String excute(HttpServletRequest request, HttpServletResponse response) {
	      
	      String moveURL = "";
	      
	      BigDecimal deleteIndex = new BigDecimal(request.getParameter("delIndex"));
	      System.out.println(deleteIndex);
	      // MemberDAO -> deleteMember() 만들기
	      resumeDAO dao = new resumeDAO();
	      int delIndex = deleteIndex.intValue();
	      int cnt = dao.deleteResume(delIndex);
	      
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
