package com.ssm.controller;



import java.sql.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.HandTerminal;
import com.ssm.service.HandTerminalService;
import com.ssm.util.PageData;
import com.ssm.util.PageUtil;



@Controller
public class HandTerminalController {
	
	@Autowired
	private HandTerminalService handTerminalService;
	
	
	public ModelAndView pageList(HandTerminal handterminal,Integer page,Integer pageSize){
		ModelAndView model=new ModelAndView();
		try {
			List<HandTerminal> listPage=this.handTerminalService.getHandTerminalPage(page,pageSize);
			List<HandTerminal> listAll=this.handTerminalService.getHandTerminalList();
			 	PageData pd=new PageData();
				int count=0;count=(int) Math.ceil(listAll.size()/(double)pageSize);
			    pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				pd.put("url", "handterminal");
				model.addObject("list",listPage);
				model.addObject("pd",pd);
				model.setViewName("handterminal/handterminal"); 
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject("msg","error");
		}
		return model;
	}
	
	
	//手持端的列表
	@RequestMapping(value="/handterminal")
	public ModelAndView subjectSelect(HandTerminal handterminal,Integer page,Integer pageSize)
	{
		return this.pageList(handterminal, page, pageSize);
	}
	
	
	
	
/*	//查询所有
	@RequestMapping(value="/handterminal")
	public ModelAndView index(){
		ModelAndView model = new ModelAndView("handterminal");
		List<HandTerminal> list = handTerminalService.getHandTerminalList();
		for (HandTerminal handTerminal : list) {
		System.out.println(handTerminal);
		}
		model.addObject("list",list);
		return model;
	}*/
	//跳转到增加页
	@RequestMapping(value="/handterminalAdd")
	public ModelAndView turnHandterminalAdd(){
		ModelAndView model = new ModelAndView("handterminal/handterminal_add");
		return model;
	}
	//增加手持端
	@RequestMapping(value="/toAdd")
	public ModelAndView handterminalAdd(String SID,String SName,String ClientIP,String SAddTiem,String role,String SRamark) throws ParseException{
		int S_ID=Integer.parseInt(SID);
		
		
		java.sql.Date saddtiem=Date.valueOf(SAddTiem);
		System.out.println(saddtiem);
	
		
		HandTerminal handTerminal = new HandTerminal();
		
		handTerminal.setSID(S_ID);
		handTerminal.setSName(SName);
		handTerminal.setClientIP(ClientIP);
		handTerminal.setSAddTime(saddtiem);
		handTerminal.setSRole(role);
		handTerminal.setSRamark(SRamark);
		handTerminalService.addHandTerminal(handTerminal);
		Integer page=0;
		Integer pageSize=5;
		return this.pageList(handTerminal, page, pageSize);
		}
	//删除手持端
	@RequestMapping(value="/handterminaldelete")
	public ModelAndView handterminalDelete(String SID){
		int S_ID=Integer.parseInt(SID);
		ModelAndView model = new ModelAndView();
		/*handTerminalService.deleteHandTerminal(S_ID);
		ModelAndView model = new ModelAndView("handterminal/handterminal");
		List<HandTerminal> list = handTerminalService.getHandTerminalList();*/
		HandTerminal handTerminal = new HandTerminal();
		Integer page=0;
		Integer pageSize=5;
		return this.pageList(handTerminal, page, pageSize);

	}
	
	//跳转到修改页
	@RequestMapping(value="/toupdate")
	public ModelAndView turnHandterminalUpdate(String SID,String SName,String clientIP,String SAddTime,String SRole,String SRamark){
		ModelAndView model = new ModelAndView("handterminal/handterminaledit");
		//复选框的选中状态
		String[] rolesnew={"前排坐垫面套","前排靠背面套","前排坐垫骨架","前排靠背骨架","插单物料排序单","前排线束","前排大背板","后40靠背面套","后60靠背面套","后排坐垫面套","后60扶手","后60中头枕","后40侧头枕","后60侧头枕"};		
		Map<String,Object> map=new HashMap<String, Object>();
		for (int i = 0; i < rolesnew.length; i++) {
			map.put(rolesnew[i], SRole.contains(rolesnew[i])?"checked='checked'":"");
		}
		model.addObject("status",map);
		
		java.sql.Date saddtiem = Date.valueOf(SAddTime);
		int S_ID=Integer.parseInt(SID);
		HandTerminal handTerminal = new HandTerminal();
		handTerminal.setSID(S_ID);
		handTerminal.setSName(SName);
		handTerminal.setClientIP(clientIP);
		handTerminal.setSRole(SRole);
		handTerminal.setSRamark(SRamark);
		model.addObject("handterminal1",handTerminal);
		System.out.println(handTerminal);
		model.addObject("SAddTime",saddtiem);
	return model;
	}
	
	//进行修改
	@RequestMapping(value="/handterminalupdate")
	public ModelAndView handterminalupdate(String SID,String SName,String ClientIP,String SAddTiem,String role,String SRamark) throws ParseException{
		int S_ID=Integer.parseInt(SID);
		java.sql.Date saddtiem = Date.valueOf(SAddTiem);
		HandTerminal handTerminal = new HandTerminal();
		handTerminal.setSID(S_ID);
		handTerminal.setSName(SName);
		handTerminal.setClientIP(ClientIP);
		handTerminal.setSAddTime(saddtiem);
		handTerminal.setSRole(role);
		handTerminal.setSRamark(SRamark);
		handTerminalService.updateHandTerminal(handTerminal);
		Integer page=0;
		Integer pageSize=5;
		return this.pageList(handTerminal, page, pageSize);
	}

}
