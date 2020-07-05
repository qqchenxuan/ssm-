package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.HandTerminalDao;
import com.ssm.entity.HandTerminal;
import com.ssm.service.HandTerminalService;
@Service
public class HandTerminalServiceImpl implements HandTerminalService{

	@Autowired
	private HandTerminalDao handTerminalDao;
	
	@Override
	public List<HandTerminal> getHandTerminalList() {
		return handTerminalDao.getHandTerminalList();
	}

	@Override
	public void addHandTerminal(HandTerminal handTerminal) {
		handTerminalDao.addHandTerminal(handTerminal);
	}

	@Override
	public void updateHandTerminal(HandTerminal handTerminal) {
		handTerminalDao.updateHandTerminal(handTerminal);
	}

	@Override
	public void deleteHandTerminal(int SID) {
		handTerminalDao.deleteHandTerminal(SID);
	}

	@Override
	public List<HandTerminal> getHandTerminalPage(int pageIndex, int pageSize) {
		Map<String,Object> map=new HashMap<>();
		map.put("pageRow",pageIndex*pageSize);
		map.put("pageSize",pageSize);
		return handTerminalDao.getHandTerminalPage(map);
	}

	@Override
	public void selectHandTerminalOne(int SID) {
		handTerminalDao.selectHandTerminalOne(SID);
	}
	

	
}
