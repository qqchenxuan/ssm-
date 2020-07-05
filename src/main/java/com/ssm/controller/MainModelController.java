package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.MainModel;
import com.ssm.service.MainModelService;
import com.ssm.util.PageData;
import com.ssm.util.PageUtil;

@Controller
public class MainModelController {
	@Resource(name = "mainModelService")
	private MainModelService mainModelService;
	
		public List<PageData> getmodel(HttpServletRequest request)throws Exception {
			String co_no = request.getParameter("co_no");
			String co_strarttime = request.getParameter("co_strarttime");
			String co_endtime = request.getParameter("co_endtime");
			List<MainModel> list = mainModelService.selectOrderManagement();
			List<String> realListcono =new ArrayList<String>();
			List<String> realListstart =new ArrayList<String>();
			List<String> realListend =new ArrayList<String>();
			List<String> listcono = mainModelService.selectAllOrCoNo();
			if (co_no == null || co_no.equals("")) {
		         if(co_strarttime==null||co_strarttime.equals("")){
		         }else{
		        	 for (String string : listcono) {
		 				if(string.contains(co_strarttime)){
		 					realListstart.add(string);
		 				}
		 			}
		        	 listcono = realListstart;
		        	 
		        	 if(co_endtime==null||co_endtime.equals("")){
		        		 
		        	 }else{
		        		 for(String string :listcono){
		 					if(string.contains(co_endtime)){
		 						realListend.add(string);
		 					}
		 				}
		 				listcono=realListend;
		        	 }
		         }
              
		} else {
			for (String string : listcono) {
				if (string.contains(co_no)) {
					realListcono.add(string);
				}
			}
			listcono = realListcono;

		   if (co_strarttime==null||co_strarttime.equals("")) {
			   
		   }else{
			   for (String string : listcono) {
				if(string.contains(co_strarttime)){
					realListstart.add(string);
				}
			}
			   
			   listcono =realListstart;
			if(co_endtime==null||co_endtime.equals("")){
				
			}else{
				for(String string :listcono){
					if(string.contains(co_endtime)){
						realListend.add(string);
					}
				}
				listcono=realListend;
			}
		   }
		}
		List<MainModel> listResult = null;
		PageData mapdata = new PageData();
		List<PageData> listPd = new ArrayList<PageData>();
		String[] strArrNoSeatType = new String[] { "40靠背", "后坐垫", "60靠背", "后排中央扶手", "后排中央头枕", "40侧头枕", "60侧头枕" };
		String[] strArrHasSeatType = new String[] { "坐垫面套", "坐垫骨架", "靠背面套", "靠背骨架", "线束", "大背板" };

		for (String string : listcono) {
			PageData pageData = new PageData();
			MainModel get12col = mainModelService.selectByCoNo(string);
			pageData.put("车身号", get12col.getCo_no());
			pageData.put("车型", get12col.getAll_no());
			pageData.put("序号", listcono.indexOf(string));

			for (int i = 0; i < strArrHasSeatType.length; i++) {
				boolean for1 = true;
				boolean for2 = true;
				for (MainModel om : list) {
					if (om.getCo_no().equals(string) && om.getBom_descCH().equals(strArrHasSeatType[i])
							&& om.getSeat().equals("主驾") && for1) {
						pageData.put(om.getBom_descCH() + "主驾",
								om.getBom_PN() != null && !om.getBom_PN().equals("") ? om.getBom_PN() : "空");
						// TODO 添加对前台颜色的值
						for1 = false;
					} else if (om.getCo_no().equals(string) && om.getBom_descCH().equals(strArrHasSeatType[i])
							&& om.getSeat().equals("副驾") && for2) {
						// TODO 添加对前台颜色的值
						pageData.put(om.getBom_descCH() + "副驾",
								om.getBom_PN() != null && !om.getBom_PN().equals("") ? om.getBom_PN() : "空");
						for2 = false;
					}
				}
				if (for1) {
					pageData.put(strArrHasSeatType[i] + "主驾", "空");
				}
				if (for2) {
					pageData.put(strArrHasSeatType[i] + "副驾", "空");
				}
			}
			for (int i = 0; i < strArrNoSeatType.length; i++) {
				boolean for3 = true;
				for (MainModel om : list) {
					if (om.getCo_no().equals(string)
							&& om.getBom_descCH().equals(strArrNoSeatType[i].replace("_", ""))) {
						// TODO 添加对前台颜色的值
						pageData.put(strArrNoSeatType[i],
								om.getBom_PN() != null && !om.getBom_PN().equals("") ? om.getBom_PN() : "空");
						for3 = false;
					}
				}
				if (for3) {
					pageData.put(strArrNoSeatType[i], "空");
				}
			}
			listPd.add(pageData);
		}
		return listPd;
	}
		

		
		@RequestMapping(value="/mainModel")
		public ModelAndView ordermanagementlist(String page, String pageSize, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			try {
				PageData pd = new PageData();
				int count = 0;
				PageUtil pageUtil = new PageUtil();
				if (page == null || page.equals("")) {
					page = "1";
				}
				if (pageSize == null || pageSize.equals("")) {
					pageSize = "5";
				}
				List<PageData> list1 = pageUtil.getList(getmodel(request), Integer.parseInt(page),Integer.parseInt(pageSize));
				count = (int) Math.ceil((double) (getmodel(request)).size()/Integer.parseInt(pageSize));
				pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				mv.addObject("list", list1);
				mv.addObject("pd", pd);
				pd.put("url", "mainmodel");
				mv.setViewName("mainmodel/mainmodel");
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "error");
			}
			return mv;
		}
	
		// 跳转到添加界面
		@RequestMapping(value = "/printOne")
		public ModelAndView printOne(HttpServletRequest request, String page, String pageSize, String para) {
			ModelAndView model = new ModelAndView();
			PageData pdpara = new PageData();

			try {
				List<MainModel> list = mainModelService.selectOrderManagement();
				List<MainModel> listre = new ArrayList<MainModel>();
				PageData pd = new PageData();
				int count = 0;
				PageUtil pageUtil = new PageUtil();

				if (page == null || page.equals("")) {
					page = "1";
				}
				if (pageSize == null || pageSize.equals("")) {
					pageSize = "5";
				}
				for (MainModel mainModel : list) {
					if (mainModel.getBom_descCH().equals(para)) {
						listre.add(mainModel);
					}
				}

				List<PageData> listResult = new ArrayList<PageData>();
				for (MainModel mainModel : listre) {
					PageData pd1 = new PageData();
					pd1.put("csh", mainModel.getCo_no());
					pd1.put("cx", mainModel.getAll_no());
					pd1.put("zfj", mainModel.getSeat());
					pd1.put("ljh", mainModel.getBom_PN());
					pd1.put("ljhms", mainModel.getBom_descCH());
					pd1.put("xh", listre.indexOf(mainModel));
					pd1.put("sl", "1");
					listResult.add(pd1);
				}
				String[] paras = { "坐垫面套", "坐垫骨架", "靠背面套", "靠背骨架", "线束", "大背板" };
				boolean isseat = false;
				for (int i = 0; i < paras.length; i++) {
					if (paras[i].equals(para)) {
						isseat = true;
					}
				}

				String eCode = "1234567890987";
				List<PageData> list1 = pageUtil.getList(listResult, Integer.parseInt(page), Integer.parseInt(pageSize));
				count = (int) Math.ceil(listResult.size() / Double.parseDouble(pageSize));

				pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				pd.put("url", "printOne?para="+para);
				model.addObject("eCode", eCode);
				model.addObject("isseat", isseat);
				model.addObject("list1", list1);
				model.addObject("pd", pd);
				model.addObject("para", para);
				model.setViewName("mainmodel/printone");
			} catch (Exception e) {
				e.printStackTrace();
				model.addObject("msg", "error");
			}
			return model;
		}
		
		
		// 模糊查询(车身号)
		@RequestMapping(value = "/searchOrder")

		public ModelAndView searchOrder(String page, String pageSize,HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			try {
				PageData pd = new PageData();
				int count = 0;
				PageUtil pageUtil = new PageUtil();
				if (page == null || page.equals("")) {
					page = "1";
				}
				if (pageSize == null || pageSize.equals("")) {
					pageSize = "5";
				}
			
				List<PageData> list2 = pageUtil.getList(getmodel(request), Integer.parseInt(page),
						Integer.parseInt(pageSize));
				count = (int) Math.ceil(getmodel(request).size() / Double.parseDouble(pageSize));

				pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				mv.addObject("list", list2);
				mv.addObject("pd", pd);

				mv.setViewName("mainmodel/mainmodel");
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "error");
			}
			return mv;
		}

		
		@RequestMapping("/toadd")
		public ModelAndView turnOrderManagement(){
			ModelAndView model = new ModelAndView("mainmodel/mainmodel_add");
			return model;
		}
		
		//单个打印
		@RequestMapping(value = "/printRow")
		public ModelAndView printRow(String para,Integer page, Integer pageSize) throws Exception {
			ModelAndView model = new ModelAndView();
			PageData pdpara = new PageData();
			try {
				List<MainModel> list = mainModelService.findMainModelList(para,page,pageSize);
				PageData pd = new PageData();
				int count = 0;
				List<PageData> listResult = new ArrayList<PageData>();
				for (MainModel mainModel : list) {
					String bom = mainModel.getSeat();
					PageData pd1 = new PageData();
					pd1.put("xh", list.indexOf(mainModel));
					pd1.put("ljh", mainModel.getBom_PN());
					if (bom.equals("主驾")) {
						pd1.put("ljhms", mainModel.getBom_descCH() + "主驾");
					} else if (bom.equals("副驾")) {
						pd1.put("ljhms", mainModel.getBom_descCH() + "副驾");
					} else {
						pd1.put("ljhms", mainModel.getBom_descCH() + "（不区分主副驾）");
					}
					pd1.put("sl", "1");
					pd1.put("csh", mainModel.getCo_no());
					pd1.put("cx", mainModel.getAll_no());
					listResult.add(pd1);
				}
				count = (int) Math.ceil(listResult.size() / (double)pageSize);
				pd.put("page", page);
				pd.put("pageSize", pageSize);
				pd.put("count", count);
				pd.put("url", "printRow?para="+para);
				model.addObject("list1", list);
				model.addObject("pd", pd);
				model.addObject("para",para);
				model.setViewName("mainmodel/printrow");
			}
			catch (Exception e) {
				e.printStackTrace();
				model.addObject("msg", "error");
			}
			return model;
		}
}

