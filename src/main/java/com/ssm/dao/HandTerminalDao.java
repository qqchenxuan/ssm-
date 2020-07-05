package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssm.entity.HandTerminal;


@Repository("HandTerminalDao")
public interface HandTerminalDao {
	//查询所有
	public List<HandTerminal> getHandTerminalList(); 
	//查询单个
	public void selectHandTerminalOne(int SID);
	//增加
	public void addHandTerminal(HandTerminal handTerminal);
	//更新
	public void updateHandTerminal(HandTerminal handTerminal);
	//删除
	public void deleteHandTerminal(int SID);

	public List<HandTerminal> getHandTerminalPage(Map<String,Object> map);
}
