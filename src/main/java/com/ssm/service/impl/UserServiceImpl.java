package com.ssm.service.impl;

import com.ssm.dao.UserDao;
import com.ssm.service.UserService;
import org.springframework.stereotype.Service;
import com.ssm.entity.User;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * <p>Title: SysServiceImpl</p>
 * <p>Description:认证和授权的服务接口 </p>
 * <p>Company: www.itcast.com</p> 
 * @author	传智.燕青
 * @date	2015-3-23上午11:31:43
 * @version 1.0
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDao")
	UserDao userDao;
	@Override
	public User checkLogin(User user){
		return userDao.checkLogin(user);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return userDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(User record) {
		return userDao.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		return userDao.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		return userDao.selectByPrimaryKey(id);
	}

	public List<User>  selectAllUser(){
		return userDao.selectAllUser();
	}

	public List<User> selectUserPage(int page,int pageSize){


		Map<String,Object> map=new HashMap<>();
		map.put("pageRow",pageIndex&pageSize);
		map.put("pageSize",pageSize);

		return userDao.selectUserPage(map);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		return userDao.updateByPrimaryKey(record);
	}
}
