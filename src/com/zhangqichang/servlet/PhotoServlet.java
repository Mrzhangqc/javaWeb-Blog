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

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.zhangqichang.dao.PhotoDao;
import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.valueBean.PhotoSingle;
import com.zhangqichang.valueBean.UserSingle;

public class PhotoServlet extends HttpServlet {
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
		String goWhich="my/guest/photo?action=listShow";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("请求异常");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}

	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("singleShowPage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);				
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("请求异常");
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

		int whoid=logoner.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/admin/photo?action=adminList";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(whoid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("请求异常");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminSinglePage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);					
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("请求异常");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("upLoadPage"));
		
		String message="";
		HttpSession session=request.getSession();
		int whoid=((UserSingle)session.getAttribute("logoner")).getId();
		String type=request.getParameter("type");
		
		if("upload".equals(type)){												//上传
			try {
				SmartUpload myup=new SmartUpload();
				myup.initialize(this, request, response);
				myup.setAllowedFilesList("jpg,jpeg,gif");						//图片格式
				myup.upload();												
				File upfile=myup.getFiles().getFile(0);							
				
				message=validateUpLoad(upfile);									//验证信息
				if(message.equals("")){											//上传日期֤
					Date now=new Date();										
					String src=Change.getSerial(now)+"."+upfile.getFileExt();
					String info=myup.getRequest().getParameter("info");
					if(info==null||info.equals(""))
						info="描述信息为空！";
					String time=Change.dateTimeChange(now);
					
					Object[] params={whoid,src,info,time};
					PhotoDao photoDao=new PhotoDao();
					int i=photoDao.upLoad(params);
					if(i<=0)
						message="<li>未选择图片</li>";
					else{
						upfile.saveAs("images/photo/"+src,File.SAVEAS_VIRTUAL);					
						message="<li>上传成功！</li>";
					}					
				}				
			}catch(SecurityException e1){										
				message="<li>ֻ请选择格式为<b>jpg、jpeg、gif</b>的文件</li>";
				e1.printStackTrace();				
			}catch (SmartUploadException e2) {
				message="<li>上传出错</li>";		
				e2.printStackTrace();
			}catch(Exception e3){
				message="<li>上传出错</li>";	
				e3.printStackTrace();
			}			
		}
		else																	
			message="<li>请选择文件</li>";
		
		request.setAttribute("message",message);		
		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));

		PhotoDao photoDao=new PhotoDao();
		try{
			PhotoSingle single=new PhotoSingle();
			single=photoDao.getSinglePhoto(id);
			
			String photoName=single.getPhotoSrc();
			String photoPath=getServletContext().getRealPath("\\")+"images\\photo\\"+photoName;
			java.io.File delPhoto=new java.io.File(photoPath);
			boolean delete=delPhoto.delete();
			if(delete){															//�Ӵ�����ɾ��ͼƬ�ɹ�
				int i=photoDao.delete(id);
				if(i<=0){
					message="<li>删除操作异常！</li><br><a href='javascript:window.history.go(-1)'>【返回】</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
				else{
					message="<li>删除成功！</li>";
					forward="/my/admin/photo?action=adminList";
				}				
			}
			else{
				message="<li>服务异常！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}
		}catch(Exception e){
			e.printStackTrace();
			forward=getServletContext().getInitParameter("messagePage");
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=2*1024*1024;						//最大上传文件2M
		if(upfile.isMissing()){							
			message+="<li>请选择图片</li>";
		}
		else{
			int len=upfile.getSize();
			if(len==0)
				message="<li>上传文件有误！</li>";
			else if(len>maxLen)
				message="<li>文件过大</li>";
		}
		return message;
	}
}
