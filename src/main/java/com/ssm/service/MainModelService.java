package com.ssm.service;

import java.util.List;

import com.ssm.entity.MainModel;

public interface MainModelService {
	//查询所有
	public List<MainModel> selectOrderManagement();
	//查询物料信息
	public List<String> selectAllOrCoNo();
	//查询
	public MainModel selectByCoNo(String co_no);
	//模糊查询
	public List<MainModel> selectLikeCoNo(String co_no);
	//单个查询
	public List<MainModel> findMainModelList(String co_no,Integer page, Integer pageSize);
}
