package com.ssm.service.impl;

import com.ssm.dao.MenuDao;
import com.ssm.entity.Menu;
import com.ssm.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Resource(name = "menuDao")
    MenuDao menuDao;

    @Override
    public List<Menu> getMenu(Integer userId) {
        return menuDao.getMenu(userId);
    }
}
