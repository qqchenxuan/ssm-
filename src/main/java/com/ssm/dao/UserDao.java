package com.ssm.dao;

import org.springframework.stereotype.Repository;
import com.ssm.entity.User;

import java.awt.*;


@Repository("userDao")
public interface UserDao {
	
	//根据用户的身份和密码 进行认证，如果认证通过，返回用户身份信息
	User checkLogin(User user);

	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	List<User>  selectAllUserr();

	List<User>  selecteUserPage(Map map);



	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKeyWithBLOBs(User record);

	int updateByPrimaryKey(User record);
}
