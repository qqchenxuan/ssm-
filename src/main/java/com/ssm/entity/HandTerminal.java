package com.ssm.entity;

import java.sql.Date;

public class HandTerminal {
	private int SID;
	private String SName;
	private String ClientIP;
	private Date SAddTiem;
	private String SRole;
	private String SRamark;
	
	public int getSID() {
		return SID;
	}
	public void setSID(int sID) {
		SID = sID;
	}
	public String getSName() {
		return SName;
	}
	public void setSName(String sName) {
		SName = sName;
	}
	public String getClientIP() {
		return ClientIP;
	}
	public void setClientIP(String clientIP) {
		ClientIP = clientIP;
	}
	public Date getSAddTime() {
		return SAddTiem;
	}
	public void setSAddTime(Date sAddTime) {
		SAddTiem = sAddTime;
	}
	public String getSRole() {
		return SRole;
	}
	public void setSRole(String sRole) {
		SRole = sRole;
	}
	public String getSRamark() {
		return SRamark;
	}
	public void setSRamark(String sRamark) {
		SRamark = sRamark;
	}

}
