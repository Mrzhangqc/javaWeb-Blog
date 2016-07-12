package com.zhangqichang.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhangqichang.toolsBean.Change;
import com.zhangqichang.toolsBean.DB;
import com.zhangqichang.valueBean.MediaSingle;

public class MediaDao extends SuperDao{
	public List getDefaultMedia(int id) throws SQLException{
		String sql="select top 4 * from tb_media where media_whoId=? order by media_uptime desc";
		Object[] params={id};
		List list=getList(sql,params);
		List medialist=defaultDivide(list);
		return medialist;
	}
	/**
	 * 
	 */
	public List getListMedia(int id,String showPage,String goWhich) throws SQLException{
		List medialist=null;
		String sqlall="select * from tb_media where media_whoId=?";
		Object[] params={id};
		
		setPerR(12);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP==1)
			sql="SELECT TOP "+top1+" * FROM tb_media WHERE media_whoId=? ORDER BY media_uptime DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_media i WHERE (media_whoId = ?) AND (media_uptime < (SELECT MIN(media_uptime) FROM (SELECT TOP "+top2+" * FROM tb_media WHERE media_whoId = i.media_whoId ORDER BY media_uptime DESC) AS minv)) ORDER BY media_uptime DESC";
		
		List list=getList(sql,params);		
		medialist=divide(list);
		return medialist;			
	}
	/**
	 * 
	 */	
	public MediaSingle getSingleMedia(int id) throws SQLException{
		String sql="select * from tb_media where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			return (MediaSingle)list.get(0);
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
				MediaSingle single=new MediaSingle();
				single.setId(rs.getInt(1));
				single.setMediaWhoId(rs.getInt(2));
				single.setMediaTitle(rs.getString(3));
				single.setMediaSrc(rs.getString(4));
				single.setMediaPic(rs.getString(5));
				single.setMediaInfo(rs.getString(6));
				single.setMediaUptime(Change.dateTimeChange(rs.getTimestamp(7)));
				single.setLookCount(rs.getInt(8));
				single.setReviCount(getRevCount(single.getId()));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	/**
	 * 
	 */
	private int getRevCount(int id){
		int count=0;
		String sql="select count(id) from tb_mediaR where mediaR_rootId=?";
		Object[] params={id};
		
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		try {
			ResultSet rs = mydb.getRs();
			if(rs!=null&&rs.next())
				count=rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mydb.closed();
		return count;
	}
	/**
	 * 
	 */
	public void setLookCount(int id) throws SQLException{
		String sql="update tb_media set media_lookCount=media_lookCount+1 where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	/**
	 *
	 */
	private List divide(List list){
		List medialist=null;
		if(list!=null){
			medialist=new ArrayList();
			/* �����Ȳ��볤�� */
			int blank=12-list.size();			
			if(blank>0){						
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
			/* ��Ȼ����л��� */
			for(int i=0;i<3;i++){				//ƽ��ֳ�3��
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			
					temp.add(list.get(4*i+j));
				}
				medialist.add(temp);			
			}			
		}
		return medialist;
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
	 * 
	 * @throws SQLException
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_media where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	/**
	 * 
	 * @throws SQLException
	 */
	public int upLoad(Object[] params) throws SQLException{
		String sql="insert into tb_media values(?,?,?,?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
}
