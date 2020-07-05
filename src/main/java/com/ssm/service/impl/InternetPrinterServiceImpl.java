package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssm.dao.InternetPrinterDao;
import com.ssm.entity.InternetPrinter;
import com.ssm.service.InternetPrinterService;

import javax.annotation.Resource;

@Service("internetPrinterService")
public class InternetPrinterServiceImpl implements InternetPrinterService{

	@Resource(name = "internetPrinterDao")
	private InternetPrinterDao internetPrinterDao;
	
	@Override
	public List<InternetPrinter> selectInternetPrinter() {
		return internetPrinterDao.selectInternetPrinter();
	}

	@Override
	public void selectInternetPrinterOne(int IID) {
		internetPrinterDao.selectInternetPrinterOne(IID);
		
	}

	@Override
	public void insertInternetPrinter(InternetPrinter internetprinter) {
		internetPrinterDao.insertInternetPrinter(internetprinter);
		
	}

	@Override
	public void updateInternetPrinter(InternetPrinter internetprinter) {
		internetPrinterDao.updateInternetPrinter(internetprinter);
	}

	@Override
	public void deleteInternetPrinter(int IID) {
		internetPrinterDao.deleteInternetPrinter(IID);
		
	}

	public List<InternetPrinter> getInternetPrinterPage(int pageIndex, int pageSize){
		Map<String,Object> map=new HashMap<>();
		map.put("pageRow",pageIndex*pageSize);
		map.put("pageSize",pageSize);
		return internetPrinterDao.getInternetPrinterPage(map);
	};
}
