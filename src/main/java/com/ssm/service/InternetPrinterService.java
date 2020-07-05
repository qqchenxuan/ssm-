package com.ssm.service;

import java.util.List;

import com.ssm.entity.InternetPrinter;
import org.springframework.stereotype.Service;


public interface UserService {
	//查询所有
	public List<InternetPrinter> selectInternetPrinter(); 
	//查询单个
	public void selectInternetPrinterOne(int IID);
	//增加
	public void insertInternetPrinter(InternetPrinter internetprinter);
	//更新
	public void updateInternetPrinter(InternetPrinter internetprinter);
	//删除
	public void deleteInternetPrinter(int IID);

	public List<InternetPrinter> getInternetPrinterPage(int pageIndex,int pageSize);

}
