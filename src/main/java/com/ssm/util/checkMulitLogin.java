package com.ssm.util;

import com.ssm.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public class checkMulitLogin {
    public void checkSuccess(int id) throws Exception{
        List<HttpSession> list = new OnlineUserMap().getSession();
        int index=-1;
        for (HttpSession session:list) {
            if (((User)session.getAttribute("curUser")).getId()==id)
            {
                index=new OnlineUserMap().getSession().indexOf(session);
            }
        }
        if (index!=-1)
            new OnlineUserMap().removeOnLine(list.get(index).getId());
    }
}
