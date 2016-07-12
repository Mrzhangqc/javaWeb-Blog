package com.zhangqichang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhangqichang.dao.UserDao;

public class IndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("activation",true);			
		try{
			UserDao mainDao=new UserDao();
			List masterlist=mainDao.getMasterList();
			request.setAttribute("masterlist",masterlist);	
		}catch(Exception e){
			System.out.println("IndexServlet请求doPost与异常?");
			e.printStackTrace();
		}		
		
		String forward=getInitParameter("showWelcome");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
}