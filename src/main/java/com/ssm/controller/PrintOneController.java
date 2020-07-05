package com.ssm.controller;

import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.entity.MainModel;
import com.ssm.service.MainModelService;



@Controller
public class PrintOneController {
	@Autowired		
	private MainModelService mainModelService;
	
	@RequestMapping("/printmaterial")
	public String printOne(Model model,String para){
		List<MainModel> list = mainModelService.selectOrderManagement();
		 // 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("物料信息表一");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("序号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);
        cell.setCellValue("车身号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);
        cell.setCellValue("车型");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);
        cell.setCellValue("零件号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 4);
        cell.setCellValue("数量");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 5);
        int i=0;
        for (MainModel mainModel : list) {
        	if (mainModel.getBom_descCH().equals(para)) {
        	i=i+1;
        	row = sheet.createRow((int) i);
        	row.createCell((short) 0).setCellValue((int) i); 
        	row.createCell((short) 1).setCellValue( mainModel.getCo_no());
        	row.createCell((short) 2).setCellValue( mainModel.getAll_no());
        	row.createCell((short) 3).setCellValue( mainModel.getBom_PN());
        	row.createCell((short) 4).setCellValue((int) 1);
        	
        	}
		}
        try  
        {  
            FileOutputStream fout = new FileOutputStream("E:/打印信息/"+para+".xls");  
            wb.write(fout);  
            fout.close();  
            System.out.println("成功");
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }
		return "printsuccess";
	}
}
