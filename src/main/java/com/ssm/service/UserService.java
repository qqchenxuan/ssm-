package com.ssm.service;

import java.util.List;
import com.ssm.entity.User;
import org.springframework.stereotype.Service;

@Service("userservice")
public interface UserService {

	//根据用户的身份和密码 进行认证，如果认证通过，返回用户身份信息
	public User checkLogin(User user);

	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	List<User>  selectAllUser();

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	List<User> selsectUserPage(int  page,int pageSize);
}
