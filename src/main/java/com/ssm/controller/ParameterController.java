package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.Parameter;
import com.ssm.service.ParameterService;

import javax.annotation.Resource;

@Controller
public class ParameterController {
	@Resource(name = "parameterService")
	private ParameterService parameterService;
	
	//查询所有
		@RequestMapping(value = "/parameterlist")
		public ModelAndView Parameterlist(){
			ModelAndView model = new ModelAndView("parameter/parameter");
			List<Parameter>list = parameterService.selectParameter();
			model.addObject("list",list);
			return model;
		}	
		
		//跳转到修改页
	@RequestMapping(value="/turnparameterupdate")
	public ModelAndView turnHandterminalUpdate(String serialID,String name,String number){
		ModelAndView model = new ModelAndView("parameter/parameteredit");
		int serial_ID=Integer.parseInt(serialID);
		Parameter parameter = new Parameter();
		parameter.setName(name);
		parameter.setNumber(number);
		parameter.setSerialID(serial_ID);
		model.addObject("parameter1",parameter);
	return model;
	}
	@RequestMapping(value="/parameterupdate")
	public String handterminalupdate(String SerialID,String Name,String Number){
		int serial_ID=Integer.parseInt(SerialID);
		Parameter parameter = new Parameter();
		parameter.setName(Name);
		parameter.setNumber(Number);
		parameter.setSerialID(serial_ID);
		parameterService.updateParameter(parameter);
		return "redirect:/parameterlist";
	}
	@RequestMapping("move")
	public String move(Integer serialID,String direction) {
		Parameter paramThis=parameterService.selectParameterOne(serialID);
		Parameter paramTemp=new Parameter();
		Integer exchangeSID=0;
		Parameter paramExchange=new Parameter();
		if (direction.equals("up"))
		{
			exchangeSID=serialID-1;
			paramExchange=parameterService.selectParameterOne(exchangeSID);
		}else{
			exchangeSID=serialID+1;
			paramExchange=parameterService.selectParameterOne(exchangeSID);
		}
		if (paramExchange!=null){
			paramExchange.setSerialID(serialID);
			paramThis.setSerialID(exchangeSID);
		}
		parameterService.updateParameter(paramExchange);
		parameterService.updateParameter(paramThis);
		return "redirect:/parameterlist";
	}
}