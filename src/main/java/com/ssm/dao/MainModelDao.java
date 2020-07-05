package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssm.entity.MainModel;

@Repository("mainModelDao")
public interface MainModelDao {
	//查询所有
	public List<MainModel> selectOrderManagement();
	//查询物料信息
	public List<String> selectAllOrCoNo();
	//查询
	public MainModel selectByCoNo(String co_no);
	//模糊查询
	public List<MainModel> selectLikeCoNo(String co_no);
	//单个查询
	public List<MainModel> findMainModelList(Map<String,Object> map);
}
