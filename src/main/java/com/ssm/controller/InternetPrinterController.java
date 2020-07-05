package com.ssm.controller;


import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.InternetPrinter;
import com.ssm.service.InternetPrinterService;
import com.ssm.util.PageData;

import javax.annotation.Resource;


@Controller

public class InternetPrinterController {

	@Resource(name = "internetPrinterService")
	private InternetPrinterService internetPrinterService;

	public ModelAndView pageList(InternetPrinter internetprinter,Integer page,Integer pageSize){
		ModelAndView model=new ModelAndView();
		try {
			//查询
			List<InternetPrinter> listAll=this.internetPrinterService.selectInternetPrinter();
			List<InternetPrinter> listPage=this.internetPrinterService.getInternetPrinterPage(page,pageSize);
			 	PageData pd=new PageData();
				int count=(int) Math.ceil(listAll.size()/(double)pageSize);
			//	Math.floor()
				pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				pd.put("url", "internetprinter");
				model.addObject("list",listPage);
				model.addObject("pd",pd);
				model.setViewName("InternetPrinter/internetprinter"); 
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject("msg","error");
		}
		return model;		
	}


    //网络配置的列表
    @RequestMapping(value = "/internetprinter")
    public ModelAndView subjectSelect(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
    {

        int page=Integer.valueOf(httpServletRequest.getParameter("page"));
        int pageSize = Integer.valueOf(httpServletRequest.getParameter("pageSize"));


        InternetPrinter internetprinter= new InternetPrinter();
        return this.pageList(internetprinter, page, pageSize);
    }
	
	
	
	
	/*//查询所有
	@RequestMapping(value = "/internetPrinterlist")
	public ModelAndView internetPrinterlist(){
		ModelAndView model = new ModelAndView("internetprinter/internetprinter");
		List<InternetPrinter>list = internetPrinterService.selectInternetPrinter();
		for (InternetPrinter internetPrinter : list) {
			System.out.println(internetPrinter);
		}
		model.addObject("list",list);
		return model;
	}*/
	//跳转到增加页
	@RequestMapping(value="/turninternetPrinterAdd")
	public ModelAndView turnInternetPrinterAdd(){
		ModelAndView model = new ModelAndView("InternetPrinter/internetprinter_add");
		return model;
	}
	//增加网络配置
	@RequestMapping(value="/internetPrinterAdd")
	public ModelAndView InternetPrinterAdd(String IID,String IName,String PrintIp,String IAddTiem,String role,String IRamark) throws ParseException{
		int I_ID=Integer.parseInt(IID);
		
		java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTiem);
		
		InternetPrinter internetprinter = new InternetPrinter();
		
		internetprinter.setIID(I_ID);
		internetprinter.setIName(IName);
		internetprinter.setPrintIP(PrintIp);
		internetprinter.setIAddTime(iaddtiem);
		internetprinter.setIRole(role);
		internetprinter.setIRamark(IRamark);
		internetPrinterService.insertInternetPrinter(internetprinter);
		Integer page=0;
		Integer pageSize=5;
		return this.pageList(internetprinter, page, pageSize);
		}
	
	//删除网络配置
		@RequestMapping(value="/internetprinterdelete")
		public ModelAndView deleteInternetPrinter(String IID){
			int I_ID=Integer.parseInt(IID);
			internetPrinterService.deleteInternetPrinter(I_ID);
			InternetPrinter internetprinter = new InternetPrinter();
			Integer page=0;
			Integer pageSize=5;
			return this.pageList(internetprinter, page, pageSize);
		}
		
	//跳转到修改页	
		@RequestMapping(value="/turnupdate")
		public ModelAndView turnHandterminalUpdate(String IID,String IName,String printIP,String IAddTime,String IRole,String IRamark){
			ModelAndView model = new ModelAndView("InternetPrinter/internetprinteredit");
			
			//复选框的选中状态
			String[] rolesnew={"前排坐垫面套","前排靠背面套","前排坐垫骨架","前排靠背骨架","插单物料排序单","前排线束","前排大背板","后40靠背面套","后60靠背面套","后坐垫坐垫面套","后60扶手","后60中头枕","后40侧头枕","后60侧头枕"};		
			Map<String,Object> map=new HashMap<String, Object>();
			for (int i = 0; i < rolesnew.length; i++) {
				map.put(rolesnew[i], IRole.contains(rolesnew[i])?"checked='checked'":"");
			}
			model.addObject("status",map);
			
			
			java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTime);
			int I_ID=Integer.parseInt(IID);
			
			InternetPrinter internetprinter = new InternetPrinter();
			internetprinter.setIID(I_ID);
			internetprinter.setIName(IName);
			internetprinter.setPrintIP(printIP);
			internetprinter.setIAddTime(iaddtiem);
			internetprinter.setIRole(IRole);
			internetprinter.setIRamark(IRamark);
			model.addObject("internetprinter1",internetprinter);
			System.out.println(internetprinter);
			model.addObject("IID",IID);
			model.addObject("IAddTime",iaddtiem);
		return model;
		}
		
		//修改网络配置
		@RequestMapping(value="/internetPrinterupdate")
		public ModelAndView internetPrinterupdate(String IID,String IName,String PrintIp,String IAddTiem,String role,String IRamark)throws ParseException{
			int I_ID=Integer.parseInt(IID);
			
			java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTiem);
			
			InternetPrinter internetprinter = new InternetPrinter();
			
			internetprinter.setIID(I_ID);
			internetprinter.setIName(IName);
			internetprinter.setPrintIP(PrintIp);
			internetprinter.setIAddTime(iaddtiem);
			internetprinter.setIRole(role);
			internetprinter.setIRamark(IRamark);
			internetPrinterService.updateInternetPrinter(internetprinter);
			Integer page=0;
			Integer pageSize=5;
			return this.pageList(internetprinter, page, pageSize);
		}
}
