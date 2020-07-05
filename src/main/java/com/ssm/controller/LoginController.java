package com.ssm.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ssm.entity.Menu;
import com.ssm.entity.User;
import com.ssm.service.MenuService;
import com.ssm.service.UserService;
import com.ssm.util.OnlineUserMap;
import com.ssm.util.checkMulitLogin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class LoginController {

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "menuService")
    private MenuService menuService;

    //用户登陆提交方法
    @RequestMapping("/index")
    public String index(Model model) throws Exception {
        return "index";
    }

    //用户登陆提交方法
    @RequestMapping("/toLogin")
    public String loginview(Model model) throws Exception {
        return "login";
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Object login(HttpServletRequest request, String username, String password) {
        Map<String, Object> result = new HashMap<String, Object>();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        if (username != null && password != null) {
            User appUser = this.userService.checkLogin(user);
            if (appUser != null) {
                try {
                    //重复登录验证
                    new checkMulitLogin().checkSuccess(appUser.getId());
                    result.put("isok", true);
                    //保存当前登录信息到session
                    request.getSession().setAttribute("curUser", appUser);
                } catch (Exception e) {
                    result.put("isok", false);
                    result.put("errorInfo", "强制下线失败");
                }
            }else {
                result.put("isok", false);
                result.put("errorInfo", "用户名密码输入错误!");
            }
        }
        return result;
    }


    //用户退出
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        List<HttpSession> list = new OnlineUserMap().getSession();
        int index = new OnlineUserMap().getSession().indexOf(session);
        new OnlineUserMap().removeOnLine(list.get(index).getId());
        return "login";
    }

    @RequestMapping("/getMenu")
    @ResponseBody
    public Map<String,Object> getMenu(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User curUser=(User)session.getAttribute("curUser");
        int id=curUser.getId();
        List<Menu> menus= menuService.getMenu(id);
        Map<String,Object> map=new HashMap<>();
        map.put("result",menus);
        return map;
    }
}
