package com.zhangqichang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhangqichang.dao.ArtReviewDao;
import com.zhangqichang.dao.ArticleDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.ArticleSingle;
import com.zhangqichang.valueBean.UserSingle;

public class ArticleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("listShow".equals(action))
			doListShow(request,response);
		else if("singleShow".equals(action))
			doSingleShow(request,response);
		else if("adminList".equals(action))
			doAdminList(request,response);
		else if("adminSingle".equals(action))
			doAdminSingle(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("modify".equals(action))
			doModify(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}
	protected void doListShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("listShowPage"));
		HttpSession session=request.getSession();
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");
		int userid=callMaster.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/guest/article?action=listShow";		
		List articleList=null;
		ArticleDao articleDao=new ArticleDao();		
		try {
			articleList=articleDao.getListArticle(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��ȡ�����б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("articlelist",articleList);
		request.setAttribute("createPage",articleDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("singleShowPage"));
		try {
			ArticleDao articleDao=new ArticleDao();
			int id=Change.strToInt(request.getParameter("id"));
			articleDao.setArtCount(id);									// �����µķ��ʴ���ӣ�
			ArticleSingle single=articleDao.getSingleArticle(id);		// ��ȡ���µ���ϸ����				
			/* ��ȡ�����µ����µ�ǰn������ */
			ArtReviewDao artrDao=new ArtReviewDao();
			List artrlist=artrDao.getNewReviewList(id);
			
			/* ����Ҫ�Ķ������¡����µ����ۼ������۽��з�ҳ���� */
			request.setAttribute("articlesingle",single);
			request.setAttribute("artrlist",artrlist);
		} catch (Exception e) {
			System.out.println("��ȡ������ϸ����ʧ�ܣ�");
			e.printStackTrace();
		}
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");
		int userid=logoner.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/admin/article?action=adminList";		
		List articleList=null;
		ArticleDao articleDao=new ArticleDao();		
		try {
			articleList=articleDao.getListArticle(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��̨����ȡ�����б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("articlelist",articleList);
		request.setAttribute("createPage",articleDao.getPage());		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminSinglePage"));
		try {
			ArticleDao articleDao=new ArticleDao();
			int id=Change.strToInt(request.getParameter("id"));
			ArticleSingle single=articleDao.getSingleArticle(id);		// ��ȡ���µ���ϸ����					
			/* ��ȡ�����µ����µ�ǰn������ */
			ArtReviewDao artrDao=new ArtReviewDao();
			List artrlist=artrDao.getNewReviewList(id);			
			/* ����Ҫ�Ķ������¡����µ����ۼ������۽��з�ҳ���� */
			request.setAttribute("articlesingle",single);
			request.setAttribute("artrlist",artrlist);
		} catch (Exception e) {
			System.out.println("��̨����ȡ������ϸ����ʧ�ܣ�");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("insertShowPage"));
		String message="";
		String forward=getServletContext().getInitParameter("adminTemp");
		HttpSession session=request.getSession();
		ArticleDao articleDao=new ArticleDao();
		String type=request.getParameter("type");
		if("add".equals(type)){										//ͨ������������¡��ύ��ť����������
			message=validateAtticle(request);						//���б?��֤
			if("".equals(message)){									//�?��֤�ɹ�
				int whoId=((UserSingle)session.getAttribute("logoner")).getId();
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				String time=Change.dateTimeChange(new Date());
				int count=0;				
				Object[] params={whoId,title,content,time,count};				
				int i=0;
				try {
					i=articleDao.insert(params);
				} catch (SQLException e) {
					i=-1;
					e.printStackTrace();
				}
				if(i<=0)
					message="<li>��������ʧ�ܣ�</li>";
				else{
					message="<li>�������³ɹ���</li>";
					forward="/my/admin/article?action=adminList";
				}
			}
		}		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doModify(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		ArticleDao articleDao=new ArticleDao();
		int id=Change.strToInt(request.getParameter("id"));
		String type=request.getParameter("type");
		if("update".equals(type)){									//ͨ������޸����¡��ύ��ť����������
			message=validateAtticle(request);						//���б?��֤
			if("".equals(message)){									//�?��֤�ɹ�
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				Object[] params={title,content,id};				
				int i=0;
				try {
					i=articleDao.modify(params);
				} catch (SQLException e) {
					i=-1;
					e.printStackTrace();
				}
				if(i<=0){
					message="<li>服务异常</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
				else{
					message="<li>修改成功！</li>";
					forward="/my/admin/article?action=adminSingle&id="+id;
				}
			}
			else{													//�?��֤ʧ��
				message+="<a href='javascript:window.history.go(-1)'>【返回】</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}
		}
		else{														//ͨ���"�޸�����"�����Ӵ���������
			request.setAttribute("mainPage",getInitParameter("modifyShowPage"));
			ArticleSingle single=null;
			try {
				single=articleDao.getSingleArticle(id);
			} catch (SQLException e) {				
				e.printStackTrace();
			}
			if(single==null){
				message="<li>内容为空</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				forward=this.getServletContext().getInitParameter("messagePage");
			}
			else{
				request.setAttribute("articlesingle",single);
				forward=getServletContext().getInitParameter("adminTemp");
			}
		}		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		ArticleDao articleDao=new ArticleDao();
		int i=0;
		try {
			i=articleDao.delete(id);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>无需删除！</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
			forward=getServletContext().getInitParameter("messagePage");			
		}
		else{
			message="<li>成功删除！</li>";
			forward="/my/admin/article?action=adminList";
		}		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	private String validateAtticle(HttpServletRequest request){
		String message="";
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		if(title==null||title.equals(""))
			message+="<li>标题 <b>不能为空</b></li>";
		if(content==null||content.equals(""))
			message+="<li>内容<b>不能为空</b></li>";
		return message;
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="<li>����ʵ�ҳ�����ڣ�</li>��<a href='javascript:window.history.go(-1)'>【返回】</a>";
		String forward=getServletContext().getInitParameter("messagePage");			
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
}
