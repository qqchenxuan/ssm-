package com.ssm.service;

import java.util.List;

import com.ssm.entity.HandTerminal;

public interface HandTerminalService {
	//查询所有
	public List<HandTerminal> getHandTerminalList(); 
	//增加
	public void addHandTerminal(HandTerminal handTerminal);
	//查询单个
	public void selectHandTerminalOne(int SID);
	//更新
	public void updateHandTerminal(HandTerminal handTerminal);
	//删除
	public void deleteHandTerminal(int SID);
	//查询单页
	public List<HandTerminal> getHandTerminalPage(int pageRow,int pageSize);


}
