package com.ssm.controller;

//import com.ssm.entity.InternetPrinter;
//import com.ssm.service.InternetPrinterService;
//import com.ssm.util.PageData;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.annotation.Resource;
//import java.text.ParseException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;


import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.InternetPrinter;
import com.ssm.service.InternetPrinterService;
import com.ssm.util.PageData;

import javax.annotation.Resource;



@Controller

public class UserManagerController {

    @Resource(name = "userService")
    private UserService userService;

    public ModelAndView pageList(InternetPrinter internetprinter, Integer page, Integer pageSize){
        ModelAndView model=new ModelAndView();
        try {
            //查询
            List<InternetPrinter> listAll=this.userService.selectInternetPrinter();
            List<InternetPrinter> listPage=this.userService.selectUserPage(page,pageSize);
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
    @RequestMapping(value = "/usermanager")
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
    public ModelAndView InternetPrinterAdd(String IID,String IName,String PrintIp,String IAddTiem,String role,String IRamark) throws ParseException {
        int I_ID=Integer.parseInt(IID);

        java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTiem);

        User user = new User();

        user.setId(I_ID);
        user.setRealname(IName);
        user.setUsername(userName);
        user.setPassword(passWord);
        user.setRole(role);
        user.setRemarks(TRamark);
        userService.insert(user);
        Integer page=0;
        Integer pageSize=5;
        return this.pageList(internetprinter, page, pageSize);
    }

    //删除网络配置
    @RequestMapping(value="/internetprinterdelete")
    public ModelAndView deleteInternetPrinter(String IID){
        int I_ID=Integer.parseInt(IID);
        userService.deleteInternetPrinter(I_ID);
        User user = new User();
        Integer page=0;
        Integer pageSize=5;
        return this.pageList(internetprinter, page, pageSize);
    }

    //跳转到修改页
    @RequestMapping(value="/turnupdate")
    public ModelAndView turnHandterminalUpdate(String IID,String IName,String printIP,String IAddTime,String IRole,String IRamark){
        ModelAndView model = new ModelAndView("InternetPrinter/internetprinteredit");

        //复选框的选中状态
        String[] rolesnew={};
        Map<String,Object> map=new HashMap<String, Object>();
        for (int i = 0; i < rolesnew.length; i++) {
            map.put(rolesnew[i], IRole.contains(rolesnew[i])?"checked='checked'":"");
        }
        model.addObject("status",map);


        java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTime);
        int I_ID=Integer.parseInt(IID);

        user.setId(I_ID);
        user.setRealname(IName);
        user.setUsername(PrintIp);
        user.setRole(role);
        user.setRemarks(TRamark);
        model.addObject("internetprinter1",internetprinter);
        System.out.println(internetprinter);
        model.addObject("IID",IID);
        model.addObject("IAddTime",iaddtiem);
        return model;
    }

    //修改网络配置
    @RequestMapping(value="/internetPrinterupdate")
    public ModelAndView internetPrinterupdate(String IID,String IName,String userName,String paseWord,String role,String IRamark)throws ParseException{
        int I_ID=Integer.parseInt(IID);

        java.sql.Date iaddtiem=java.sql.Date.valueOf(IAddTiem);

        InternetPrinter internetprinter = new InternetPrinter();

        user.setId(I_ID);
        user.setRealname(IName);
        user.setUsername(PrintIp);
        user.setPassword(passWord);
        user.setRole(TRole);
        user.setRemarks(TRamark);
        userService.updateInternetPrinter(user);
        Integer page=0;
        Integer pageSize=5;
        return this.pageList(internetprinter, page, pageSize);
    }
}

