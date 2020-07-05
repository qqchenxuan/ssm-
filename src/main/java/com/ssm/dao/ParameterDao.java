package com.ssm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.entity.Parameter;

@Repository("parameterDao")
public interface ParameterDao {
	//查询所有
	public List<Parameter> selectParameter(); 
	//查询单个
	public Parameter selectParameterOne(int SerialID);
	//更新
	public void updateParameter(Parameter Parameter);
}
