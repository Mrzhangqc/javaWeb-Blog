package com.zhangqichang.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhangqichang.dao.UserDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.UserSingle;

public class UserLogon extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward=getInitParameter("visitorLogonPage");
		HttpSession session=request.getSession();
		
		Object logoner=session.getAttribute("logoner");	
		if(logoner!=null&&(logoner instanceof UserSingle))					
			message="<li>请重新输入</li>";
		else{																
			String name=Change.toChinese(request.getParameter("userName"));
			String pswd=Change.toChinese(request.getParameter("userPswd"));

			message=validateLogon(name,pswd);								//验证用户名和密码֤
			if(message.equals("")){											
				try {
					UserDao userDao=new UserDao();
					logoner=userDao.getLogoner(new Object[]{name,pswd});
					if(logoner==null)
						message="<li>用户名和密码有误</li>";
					else{
						message="<li>登陆成功！</li>";
						session.setAttribute("logoner",logoner);
						forward="/my/goBlog?master="+((UserSingle)logoner).getId();
					}
				} catch (SQLException e) {
					message="<li>登陆</li>";
					e.printStackTrace();
				}
			}			
		}		
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	private String validateLogon(String name,String pswd){
		String message="";
		if(name==null||name.equals(""))
			message="<li>用户名<b>为空</b></li>";
		if(pswd==null||pswd.equals(""))
			message+="<li>密码<b>为空</b></li>";
		return message;
	}
}
