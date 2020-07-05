package com.ssm.dao;

import com.ssm.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("menuDao")
public interface MenuDao {
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