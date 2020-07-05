package com.ssm.util;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class OnlineUserMap {
    public static List<HttpSession> sessionList=new ArrayList<HttpSession>();
    //存放用户session
    public List<HttpSession> getSession() {
        return sessionList;
    }
    public void setSession(List<HttpSession> session) {
        this.sessionList = session;
    }
    //添加用户session到容器
    public void addOnLine(HttpSession se){
        List<HttpSession> selist=this.getSession();
        selist.add(se);
        this.setSession(selist);
    }
    //从session容器中移除用户session
    public void removeOnLine(String seid){
        List<Integer> listIndex=new ArrayList<Integer>();
        for (HttpSession session:sessionList)
        {
            if(session.getId().equals(seid))
            {
                listIndex.add(sessionList.indexOf(session));
            }
        }
        for (int j = 0; j < listIndex.size(); j++) {
            sessionList.get(listIndex.get(j)).removeAttribute("curUser");
            sessionList.remove(listIndex.get(j));
        }
    }
}
