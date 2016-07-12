package com.zhangqichang.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.toolsBean.DB;
import com.zhangqichang.valueBean.PhotoSingle;

public class PhotoDao extends SuperDao {
	
	public List getDefaultPhoto(int id) throws SQLException{
		String sql="select top 4 * from tb_photo where photo_whoId=? order by photo_uptime desc";
		Object[] params={id};		
		List list=getList(sql,params);
		List photolist=defaultDivide(list);
		return photolist;
	}
	
	public List getListPhoto(int id,String showPage,String goWhich) throws SQLException{
		List photolist=null;
		String sqlall="select * from tb_photo where photo_whoId=?";
		Object[] params={id};
		
		setPerR(12);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_photo WHERE photo_whoId=? ORDER BY photo_uptime DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_photo i WHERE (photo_whoId = ?) AND (photo_uptime < (SELECT MIN(photo_uptime) FROM (SELECT TOP "+top2+" * FROM tb_photo WHERE photo_whoId = i.photo_whoId ORDER BY photo_uptime DESC) AS minv)) ORDER BY photo_uptime DESC";
		List list=getList(sql,params);		
		photolist=divide(list);
		return photolist;			
	}
	/**
	 * 
	 */	
	public PhotoSingle getSinglePhoto(int id) throws SQLException{
		String sql="select * from tb_photo where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null)
			return (PhotoSingle)list.get(0);
		else
			return null;
	}	
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				PhotoSingle single=new PhotoSingle();
				single.setId(rs.getInt(1));
				single.setPhotoWhoId(rs.getInt(2));
				single.setPhotoSrc(rs.getString(3));
				single.setPhotoInfo(rs.getString(4));
				single.setPhotoUptime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	/**
	 *
	 */
	private List divide(List list){
		List photolist=null;
		if(list!=null){
			photolist=new ArrayList();
		
			int blank=12-list.size();			
			if(blank>0){						
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
		
			for(int i=0;i<3;i++){				
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			
					temp.add(list.get(4*i+j));
				}
				photolist.add(temp);			
			}			
		}
		return photolist;
	}
	private List defaultDivide(List list){
		if(list!=null){
			int blank=4-list.size();			
			if(blank>0){						
				for(int i=0;i<blank;i++)
					list.add(null);
			}					
		}
		return list;
	}
	/**
	 * @���ܣ�ɾ��ͼƬ
	 * @throws SQLException
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_photo where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	/**
	 * @���ܣ��ϴ�ͼƬ
	 * @throws SQLException
	 */
	public int upLoad(Object[] params) throws SQLException{
		String sql="insert into tb_photo values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
}
