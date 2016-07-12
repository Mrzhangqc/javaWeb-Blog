package com.zhangqichang.toolsBean;

public class CreatePage {
	private int currentP;			
	private int allP;				
	private int allR;				
	private int perR;				
	private String pageLink;		
	private String pageInfo;		
	
	public CreatePage(){
		currentP=1;
		allP=1;
		allR=0;
		perR=3;
		pageLink="";
		pageInfo="";
	}
	
	
	public void setPerR(int perR){
		this.perR=perR;
	}
	

	public void setAllR(int allR){
		this.allR=allR;
	}
	
	public void setAllP(){
		allP=(allR%perR==0)?(allR/perR):(allR/perR+1);
	}
	
	
	public void setCurrentP(String currentP) {		
		if(currentP==null||currentP.equals(""))
			currentP="1";
		try{
			this.currentP=Integer.parseInt(currentP);
		}catch(NumberFormatException e){
			this.currentP=1;
			e.printStackTrace();
		}
		if(this.currentP<1)
			this.currentP=1;
		if(this.currentP>allP)
			this.currentP=allP;		
	}

	
	public void setPageInfo(){
		if(allP>=1){
			pageInfo="<table border='0' cellpadding='3'><tr><td>";
			pageInfo+="共"+perR+"/"+allR+"个显示";
			pageInfo+="&nbsp;&nbsp;&nbsp;&nbsp;";
			pageInfo+="当前共"+currentP+"/"+allP+" 页";
			pageInfo+="</td></tr></table>";			
		}				
	}
	
   
	public void setPageLink(String goWhich){
		if(goWhich==null)
			goWhich="";
		if(goWhich.indexOf("?")>=0)
			goWhich+="&";
		else
			goWhich+="?";
		if(allP>1){
			pageLink="<table border='0' cellpadding='3'><tr><td>";
			if(currentP>1){
				pageLink+="<a href='"+goWhich+"showPage=1'>��ҳ</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+(currentP-1)+"'>��һҳ</a>&nbsp;&nbsp;";
			}
			if(currentP<allP){
				pageLink+="<a href='"+goWhich+"showPage="+(currentP+1)+"'>��һҳ</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+allP+"'>βҳ</a>";
			}
			pageLink+="</td></tr></table>";			
		}		
	}
	
	
	
	public int getPerR(){
		return perR;
	}
	

	public int getAllR() {
		return allR;
	}	
	
 
	public int getAllP() {		
		return allP;
	}


	public int getCurrentP() {
		return currentP;
	}
	
	
	public String getPageInfo(){
		return pageInfo;
	}

	
	public String getPageLink(){
		return pageLink;
	}
}