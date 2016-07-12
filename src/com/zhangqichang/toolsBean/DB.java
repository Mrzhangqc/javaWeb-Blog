package com.zhangqichang.toolsBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	private Connection con;
	private PreparedStatement pstm;
	private String user="sa";
	private String password="111111";
	private String className="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url="jdbc:sqlserver://localhost:1433;DatabaseName=ZQCBlog";
	
	/** 建立链接 */
	public DB(){
		try{
			Class.forName(className);
		}catch(ClassNotFoundException e){
			System.out.println("服务异常！");
			e.printStackTrace();
		}
	}

	/**声明数据库*/
	public Connection getCon(){
		if(con==null){
			try {
				con=DriverManager.getConnection(url,user,password);
			} catch (SQLException e) {
				System.out.println("数据库异常！");
				con=null;
				e.printStackTrace();
			}			
		}
		return con;
	}
	
	/**
	 *@���ܣ�����ݿ��������ɾ���ġ������
	 *@����sqlΪSQL��䣻paramsΪObject���飬����洢����Ϊsql��ʾ��SQL�����"?"ռλ��ֵ����� 
	 */
	public void doPstm(String sql,Object[] params){
		if(sql!=null&&!sql.equals("")){
			if(params==null)
				params=new Object[0];			
			getCon();
			if(con!=null){
				try{		
					System.out.println(sql);
					pstm=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					for(int i=0;i<params.length;i++){
						pstm.setObject(i+1,params[i]);
					}
					pstm.execute();
				}catch(SQLException e){
					System.out.println("doPstm()�������?");
					e.printStackTrace();
				}				
			}			
		}
	}
	
	/**
	 * @���ܣ���ȡ����doPstm()����ִ�в�ѯ�����󷵻ص�ResultSet���
	 * @����ֵ��ResultSet
	 * @throws SQLException
	 */
	public ResultSet getRs() throws SQLException{
		return pstm.getResultSet();		
	}
	/**
	 * @���ܣ���ȡ����doPstm()����ִ�и��²����󷵻�Ӱ��ļ�¼��
	 * @����ֵ��int
	 * @throws SQLException
	 */
	public int getCount() throws SQLException{
		return pstm.getUpdateCount();		
	}
	/**
	 * @���ܣ��ͷ�PrepareStatement������Connection����
	 */
	public void closed(){
		try{
			if(pstm!=null)
				pstm.close();			
		}catch(SQLException e){
			System.out.println("�ر�pstm����ʧ�ܣ�");
			e.printStackTrace();
		}
		try{
			if(con!=null){
				con.close();
			}
		}catch(SQLException e){
			System.out.println("�ر�con����ʧ�ܣ�");
			e.printStackTrace();
		}
	}
}
