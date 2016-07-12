package com.zhangqichang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhangqichang.dao.ArticleDao;
import com.zhangqichang.dao.ElectDao;
import com.zhangqichang.dao.FriendDao;
import com.zhangqichang.dao.LinkDao;
import com.zhangqichang.dao.MediaDao;
import com.zhangqichang.dao.PhotoDao;
import com.zhangqichang.dao.UserDao;
import com.zhangqichang.dao.WordDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.UserSingle;

public class BlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("defaultPage"));
		String forward="";
		
		try{
			UserDao userDao=new UserDao();
			int userid=Change.strToInt(request.getParameter("master"));
			
			userDao.setHitNum(userid);								//�����͵ĵ���ʼӣ�
			UserSingle master=userDao.getMasterSingle(userid);		//��ȡ������Ϣ
			
			if(master!=null){										//�����ʵ��û�����
				HttpSession session=request.getSession();
				session.setAttribute("callBlogMaster",master);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в��������ϴ���ǰ4����Ƶ */			
				List medialist=new ArrayList();
				MediaDao mediaDao=new MediaDao();
				medialist=mediaDao.getDefaultMedia(userid);
				request.setAttribute("medialist",medialist);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в��������ϴ���ǰnƪ���� */
				List articlelist=new ArrayList();
				ArticleDao articleDao=new ArticleDao();
				articlelist=articleDao.getDefaultArticle(userid);
				request.setAttribute("articlelist",articlelist);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в��������ϴ���ǰ4��ͼƬ */
				List photolist=new ArrayList();
				PhotoDao photoDao=new PhotoDao();
				photolist=photoDao.getDefaultPhoto(userid);
				request.setAttribute("photolist",photolist);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в���λ���ϵĲ����Ƽ����� */
				List electlist=new ArrayList();
				ElectDao electDao=new ElectDao();
				electlist=electDao.getDefaultElect(userid);
				session.setAttribute("electlist",electlist);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в���λ���ϵ�ǰ��λ�ҵĺ��� */
				List friendlist=new ArrayList();
				FriendDao friendDao=new FriendDao();
				friendlist=friendDao.getDefaultFriend(userid);
				session.setAttribute("friendlist",friendlist);
				
				/* ��ȡ��ʾ�ڸ�����ҳ�в���λ���ϵ��������� */
				List linklist=new ArrayList();
				LinkDao linkDao=new LinkDao();
				linklist=linkDao.getDefaultLink(userid);
				session.setAttribute("linklist",linklist);

				/* ��ȡ��ʾ�ڸ�����ҳ�в���λ���ϵĵ��������ǰ20��Ĳ��� */				
				List toplist=userDao.getTopList();
				session.setAttribute("toplist",toplist);				
				
				forward=this.getServletContext().getInitParameter("indexTemp");
			}
			else{							//�����ʵ��û�������		
				forward=this.getServletContext().getInitParameter("messagePage");
				String message="<li>�Բ��𣬷��ʵ��û������ڣ�</li>";
				request.setAttribute("message",message);
			}
		}catch(Exception e){
			forward=this.getServletContext().getInitParameter("messagePage");
			System.out.println("'��ȡ��ʾ����ҳ����Ϣ'ʧ�ܣ�");
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
}