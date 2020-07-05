package com.ssm.listener;

import com.ssm.util.OnlineUserMap;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginListener implements HttpSessionAttributeListener,HttpSessionListener {
    //session添加属性时触发，调用添加方法，将登录信息添加至在线列表
    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        String username = httpSessionBindingEvent.getName();
        if (username == "curUser")
        {
            new OnlineUserMap().addOnLine(httpSessionBindingEvent.getSession());
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    }

/*session移除属性时触发，调用移除方法，将保存上次登录信息的session从容器中移除*/
    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        String sessionid = httpSessionEvent.getSession().getId();
        new  OnlineUserMap().removeOnLine(sessionid);
    }
}
