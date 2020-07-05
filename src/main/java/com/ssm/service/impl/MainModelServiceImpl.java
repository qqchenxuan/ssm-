package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.MainModelDao;
import com.ssm.entity.MainModel;
import com.ssm.service.MainModelService;

import javax.annotation.Resource;

@Service("mainModelService")
public class MainModelServiceImpl implements MainModelService {

	@Resource(name = "mainModelDao")
	private MainModelDao mainModelDao;
	@Override
	public List<MainModel> selectOrderManagement() {
		return mainModelDao.selectOrderManagement();
	}

	@Override
	public List<String> selectAllOrCoNo() {
		return mainModelDao.selectAllOrCoNo();
	}

	@Override
	public MainModel selectByCoNo(String co_no) {
		return mainModelDao.selectByCoNo(co_no);
	}

	@Override
	public List<MainModel> selectLikeCoNo(String co_no) {
		return mainModelDao.selectLikeCoNo(co_no);
	}

	@Override
	public List<MainModel> findMainModelList(String co_no,Integer page, Integer pageSize){
		Map<String,Object> map=new HashMap<>();
		map.put("pageRow",page*pageSize);
		map.put("pageSize",pageSize);
		map.put("co_no",co_no);
		return mainModelDao.findMainModelList(map);
	}

}
