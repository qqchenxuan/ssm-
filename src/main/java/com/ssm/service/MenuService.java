package com.ssm.service;

import com.ssm.entity.Menu;
import org.springframework.stereotype.Service;

import java.util.List;


public interface MenuService {
//    int deleteByPrimaryKey(Integer menuId);
//
//    int insert(Menu record);
//
//    int insertSelective(Menu record);
//
//    Menu selectByPrimaryKey(Integer menuId);
//
//    int updateByPrimaryKeySelective(Menu record);
//
//    int updateByPrimaryKey(Menu record);

     List<Menu> getMenu(Integer userId);
}