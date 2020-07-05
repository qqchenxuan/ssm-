package com.ssm.entity;

import java.sql.Date;

public class InternetPrinter {
	
	private int IID;
	private String IName;
	private String PrintIP;
	private Date IAddTime;
	private String IRole;
	private String IRamark;
	  
	
	public int getIID() {
		return IID;
	}
	public void setIID(int iID) {
		IID = iID;
	}
	public String getIName() {
		return IName;
	}
	public void setIName(String iName) {
		IName = iName;
	}
	public String getPrintIP() {
		return PrintIP;
	}
	public void setPrintIP(String printIP) {
		PrintIP = printIP;
	}
	public Date getIAddTime() {
		return IAddTime;
	}
	public void setIAddTime(Date iAddTime) {
		IAddTime = iAddTime;
	}
	public String getIRole() {
		return IRole;
	}
	public void setIRole(String iRole) {
		IRole = iRole;
	}
	public String getIRamark() {
		return IRamark;
	}
	public void setIRamark(String iRamark) {
		IRamark = iRamark;
	}


}
