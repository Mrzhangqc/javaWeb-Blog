package com.zhangqichang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.zhangqichang.dao.UserDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.UserSingle;

public class UserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userIco="myNull.jpg";
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("upIco".equals(action))
			doUpLoadIco(request,response);
		else if("userReg".equals(action))
			doUserReg(request,response);
		else
			doOther(request,response);
	}
	
	protected void doUserReg(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String forward="";
		String message="";
		
		UserSingle single=(UserSingle)request.getAttribute("regUser");
		message=validateReg(single);
		
		if(!message.equals(""))											
			forward = getInitParameter("input");
		else{														
			try {
				UserDao userDao=new UserDao();

				String ctTime=Change.dateTimeChange(new Date());
				single.setUserCTTime(ctTime);
				single.setUserIco(userIco);
				userDao.insert(single);
				forward="/goIndex";
			} catch (SQLException e) {				
				e.printStackTrace();
				message="<li>ע请求异常</li>";
				forward=getInitParameter("input");
			}
		}
		userIco+="1";
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	public void doUpLoadIco(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String message="";
		try {
			SmartUpload myup=new SmartUpload();
			myup.initialize(this, request, response);
			
			myup.setAllowedFilesList("jpg,gif");						
			myup.upload();
			File upfile=myup.getFiles().getFile(0);							
			if(!upfile.isMissing()){										
				message=validateUpLoad(upfile);									
				if(message.equals("")){	 //信息֤
					Date now=new Date();
					String src="userIco_"+Change.getSerial(now)+"."+upfile.getFileExt();
					userIco=src;
					upfile.saveAs("images/ico/"+src,File.SAVEAS_VIRTUAL);	
					message="<li>上传成功！</li>";
				}					
			}
			else
				message="<li>上传失败！</li>";
		}catch(SecurityException e){
			e.printStackTrace();
			message="<li>头像格式只能为jpg，gif</li>";
		} catch (Exception e1) {
			e1.printStackTrace();
			message="<li>请求异常</li>";
			e1.printStackTrace();
		}
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(getInitParameter("input"));
		rd.forward(request,response);		
	}
	private String validateReg(UserSingle single){
		String message="";
		String userName=single.getUserName();
		String userPswd=single.getUserPswd();
		String aginPswd=single.getAginPswd();
		String blogName=single.getUserBlogName();
		String userMotto=single.getUserMotto();		
		String userOicq=single.getUserOicq();
		String userEmail=single.getUserEmail();
		
		boolean mark=true;
		if(userName==null||userName.equals("")){
			message="<li><b>用户名</b>不能为空</li>";
			mark=false;
		}
		if(userPswd==null||userPswd.equals("")){
			message+="<li><b>密码</b>不能为空</li>";
			mark=false;
		}
		if(aginPswd==null||aginPswd.equals("")){
			message+="<li>确认密码 <b>有误</b></li>";
			mark=false;
		}
		if(blogName==null||blogName.equals("")){
			message+="<li>博客名<b>为空</b></li>";
			mark=false;
		}
		if(userMotto==null||userMotto.equals("")){
			message+="<li>个性签名<b>为空</b></li>";
			mark=false;
		}
		
		if(mark){													
			if(!userPswd.equals(aginPswd)){
				message="<li>请输入密码</li>";
				mark=false;
			}
		}
		if(mark){													
			if(userOicq!=null&&!userOicq.equals("")){
				try{
					Long.parseLong(userOicq);
				}catch(NumberFormatException e){
					message="<li><b>QQ</b>有误</li>";
					e.printStackTrace();
				}
			}
			if(userEmail!=null&&!userEmail.equals("")){
				String emailRegex="\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
				if(!userEmail.matches(emailRegex))
					message+="<li> 输入的<b>E-mail</b> 有误</li>";
			}
		}
		return message;
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=1*1024*1024;						
		int len=upfile.getSize();
		if(len==0)
			message="<li>请重新上传！</li>";
		else if(len>maxLen)
			message="<li>上传文件过大！</li>";
		return message;
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
